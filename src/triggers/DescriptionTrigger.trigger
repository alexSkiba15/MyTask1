/**
 * Created by Alex on 10.06.2019.
 */

trigger DescriptionTrigger on Car__c (before insert, before update) {
    for (Car__c c : Trigger.new) {
        c.description__c = 'Brand:\"' + c.Brand__c + '\", Model:\"' + c.Model__c + '\", Price:\"' + c.Price__c + '\", Year:\"' + c.Year__c + '\".';
    }
}