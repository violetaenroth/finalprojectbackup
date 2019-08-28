({
    check : function(component, event, helper){
        helper.checkPassword(component);
    },
    
    
	clickCreate: function(component, event, helper) {
        var validExpense = component.find('regform').reduce(function (validSoFar, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        if(validExpense){
            helper.saveRecord(component);
        }
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
    },
    
            
    
   closeModel: function(component, event, helper) {
      component.set('v.modalIsOpen', false);
        $A.get('e.force:refreshView').fire();
   },

        
})