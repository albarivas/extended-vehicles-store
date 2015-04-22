public with sharing class Car extends Vehicle implements Merchandise
{
	private static final List<String> fields = Utilities.getSObjectFields('Car__c');

	public Car()
	{
		Dto = new Car__c();
	}

	public Car(Id carId)
	{
		Dto = Database.query('SELECT ' + Utilities.getFieldListAsString(fields) + ' FROM Car__c where Id = :carId');
	}

	public Car(Car__c carDto)
	{
		Dto = carDto;
	}

	public override PageReference getViewPage()
	{
		return new ApexPages.StandardController((Car__c) Dto).view();
	}

	public override MyTransaction createTransaction(Decimal amount)
	{
		MyTransaction transact = new MyTransaction();
		transact.setCarTransaction();
		transact.setAmount(amount);
		return transact;
	}

	public void sendToWarehouse()
	{
		System.debug('Car sent to warehouse');
	}
}