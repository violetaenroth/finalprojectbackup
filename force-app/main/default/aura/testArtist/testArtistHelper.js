({
	getSongs : function(component) {
        var action = component.get('c.getSongList');
        var btnShow = component.find('showButton');
        var btnHide = component.find('hideButton');
        action.setParams({albumID : component.get('v.albumID')});
        action.setCallback(this, function(response){
                if(response.getState()=="SUCCESS"){
                    if(response.getReturnValue()!=null){
                    $A.util.addClass(btnShow, 'slds-hide');
                    $A.util.removeClass(btnHide, 'slds-hide');
                    component.set('v.songList',response.getReturnValue()[0].Songs__r);                
                }
            }else{
                console.log('FAIL');
            }
        });
        $A.enqueueAction(action);
		
	}
})