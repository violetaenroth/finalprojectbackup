({	lookForContact: function(component) {
    var action = component.get('c.searchContacts');
    action.setParams({
            'email': component.get('v.email')
        });
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                if(response.getReturnValue()!=null){
                    if(response.getReturnValue()==true){
                			component.set('v.noContact',true);
                    }else{
                        component.set('v.dispForm',true);
                    }
                }
            }else{
                console.log('FAIL');
            }
        });
        $A.enqueueAction(action);
	},
    
    
	saveCases: function (component) {
        var action=component.get('c.createCase');
        action.setParams({
            'firstName':component.get('v.firstName'),
            'lastName': component.get('v.lastName'),
            'email': component.get('v.email'),
            'type': component.find('selectedOption').get('v.value'),
            'description': component.get('v.description'),
            'comments': component.get('v.comments'),
            'caseOrigin': 'Web',
            'MailingCity': component.get('v.MailingCity'),
            'MailingState': component.get('v.MailingState'),
            'MailingCountry': component.get('v.MailingCountry'),
            'MailingPostalCode': component.get('v.MailingPostalCode'),
            'MailingStreet': component.get('v.MailingStreet'),
            'subject':component.get('v.subject')
        });
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                if(response.getReturnValue()!=null){
                    component.set('v.isOpen', true);
                }
            }else{
                console.log('FAIL');
            }
        });
        $A.enqueueAction(action);
    },
  
    closeModel: function(component, event, helper) {
        component.set('v.modalOpen', false);
    }
})