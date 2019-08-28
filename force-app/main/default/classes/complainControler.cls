public class complainControler {
    
    @AuraEnabled
    public static Boolean searchContacts(String email){
        List<Contact> cont = [SELECT Name FROM Contact WHERE Email =:email];
        if(cont.size()==0){
            return true;
        }else {
            return false;
        }
    }
    
    @AuraEnabled
    public static Case createCase(String firstName, String lastName, String email, String type, String description, String comments,
     String caseOrigin, String MailingCity, String MailingState, String MailingCountry, String MailingPostalCode, String MailingStreet,
     String subject){
        Contact contact = getContactInformation(email);
        if(contact == null){
            contact = CreateContact(firstName, lastName, email, MailingCity, MailingState,MailingCountry,MailingPostalCode,MailingStreet); 
        }
        Case newcase = createCase(contact, caseOrigin, type, description, comments, subject, email);
        return newcase;
    }
    

    public static Contact getContactInformation(String email){
        Contact contact = new Contact();
        try{
            contact = [SELECT Id FROM Contact WHERE Email=:email LIMIT 1];
        }catch(Exception ex){
    	contact = null;
		}
    return contact; 
    }
    
    public static Contact CreateContact(String firstName, String lastName, String email,
    String MailingCity, String MailingState, String MailingCountry, String MailingPostalCode, String MailingStreet){
        Contact newContact = new Contact();
        
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
        newContact.MailingCity = MailingCity;
        newContact.MailingState = MailingState;
        newContact.MailingCountry = MailingCountry;
        newContact.MailingPostalCode = MailingPostalCode;
        newContact.MailingStreet = MailingStreet;
        
        insert newContact;
        return newContact;
    }
    
    public static Case CreateCase(Contact contact, String caseOrigin, String type, String description,
        String comments, String subject, String email){
        Case webToCase = new Case();
        
        webToCase.Status = 'New';
        webToCase.Origin = caseOrigin;
        webToCase.ContactId = contact.Id;
        webToCase.Type = type;
        webToCase.Description = description;
        webToCase.Additional_comments__c = comments;
        webToCase.Subject = subject;
        webToCase.SuppliedEmail = email;
        
        if(type=='Bug'||type=='Complain'){
            webToCase.Priority = 'High';
        }
        
       insert webToCase;
       return webToCase;
    }

}