@IsTest
public class TimelineControllerTest {

    @testSetup
    static void testSetup(){
        Zemoga_Timeline__c zemogaTimeline1 = new Zemoga_Timeline__c();
        zemogaTimeline1.Comment__c = 'Test 1';
        zemogaTimeline1.User__c = UserInfo.getUserId();
        insert zemogaTimeline1;

        Zemoga_Timeline__c zemogaTimeline2 = new Zemoga_Timeline__c();
        zemogaTimeline2.Comment__c = 'Test 2';
        zemogaTimeline2.User__c = UserInfo.getUserId();
        insert zemogaTimeline2;
    }
    
    @isTest
    static void getTimeline() {
        List<Zemoga_Timeline__c> zemogaTimeline = TimelineController.getTimeline();
        System.debug(zemogaTimeline.size() == 2);
    }
}