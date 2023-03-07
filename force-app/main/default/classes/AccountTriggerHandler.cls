public class AccountTriggerHandler extends TriggerHandler {

    private list<Account> newAccounts;
    private list<Account> oldAccounts;
    private map<Id, Account> newAccountsMap;
    private map<Id, Account> oldAccountsMap;

    public AccountTriggerHandler() {
        newAccounts = (list<Account>)Trigger.new;
        oldAccounts = (list<Account>)Trigger.old;
        if (Trigger.isInsert || Trigger.isUpdate) newAccountsMap = (map<Id, Account>)Trigger.newMap;
        if (Trigger.isUpdate || Trigger.isDelete) oldAccountsMap = (map<Id, Account>)Trigger.oldMap;
    }

    public override void beforeInsert() {}
    public override void beforeUpdate() {}
    public override void beforeDelete() {}
    public override void afterInsert() {}
    public override void afterUpdate() {
        updatePropertyField();
    }
    public override void afterDelete() {}
    public override void afterUndelete() {}

    private void updatePropertyField() {
        List<Id> propertyIds = new List<Id>();
        for (Account acc : newAccounts) {
            if (acc.Property__c != null) {
                propertyIds.add(acc.Property__c);
            }
        }
        Map<Id, Property__c> propertyMap = new Map<ID, Property__c>([
            SELECT Id, Name
            FROM Property__c
            WHERE Id IN :propertyIds
            WITH SECURITY_ENFORCED
        ]);
        List<Property__c> propertyToUpdate = new List<Property__c>();
        for (Account acc : newAccounts) {
            if (acc.Property__c != null) {
                if (propertyMap.containsKey(acc.Property__c)) {
                    Property__c property = propertyMap.get(acc.Property__c);
                    property.Account_Name__c = acc.Name;
                    propertyToUpdate.add(property);
                }
            }
        }
        if (!propertyToUpdate.isEmpty()) {
            update propertyToUpdate;
        }
    }
}