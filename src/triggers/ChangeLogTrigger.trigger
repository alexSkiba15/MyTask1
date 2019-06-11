/**
 * Created by Alex on 10.06.2019.
 */

trigger ChangeLogTrigger on Car__c (after insert, before update ) {
    CustomLock__c lock = new CustomLock__c();
    for (Car__c c : Trigger.new) {
        if (Trigger.isInsert) {
            lock.LogChange__c = 'Brand:\"' + c.Brand__c + '\", Model:\"'
                    + c.Model__c + '\", Price:\"' + c.Price__c + '\", Year:\"' + c.Year__c + '\".';
        }
        if (Trigger.isUpdate) {
            lock.LogChange__c += '\n Old ' + c.description__c + '\n New Brand:\"' + c.Brand__c + '\", Model:\"'
                    + c.Model__c + '\", Price:\"' + c.Price__c + '\", Year:\"' + c.Year__c + '\".';
        }
    }
}