public with sharing class TCService {

@AuraEnabled
public static string createCase(){
	TCase__c c = new TCase__c();
    c.Contact_Email__c = 'konfar.andras@united-consult.hu';
	insert c;
	return c.Id;
}

@AuraEnabled
public static List<TCase__c> getCaseList(){
	List<TCase__c> cases = [SELECT Id, Name, Contact_Email__c FROM TCase__c ORDER BY Name];
    return cases;
}

}
