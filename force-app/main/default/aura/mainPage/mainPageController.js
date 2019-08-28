({ 
    showInfo : function(component, event, helper) {
        var validInput = component.find('logform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validInput){
            helper.queryInfo(component);
        }
    },
   
    
    renewSubs : function (component, event, helper) {
        helper.subsRenewal(component); 
    },
    
    
    openAlbumForm : function (component, event, helper) {
        component.set('v.createAlbum', true); 
        var btnAlbum = component.find('albumClick');
        $A.util.addClass(btnAlbum, 'slds-hide');
    },
    
    saveAlbum : function(component, event, helper) {
        var validInput = component.find('regform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validInput){
            helper.createAlbum(component); 
        }
    },
    
    
    openSongForm : function (component, event, helper) {
        component.set('v.createSong', true); 
        var btnSong = component.find('songClick');
        $A.util.addClass(btnSong, 'slds-hide');
        helper.getRelatedAlbums(component);
    },
    
    saveSong : function(component, event, helper) {
        var validInput = component.find('regformSong').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validInput){
            helper.createSong(component); 
        }
    },
    
  
    closeModel: function(component, event, helper) {
        component.set('v.modalUpload', false);
        component.set(component.find('songClick'),'slds-show');
        component.set(component.find('albumClick'),'slds-show');
    },
    
    
    closeModelSubs: function(component, event, helper) {
        component.set('v.modalSubs', false);
    },
    
    handleFilesChange : function (component, event, helper) {
        var files = event.getSource().get('v.files');
        if(files){
            var file = files[0]
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function () {
                var template = component.get('v.avatar');
                template += '<img src="'+reader.result+'"/>';
                component.set('v.avatar',template);
            };
            reader.onerror = function (error) {
                console.log('Error: ', error);
            };
        }
    }
    
})