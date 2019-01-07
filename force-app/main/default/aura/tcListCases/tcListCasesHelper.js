({
    doAction : function(name, params, failStr, component, helper, callback) {
        var action = component.get("c."+name);
        
        console.log(action);
        if(params != null) {
            action.setParams(params);
        }
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('Finished: '+name);
                callback(response.getReturnValue());
            } else if (state === "INCOMPLETE") {
                console.log("Incomplete");
            }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    var error = ''
                    try {
                        if(errors[0].message) 
                            error = errors[0].message;
                        else
                            error = errors[0].pageErrors[0].message;
                    }
                    catch(e) {
                        console.log(errors);
                        error = 'Unknown error';
                    }
                    
                    console.error("FAILED: "+name);
                    console.error(failStr+': '+error);
                    helper.fail(component, failStr+': '+error);
                }
        });
        
        $A.enqueueAction(action);
    },
    
    fail : function(component, failStr) {
        console.log(failStr);
        component.set("v.failStr", failStr);
    }
})
