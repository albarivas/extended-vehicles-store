public abstract class Vehicle
{
	// Properties
	public sObject Dto { get; set;}

	// Instance variable
	protected List<String> fields;

	// ABSTRACT: Must be overridden
	public abstract PageReference getViewPage();

	// VIRTUAL: Can be overridden
	public virtual MyTransaction createTransaction(Decimal amount)
	{
		MyTransaction transact = new MyTransaction();
		transact.setAmount(amount);
		return transact;
	}

	public void sell()
	{
		Savepoint sp = Database.setSavepoint();

		try
		{
			if ((boolean) Dto.get('Sold__c') == false)
			{
				// Update sold checkbox
				Dto.put('Sold__c', true);
				update Dto;

				// Add transaction
				Decimal amount = (Decimal) Dto.get('Price__c');
				MyTransaction transact = createTransaction(amount);
				transact.insertTransaction();
			}
		}
		catch (Exception e)
		{
			Dto.put('Sold__c', false);
			Database.rollback(sp);
			throw e;
		}
	}

	public void rent()
	{
		Savepoint sp = Database.setSavepoint();

		try
		{
			if ((boolean) Dto.get('Rented__c') == false)
			{
				// Update rent hours and rented checkbox
				Dto.put('Rented__c', true);
				update Dto;

				// Add transaction
				Decimal pricePerHour = (Decimal) Dto.get('RentingPrice__c');
				Decimal amount = pricePerHour * (Decimal) Dto.get('RentHours__c');
				MyTransaction transact = createTransaction(amount);
				transact.insertTransaction();
			}
		}
		catch (Exception e)
		{
			Dto.put('Rented__c', false);
			Database.rollback(sp);
			throw e;
		}
	}

	public void returnRentedVehicle()
	{
		if ((boolean) Dto.get('Rented__c') == true)
		{
			// Update rent hours and rented checkbox
			Dto.put('Rented__c', false);
			Dto.put('RentHours__c', null);
			update Dto;
		}
	}
}