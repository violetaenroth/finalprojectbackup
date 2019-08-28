public class homeControler {
    
    @AuraEnabled
    public static Account getAccount(String password){
        Account acc = new Account();
        try{
            acc = [SELECT Name, Active_subscription__c,Purchase_date__c,Type,Profile_Pic__c,Expiration_date__c,(SELECT Id,Name FROM Contacts) FROM Account WHERE Password__c=:password LIMIT 1];  
        }catch (DmlException e) {
            acc = null;
        }
        
        return acc;
    }
    
    
    @AuraEnabled
    public static Album__c createAlbum(String name, String releaseYear, String description, Id artistID, String cover){
        Album__c newAlbum = new Album__c();
        newAlbum.Name = name;
        newAlbum.Release_Year__c = releaseYear;
        newAlbum.Description__c = description;
        newAlbum.Artist__c = artistID;
        newAlbum.Cover__c = cover;
        
        insert newAlbum;
        
        return newAlbum;
    }
    
    
    @AuraEnabled
    public static Date renewSubscription(String password){
        Account acc = [SELECT Name, Purchase_date__c FROM Account WHERE Password__c=:password LIMIT 1];
        acc.Purchase_date__c = System.today();
        update acc;
        return acc.Purchase_date__c; 
    }
    
    @AuraEnabled
    public static List<Contact> getAlbumList(Id artistID){
        try{
        return [SELECT (SELECT Name FROM Albums__r) FROM Contact WHERE Id=:artistID];
        }catch(DmlException e) {
            return null;
        }
    }
    
        @AuraEnabled
    public static Song__c createSong(String name, String duration, String album){
        Album__c albumId = [SELECT Id FROM Album__c WHERE Name=:album LIMIT 1];
        Song__c newSong = new Song__c();
        newSong.Name = name;
        newSong.Duration__c = duration;
        newSong.Album__c = albumId.Id;
        
        insert newSong;
        
        return newSong;
    }
    
    
}