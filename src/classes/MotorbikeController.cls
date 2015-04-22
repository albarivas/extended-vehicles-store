public with sharing class MotorbikeController extends VehicleController
{
	public MotorbikeController(ApexPages.StandardController standardController)
	{
		DomainObject = new Motorbike(standardController.getId());
	}
}