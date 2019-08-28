({
    check : function(component, event, helper) {
        helper.lookForContact(component);
        var changeElement = component.find('checkButton');
      	$A.util.toggleClass(changeElement, 'slds-hide');
	},
    
    
    saveInfo : function(component, event, helper) {
        component.set('v.noContact',false);
        component.set('v.dispForm', true);
	},
    
    
	saveCase : function(component, event, helper) {
        helper.saveCases(component);
	},
    

	closeModel: function(component, event, helper) {
		component.set('v.isOpen', false);
		 $A.get('e.force:refreshView').fire();
    }
})