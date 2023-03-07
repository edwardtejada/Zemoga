@isTest
public class AccountTriggerTest {
    
    @testSetup
    static void makeData(){
        Property__c property = new Property__c();
        property.Name = 'Test Property';
        insert property;

        Account account = new Account();
        account.Name = 'Test account';
        account.Property__c = property.Id;
        insert account;
    }

    @isTest
    static void updatePropertyFieldTest(){
        List<Account> account = [
            SELECT Id, Name
            FROM Account
        ];
        account[0].Name = 'Test account 1';
        update account;

        List<Property__c> property = [
            SELECT Id, Name, Account_Name__c
            FROM Property__c
        ];
        System.assertEquals(property[0].Account_Name__c, 'Test account 1');
    }
}