({
	init: function(component, event, helper) {
        helper.loadArtistList(component);
        helper.loadUserList(component);
    },
    
    
     handleNameFilterChange: function (component, event, helper) {
        helper.loadArtistList(component);
    },
    
    handleUsernameFilterChange: function (component, event, helper) {
        helper.loadUserList(component);
    }
})