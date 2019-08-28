@isTest
private class registerTest {
    @isTest
    static void getAccountTest(){
        Account testAccount = new Account();
        testAccount.Name = 'Testing';
        testAccount.Email__c = 'johntestdata@mail.com';
        insert testAccount;
        
        Account res = registerControler.getAccountInformation('johntestdata@mail.com');
        System.assertEquals('Testing', res.Name); 
        
         Account negRes = registerControler.getAccountInformation('imnotevenavalidemailadress@mail.com');
        System.assertEquals(null, negRes);     
        
    }
    
    
    @isTest
    static void CreateAccountTest(){
        Account res = registerControler.CreateAccount('Test Account', 'test@account.com', 'password123', 'User','');
        List<Account> accts = [SELECT Name FROM Account WHERE Name=: 'Test Account' AND Email__c=:'test@account.com'];
        System.assertEquals(accts.size(), 1);
    }
    
    @isTest
    static void createContactTest(){
        Account useracc = new Account();
        useracc.Name = 'User account test';
        insert useracc;
        
        Contact cont = registerControler.createContact(useracc, 'User', 'firstName', 'lastName', 'email@test.com', '1234', 'dummy description',
         'City', 'State', 'Country', 'PostalCode', 'Street','');
        List<Contact> usercont = [SELECT Name FROM Contact WHERE Account.Name=:'User account test' AND RecordType.Name='User'];
        System.assertEquals(usercont.size(), 1);
        
        Account artistacc = new Account();
        artistacc.Name='Artist account test';
        insert artistacc;
        
        Contact conts = registerControler.createContact(artistacc, 'Artist', 'firstName1', 'lastName1', 'email1@test.com', '1234', 'dummy description',
        'City', 'State', 'Country', 'PostalCode', 'Street','');
        List<Contact> artcont = [SELECT Name FROM Contact WHERE Account.Name=:'Artist account test' AND RecordType.Name='Artist'];
        System.assertEquals(artcont.size(), 1);
        
    }
    
    @isTest
    static void mainTest(){
        Account newacc = new Account();
        newacc.Name = 'Test';
        newacc.Email__c = 'testemail@mail.com';
        insert newacc;
        
        Account account = registerControler.createAccount('name', 'firstName', 'lastName', 'testemail@mail.com', '1344', 'password', 'User', 'description',
        'City', 'State', 'Country', 'PostalCode', 'Street','');
        List<Account> accquery = [SELECT Name FROM Account WHERE Password__c=:'password'];
        System.assertEquals(accquery.size(),0);
        
        Account validAccount = registerControler.createAccount('name', 'firstName', 'lastName', 'nottakenemailaddress@mail.com', '1344', 'password123', 'Artist', 'description',
        'City', 'State', 'Country', 'PostalCode', 'Street','');
        List<Account> accts = [SELECT Name FROM Account WHERE Password__c=:'password123'];
        System.assertEquals(accts.size(), 1);
        
    }

}