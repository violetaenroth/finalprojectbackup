@isTest
public class complainTest {
    
     @isTest
    static void searchContactTest(){
        Contact testContact = new Contact();
        testContact.LastName = 'Testing';
        testContact.Email = 'johntestdata@mail.com';
        insert testContact;
        Boolean res = complainControler.searchContacts('johntestdata@mail.com');
        System.assertEquals(false, res);   
        Boolean resNeg = complainControler.searchContacts('idontexist@void.com');
         System.assertEquals(true, resNeg);  
    }
    
    @isTest
    static void getContactTest(){
        Contact testContact = new Contact();
        testContact.LastName = 'Testing';
        testContact.Email = 'johntestdata@mail.com';
        insert testContact;
        
        Contact res = complainControler.getContactInformation('johntestdata@mail.com');
        System.assert(res.Id!=null); 
        
        Contact negRes = complainControler.getContactInformation('imnotavalidemailaddress@mail.com');
        System.assertEquals(null, negRes);
        
    }

    
    @isTest
    static void CreateContactTest(){
        Contact newContact = complainControler.CreateContact('Name', 'Last','johndoe@mail.com','City', 'State', 'Country', '1234', 'Street');
        List<Contact> contList = [SELECT Id FROM Contact WHERE Email=:'johndoe@mail.com' AND LastName=:'Last'];
        System.assertEquals(1, contList.size());
    }
    
     @isTest
    static void CreateCaseTest(){
        Contact newContact = new Contact(LastName = 'LastName');
        insert newContact;
        Case newCase = complainControler.CreateCase(newContact, 'web', 'Bug', 'description', '', 'test','mail@mail.com');
        List<Case> cases = [SELECT Id FROM Case WHERE ContactId=:newContact.Id];
        System.assertEquals(1, cases.size());
    }
    
    @isTest
    static void mainTest(){
        Contact newcont = new Contact (LastName = 'Test',Email='mail@test.com');
        insert newcont;
        
        Case testCase = complainControler.createCase('Name', 'Test', 'mail@test.com', 'bug', 'description', '', 'Web', 'MailingCity', 'MailingState', 'MailingCountry', 'MailingPostalCode', 'MailingStreet', 'subject');
        List<Case> caseList = [SELECT Id FROM Case WHERE ContactId=:newcont.id];
        System.assertEquals(1, CaseList.size());
        
         
        Case testNegCase = complainControler.createCase('Name', 'LastName', 'test@test.com', 'bug', 'description', '', 'Web', 'MailingCity', 'MailingState', 'MailingCountry', 'MailingPostalCode', 'MailingStreet', 'subject');
        List<Contact> cont = [SELECT Name FROM Contact WHERE Email=:'test@test.com'];
        System.assertEquals(1, cont.size());
    }
    
    

}