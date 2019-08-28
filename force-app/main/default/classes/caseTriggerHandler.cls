public class caseTriggerHandler {
    public static void ContactCase(Case newCase){
        if(newCase.Origin=='Email'){
            List<Contact> cont = [SELECT Name FROM Contact WHERE Email=:newcase.SuppliedEmail LIMIT 1];
            if(cont.size() == 0){
                Contact relatedContact = new Contact();
                relatedContact.LastName = newcase.SuppliedName;
                relatedContact.Email = newcase.SuppliedEmail;
                insert relatedContact; 
                newCase.contactId = relatedContact.Id;
            }
            else{
                newCase.ContactId = cont[0].Id;
            }
        }
    }
    
}