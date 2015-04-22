public with sharing class CarController extends VehicleController
{
	public CarController(ApexPages.StandardController standardController)
	{
		DomainObject = new Car(standardController.getId());
	}
}