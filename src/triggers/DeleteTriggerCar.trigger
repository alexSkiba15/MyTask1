/**
 * Created by Alex on 11.06.2019.
 */

trigger DeleteTriggerCar on Car__c (before delete) {
    if (Trigger.isBefore && Trigger.isDelete) {
        List <Car__c> carsList1 = new List<Car__c>();
        Integer counter = 0;
        carsList1 = Database.query('SELECT Brand__c FROM Car__c');
        for (Integer i = 0; carsList1.size() > i; i++) {
            if (carsList1.get(i).Brand__c == Trigger.old[0].Brand__c) {
                counter++;
            }
        }
        if (counter == 1) {
            for (Car__c ta : Trigger.old) {
                ta.addError('Сan not remove the last car of this brand');
            }
            Trigger.old[0].addError('Сan not remove the last car of this brand.');
        }
    }
}
