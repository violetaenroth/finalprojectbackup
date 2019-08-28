({
    getSongDetails : function(component, event, helper) {    
        helper.getSongs(component);
    },
    
    hideSong : function(component, event, helper){
        component.set('v.showSongs',false);
        var btnShow = component.find('showButton');
        $A.util.removeClass(btnShow, 'slds-hide');
        var btnHide = component.find('hideButton');
        $A.util.removeClass(btnShow, 'slds-show');
    }
})