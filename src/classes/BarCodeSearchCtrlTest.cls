@isTest
private class BarCodeSearchCtrlTest {
	
	@isTest static void oneMatch() {
		// Implement test code
		createTestData();
		PageReference tpageRef = Page.BarCodeSearch;
  		Test.setCurrentPage(tpageRef);

  		ApexPages.currentPage().getParameters().put('objectName', 'QR_Code_Example__c');
  		ApexPages.currentPage().getParameters().put('fieldName', 'External_Id__c');
  		ApexPages.currentPage().getParameters().put('fieldValue', '1');

  		BarCodeSearchCtrl BCSC = new BarCodeSearchCtrl();

	}
	
	@isTest static void noMatch() {
		// Implement test code
		createTestData();
		PageReference tpageRef = Page.BarCodeSearch;
  		Test.setCurrentPage(tpageRef);

  		ApexPages.currentPage().getParameters().put('objectName', 'QR_Code_Example__c');
  		ApexPages.currentPage().getParameters().put('fieldName', 'External_Id__c');
  		ApexPages.currentPage().getParameters().put('fieldValue', '9');

  		BarCodeSearchCtrl BCSC = new BarCodeSearchCtrl();
	}

	@isTest static void twoMatch() {
		// Implement test code
		createTestData();
		insert new QR_Code_Example__c(External_Id__c='1');

		PageReference tpageRef = Page.BarCodeSearch;
  		Test.setCurrentPage(tpageRef);

  		ApexPages.currentPage().getParameters().put('objectName', 'QR_Code_Example__c');
  		ApexPages.currentPage().getParameters().put('fieldName', 'External_Id__c');
  		ApexPages.currentPage().getParameters().put('fieldValue', '1');

  		BarCodeSearchCtrl BCSC = new BarCodeSearchCtrl();
	}




	public static void createTestData(){
		list<QR_Code_Example__c> codes = new list<QR_Code_Example__c>();

		codes.add(new QR_Code_Example__c(External_Id__c='1'));
		codes.add(new QR_Code_Example__c(External_Id__c='2'));
		codes.add(new QR_Code_Example__c(External_Id__c='3'));
		codes.add(new QR_Code_Example__c(External_Id__c='4'));
		codes.add(new QR_Code_Example__c(External_Id__c='5'));

		insert codes;

	}
	
}