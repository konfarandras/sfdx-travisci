@isTest
private class mytest {

@isTest
static void myUnitTest() {
	TEL_Case__c c = new TEL_Case__c();
	myclass demo = new myclass();
	System.assertEquals(demo.getAppVersion(), '1.1.0');
}

}
