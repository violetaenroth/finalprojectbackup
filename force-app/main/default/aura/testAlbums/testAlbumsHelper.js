({
	getAlbums : function(component) {
        component.set('v.showAlbums',true);
        var btnShow = component.find('showButton');
        var btnHide = component.find('hideButton');
        var action = component.get('c.getAlbumList');
        action.setParams({
            artistID : component.get('v.artistID')
        });
        action.setCallback(this, function(response){
            if(response.getState()=="SUCCESS"){
                if(response.getReturnValue()!=null){
                    $A.util.addClass(btnShow, 'slds-hide');
                    $A.util.removeClass(btnHide, 'slds-hide');
                    component.set('v.albumList',response.getReturnValue()[0].Albums__r);                
                }
            }else{
                console.log('FAIL');
            }
        });
        $A.enqueueAction(action);

		
	}
})