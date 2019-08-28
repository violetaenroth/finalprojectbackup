({
    checkPassword : function(component){
        var passConfirm = component.get('v.passwordConfirm');
        if(component.get('v.password')!=passConfirm){
            var button = component.find('regButton');
            button.set('v.disabled',true);
            alert('Password confirmation mismatch. Please try again');
        }
    },
    
    
	 saveRecord : function(component) {
        var action = component.get('c.createAccount');
        action.setParams({
            'name':component.get('v.accountName'),
            'firstName':component.get('v.firstName'),
            'lastName': component.get('v.lastName'),
            'email': component.get('v.email'),
            'phone': component.get('v.phone'),
            'password': component.get('v.password'),
            'accType':component.find('selectedOption').get('v.value'),
            'description': component.get('v.description'),
            'MailingCity': component.get('v.MailingCity'),
            'MailingState': component.get('v.MailingState'),
            'MailingCountry': component.get('v.MailingCountry'),
            'MailingPostalCode': component.get('v.MailingPostalCode'),
            'MailingStreet': component.get('v.MailingStreet'),
            'avatar':component.get('v.avatar')
        });
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                if(response.getReturnValue()!=null){
                   console.log('SUCCESS');
                   component.set('v.modalIsOpen', true);
                }
            }else{
                console.log('FAIL');
            }
        });
        $A.enqueueAction(action);
    }
})