@isTest
public class artistCatalogTest {
    @isTest
    static void testQueryString(){
        String res = artistCatalogController.sanitizeQueryString(null);
        System.assertEquals('%', res);
        
        String emptyRes = artistCatalogController.sanitizeQueryString(' ');
        System.assertEquals('%', emptyRes);
        
        String pRes = artistCatalogController.sanitizeQueryString('Im a test');
        System.assertEquals( '%Im%a%test%', pRes);
    }
    
    @isTest
    static void testArtistList(){
        Contact artist = new Contact();
        artist.FirstName = 'test';
        artist.LastName = 'test';
        artist.RecordTypeId = '0121U000000jO3pQAE';
        insert artist;
        
        List<Contact> res = artistCatalogController.allArtists('tes');
        System.assert(res.size()!=0);
    }
    
       @isTest
    static void testUserList(){
        Contact user = new Contact();
        user.LastName = 'test';
        user.RecordTypeId = '0121U000000jO0gQAE';
        insert user;
        
        List<Contact> res = artistCatalogController.allUsers('tes');
        System.assert(res.size()!=0);
    }
    
    @isTest
    static void testAlbumsnadSongs(){
        Contact artist = new Contact();
        artist.LastName = 'test';
        insert artist;
        
        Album__c album = new Album__c();
        album.Name = 'test';
        album.Artist__c=artist.Id;
        insert album;
        
        Song__c song = new Song__c();
        song.Name='test';
        song.Album__c = album.Id;
        insert song;
        
        List<Contact> albums = artistCatalogController.getAlbumList(artist.Id);
        System.assert(albums.size()==1);
        List<Album__c> songs = artistCatalogController.getSongList(album.Id);
        System.assert(songs.size()==1);
    }
    
  
}