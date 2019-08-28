public class artistCatalogController {
       
    @TestVisible
    static String sanitizeQueryString(String aQuery) {
        if (aQuery == null){
            return '%';
        }
        String trimmedQuery = aQuery.trim();
        if (trimmedQuery.length() == 0){
            return '%';
        }
        return '%' + trimmedQuery.replaceAll('\\W+', '%') + '%';
    }
    
    @AuraEnabled
    public static List<Contact> allArtists(String nameFilterString) {
        String composedFilter = sanitizeQueryString(nameFilterString);
        return [SELECT Name,Id,Profile_pic__c FROM Contact WHERE Name LIKE :composedFilter AND RecordType.Name='Artist'];
    } 
    
        @AuraEnabled
    public static List<Contact> allUsers(String nameFilterUsers) {
         String composedFilter = sanitizeQueryString(nameFilterUsers);
        return [SELECT Name,Id,Profile_pic__c,Email FROM Contact WHERE Name LIKE :composedFilter AND RecordType.Name='User'];
    } 
    
    
    @AuraEnabled
    public static List<Contact> getAlbumList(String artistID){ 
        return [SELECT (SELECT Id, Name, Description__c,Cover__c,Release_Year__c FROM Albums__r) FROM Contact WHERE Id=:artistID];
    }
    
    @AuraEnabled
    public static List<Album__c> getSongList(String albumID){ 
        return [SELECT (SELECT Name, Duration__c FROM Songs__r) FROM Album__c WHERE Id=:albumID];
    }

    
}