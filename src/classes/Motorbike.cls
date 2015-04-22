public with sharing class Motorbike extends Vehicle implements Merchandise
{
	private static final List<String> fields = Utilities.getSObjectFields('Motorbike__c');

	public Motorbike()
	{
		Dto = new Motorbike__c();
	}

	public Motorbike(Id id)
	{
		Dto = Database.query('SELECT ' + Utilities.getFieldListAsString(fields) + ' FROM Motorbike__c where Id = :id');
	}

	public Motorbike(Motorbike__c motorbikeDto)
	{
		Dto = motorbikeDto;
	}

	public override PageReference getViewPage()
	{
		return new ApexPages.StandardController((Motorbike__c) Dto).view();
	}

	public override MyTransaction createTransaction(Decimal amount)
	{
		MyTransaction transact = new MyTransaction();
		transact.setMotorbikeTransaction();
		transact.setAmount(amount);
		return transact;
	}

	public void sendToWarehouse()
	{
		System.debug('Motorbike sent to warehouse');
	}
}