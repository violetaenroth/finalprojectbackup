@isTest
public class triggerHandlerTest {
    
    @isTest
    static void contactCaseTest(){
        Case newCase = new Case(Origin='Email', Status='New', SuppliedEmail='noemailhere@mail.com');
        try{
            insert newCase; 
            Contact contact = [SELECT Id FROM Contact WHERE Email=:'noemailhere@mail.com' LIMIT 1];
        	System.assertEquals(contact.Id, newCase.ContactId); 
        }catch (Exception e){} 
            
    Contact cont = new Contact();
    cont.LastName = 'test';
    cont.Email = 'mail@mail.com';
    insert cont;
    
    Case cas = new Case(Origin='Email', Status='New', SuppliedEmail='mail@mail.com');
        try{
            insert cas;
            List<Case> caseWithContact = [SELECT Id FROM Case WHERE ContactId=:cont.Id];
            System.assertEquals(1, caseWithContact.size());
        }catch(Exception e){}
    }

    
}