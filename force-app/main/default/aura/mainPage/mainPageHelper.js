({
    queryInfo : function(component) {
        var action = component.get('c.getAccount');
        action.setParams({
            'password': component.get('v.password')
        });
        
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                if(response.getReturnValue()!=null){
                    component.set('v.account', response.getReturnValue().Name);
                    component.set('v.contactId',response.getReturnValue().Contacts[0].Id);
                    component.set('v.activeSub', response.getReturnValue().Active_subscription__c);
                    component.set('v.purchaseDate', response.getReturnValue().Purchase_date__c);
                    component.set('v.expDate',response.getReturnValue().Expiration_date__c);
                    component.set('v.profilePic',response.getReturnValue().Profile_Pic__c);
                }
            }else{
                console.log('FAIL');		
                alert('Account not found. Please check your login credentials and try again.');
            }
            if(response.getReturnValue().Type=='User'){
                component.set('v.homeUserIsOpen',true);
                component.set('v.logIsOpen', false);
            } else if(response.getReturnValue().Type=='Artist'){
                component.set('v.homeArtistIsOpen',true);
                component.set('v.logIsOpen', false);
            }
        });
        $A.enqueueAction(action);
    },
    
    
    
    subsRenewal : function(component){
        var stat = component.get('v.activeSub');
        if(stat==true){
            alert('Your subscription is still active :)');
        }else{
            var action = component.get('c.renewSubscription');
            action.setParams({
                'password': component.get('v.password')
            });
            action.setCallback(this,function(response){
                if(response.getState()==='SUCCESS'){
                    if(response.getReturnValue()!=null){
                        component.set('v.modalSubs',true);
                    }
                }else{
                    console.log('FAIL');
                }
            });
            $A.enqueueAction(action);
        }
    },
    
    
    
    createAlbum : function(component){
        	var albumBtn = component.find('albumClick');
            var action = component.get('c.createAlbum');
            action.setParams({
                'name' : component.get('v.albumName'),
                'releaseYear': component.get('v.albumReleaseYear'),
                'description' : component.get('v.albumDescription'),
                'artistID' : component.get('v.contactId'),
                'cover' : component.get('v.cover')
            });
        console.log('Cover'+component.get('v.cover'));
            action.setCallback(this,function(response){
                if(response.getState()==='SUCCESS'){
                    if(response.getReturnValue()!=null){
                        $A.util.removeClass(albumBtn, 'slds-hide');
                        component.set('v.createAlbum', false);
                        component.set('v.modalUpload', true);
                        
                        //Clears input values for new register
                        component.set('v.albumName','');
                        component.set('v.albumDescription','');
                        component.set('v.cover','');            
                    }
                }else{
                    console.log('FAIL');
                }
            });
            $A.enqueueAction(action);
    },
    
    
    getRelatedAlbums : function (component){
        var action = component.get('c.getAlbumList');
            action.setParams({
                'artistID' : component.get('v.contactId')
            });
            action.setCallback(this,function(response){
                if(response.getState()==='SUCCESS'){
                    if(response.getReturnValue()!=null){
                        component.set('v.Albums',response.getReturnValue()[0].Albums__r);
                    }
                }else{
                    console.log('FAIL');
                }
            });
            $A.enqueueAction(action);
    },
    
    
        createSong : function(component){
            var songBtn = component.find('songClick');
            var action = component.get('c.createSong');
            action.setParams({
                'name' : component.get('v.songName'),
                'duration': component.get('v.songDuration'),
                'album' : component.find('selectedOption').get('v.value')
            });
            action.setCallback(this,function(response){
                if(response.getState()==='SUCCESS'){
                    if(response.getReturnValue()!=null){
                        $A.util.removeClass(songBtn, 'slds-hide');
                        component.set('v.createSong', false);
                        component.set('v.modalUpload', true);
                        
                        //Clears input values for new register
                        component.set('v.songName','');
                        component.set('v.songDuration','');
                    }
                }else{
                    console.log('FAIL');
                }
            });
            $A.enqueueAction(action);
    },
    
    
    
})