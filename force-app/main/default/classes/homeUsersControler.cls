public with sharing class homeUsersControler {
    
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
        return [SELECT Name,Id FROM Contact WHERE Name LIKE :composedFilter AND RecordType.Name='Artist'];
    } 
    
        @AuraEnabled
    public static List<Contact> allUsers() {
        return [SELECT Name,Id FROM Contact WHERE RecordType.Name='User'];
    } 
}