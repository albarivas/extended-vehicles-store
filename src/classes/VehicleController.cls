public with sharing virtual class VehicleController
{
	// Properties
	public Vehicle DomainObject {get; set;}

	public PageReference sell()
	{
		try
		{
			DomainObject.sell();
			return goBack();
		}
		catch (Exception e)
		{
			ApexPages.addMessage(new Apexpages.Message(ApexPages.Severity.Error,e.getMessage()));
		}
		return null;
	}

	public PageReference rent()
	{
		try
		{
			DomainObject.rent();
			return goBack();
		}
		catch (Exception e)
		{
			ApexPages.addMessage(new Apexpages.Message(ApexPages.Severity.Error,e.getMessage()));
		}
		return null;
	}

	public PageReference returnRentedVehicle()
	{
		try
		{
			DomainObject.returnRentedVehicle();
			return goBack();
		}
		catch (Exception e)
		{
			ApexPages.addMessage(new Apexpages.Message(ApexPages.Severity.Error,e.getMessage()));
		}
		return null;
	}

	public PageReference goBack()
	{
		PageReference viewPage = DomainObject.getViewPage();
		viewPage.setRedirect(true);
		return viewPage;
	}
}