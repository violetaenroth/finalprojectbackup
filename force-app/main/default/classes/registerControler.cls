public class registerControler {
    
     @AuraEnabled
    public static Account createAccount(String name, String firstName, String lastName, String email,
                                       String phone, String password, String accType, String description, 
                                    String MailingCity, String MailingState, String MailingCountry, String MailingPostalCode, String MailingStreet,String avatar){
        Account account = getAccountInformation(email);
        if(account == null){
            account = CreateAccount(name, email, password, accType, avatar); 
        }
        
        Contact newContact = createContact(account, accType, firstName, lastName, email, phone, description, MailingCity, MailingState, MailingCountry, MailingPostalCode, MailingStreet,avatar);
        return account;
    }
    
    
    public static Account getAccountInformation(String email){
        try{
            Account acc = [SELECT Name FROM Account WHERE Email__c=:email LIMIT 1];
            return acc; 
        } catch(Exception e){}
        return null;
    }
    
    
    public static Account CreateAccount(String name, String email, String password, String accType,String avatar){
        Account newAcc = new Account();
        
        newAcc.Name = name;
        newAcc.Email__c = email;
        newAcc.Password__c = password;
        newAcc.Type = accType;
        newAcc.Purchase_date__c = System.today();
        newAcc.Profile_Pic__c = avatar;
        
        insert newAcc;
        return newAcc;
    }
    
    
    public static Contact createContact(Account acc, String accType, String firstName, String lastName, String email, String phone, String description,
     String MailingCity, String MailingState, String MailingCountry, String MailingPostalCode, String MailingStreet, String avatar){
       Contact newContact = new Contact();
        
        Id userTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('User').getRecordTypeId();
        Id artistTypeId = Schema.SObjectType.Contact.getRecordTypeInfosByName().get('Artist').getRecordTypeId();
        
        newContact.AccountId = acc.Id;
        newContact.email = email;
        newContact.Phone = phone; 
        newContact.lastName = lastName;
        newContact.MailingCity = MailingCity;
        newContact.MailingState = MailingState;
        newContact.MailingCountry = MailingCountry;
        newContact.MailingPostalCode = MailingPostalCode;
        newContact.MailingStreet = MailingStreet;
        newContact.Profile_pic__c = avatar;
        
        if(accType=='User'){
            newContact.FirstName = firstName;
            newContact.RecordTypeId = userTypeId;
            
        } else if(accType=='Artist'){
            newContact.Description = description;
            newContact.RecordTypeId = artistTypeId;
        }
        
      insert newContact;
      return null;
    }

}