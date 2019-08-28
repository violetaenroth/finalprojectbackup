({	
    init: function(component, event, helper) {
        helper.loadArtistList(component);
        helper.loadUserList(component);
    },
    
    
    /*handleClickContactName: function (component, event, helper) {
        var target = event.currentTarget;
        var sfid = target.dataset.sfid;
        
        var navigateEvent = $A.get("e.force:navigateToSObject");
        navigateEvent.setParams({
            "recordId": sfid
        });
        navigateEvent.fire();
    },*/
    
    
    handleNameFilterChange: function (component, event, helper) {
        helper.loadArtistList(component);
    },
    
     handleClickUserName: function (component, event, helper) {
        var target = event.currentTarget;
        var sfid = target.dataset.sfid;
         //window.open('/' + sfid, "width:200,height=100"); 
         window.open('https://spotiforcecommunity-developer-edition.na85.force.com/test/s/contact/'+sfid);
        
        /*var navigateEvent = $A.get("e.force:navigateToSObject");
        navigateEvent.setParams({
            "recordId": sfid
        });
        navigateEvent.fire();*/
    },
 

    
})