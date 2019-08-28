({
    getAlbumDetails : function(component, event, helper) {
        helper.getAlbums(component);
    },
    
    hideAlbum : function(component, event, helper){
        component.set('v.showAlbums',false);
        var btnShow = component.find('showButton');
        $A.util.removeClass(btnShow, 'slds-hide');
        var btnHide = component.find('hideButton');
        $A.util.removeClass(btnShow, 'slds-show');
    }
})