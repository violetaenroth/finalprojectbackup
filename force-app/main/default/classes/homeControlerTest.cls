@isTest
public class homeControlerTest {

    @isTest
    static void testGetAccount(){
        Account ac = new Account();
        ac.Name = 'Test';
        ac.Password__c = 'hi';
        insert ac;
        
        Account res = homeControler.getAccount('hi');
        System.assert(res!=null);
        
    }
    
    @isTest
    static void testRenew(){
        Account ac = new Account();
        ac.Name = 'Test';
        ac.Password__c = 'hi';
        ac.Purchase_date__c = Date.newInstance(2016, 12, 9);
        insert ac;
        
        Date res = homeControler.renewSubscription('hi');        
        System.assert(System.today() == res);
    }
    
    @isTest
    static void testCreateAlbum(){
        Contact cont = new Contact();
        cont.LastName = 'Test';
        insert cont;
        
        Album__c res = homeControler.createAlbum('name', '2008', 'description', cont.Id, '');
        List<Album__c> search = [SELECT Name FROM Album__c WHERE Artist__c=:cont.Id];
        System.assertEquals(1, search.size());
    }
    
    @isTest
    static void testGetAlbums(){
        Contact cont = new Contact();
        cont.LastName = 'Test';
        insert cont;
        
        Album__c album= new Album__c();
        album.Name = 'Album';
        album.Artist__c = cont.Id;
        insert album; 
        
        List<Contact> res = homeControler.getAlbumList(cont.Id);
        System.assertEquals(1, res.size());
        
        List<Contact> neg = homeControler.getAlbumList(null);
        System.assertEquals(0, neg.size());
        
    }
    
    @isTest
    static void testCreateSong(){
        Contact cont = new Contact();
        cont.LastName = 'test';
        insert cont; 
        
        Album__c album = new Album__c();
        album.Artist__c = cont.Id;
        album.Name = 'Test';
        insert album;
        
        Song__c song = homeControler.createSong('song','2:13','Test');
        
        List<Album__c> res = [SELECT Number_of_songs__c FROM Album__c WHERE Id=:album.Id];
        System.assertEquals(1, res.size());
    }
}