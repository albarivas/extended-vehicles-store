
public with sharing class MyTransaction
{
	private Transaction__c dto;

	public MyTransaction() {
		dto = new Transaction__c();
	}

	public MyTransaction(Id transactionId) {
		dto = [SELECT Id,Car__c,Motorbike__c,Amount__c from Transaction__c where Id = :transactionId];
	}

	public void setCarTransaction()
	{
		dto.Car__c = true;
	}

	public void setMotorbikeTransaction()
	{
		dto.Motorbike__c = true;
	}

	public void setAmount(Decimal amount)
	{
		dto.Amount__c = amount;
	}

	public void insertTransaction()
	{
		insert dto;
	}
}