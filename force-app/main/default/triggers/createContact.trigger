trigger createContact on Case (before insert) {
    if(trigger.isInsert){
        caseTriggerHandler.ContactCase(Trigger.new[0]);
    }
}