public with sharing class TimelineController {
    
    @AuraEnabled(cacheable = true)
    public static List<Zemoga_Timeline__c> getTimeline() {
        return [
            SELECT Id, Name, Comment__c, createdby.Name, createdBy.FullPhotoUrl
            FROM Zemoga_Timeline__c
            WHERE User__c = :UserInfo.getUserId()
            WITH SECURITY_ENFORCED
        ];
    }
}