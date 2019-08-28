({
    loadArtistList: function(component) {
        var action = component.get('c.allArtists');
        var nameFilterString = component.find('nameFilter').get('v.value');
        action.setParams({
            nameFilterString: nameFilterString
        });
        action.setCallback(this, function(response) {
            if(response.getState()==='SUCCESS'){
                    if(response.getReturnValue()!=null){
                       component.set('v.artists', response.getReturnValue());
                    }
                }else{
                    console.log('FAIL');
                }
        });
        $A.enqueueAction(action); 
    },
    
    loadUserList: function(component){
      var action = component.get('c.allUsers');
        var nameFilterUsers = component.find('nameFilterUsers').get('v.value');
        action.setParams({
            nameFilterUsers: nameFilterUsers
        });
        action.setCallback(this, function(response) {
                if(response.getState()==='SUCCESS'){
                    if(response.getReturnValue()!=null){
                        component.set('v.users', response.getReturnValue());
                    }
                }else{
                    console.log('FAIL');
                }
        });
        $A.enqueueAction(action); 
    }
})