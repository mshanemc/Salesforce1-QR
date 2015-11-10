public with sharing class BarCodeSearchCtrl {
	
	public id redirectId {get;set;}
	public list<sObject> multipleResultList {get;set;}
	public string searchResult {get;set;}

	public BarCodeSearchCtrl(){
		string objectName = ApexPages.CurrentPage().getParameters().get('objectName');
		string fieldName = ApexPages.CurrentPage().getParameters().get('fieldName');
		string fieldValue = ApexPages.CurrentPage().getParameters().get('fieldValue');

        system.debug('url:' + ApexPages.currentPage().getURL());
		system.debug('objectName:' + objectName);
		system.debug('fieldName:' + fieldName);
		system.debug('fieldValue:' + fieldValue);

		string query = 'select id, Name from ' + objectName + ' where ' + fieldName + ' = \'' + fieldValue + '\'';
		system.debug(query);

		List<sObject> sobjList = Database.query(query);

		if (sobjList.size()==0){
			searchResult = 'no matches';
		} else if (sobjList.size()==1){
			searchResult = 'match';
			redirectId = (Id)sobjList[0].get('Id');
		} else if (sobjList.size()>1){
			searchResult = 'Multiple matches found';
			multipleResultList = sobjList;
		}

	}
}