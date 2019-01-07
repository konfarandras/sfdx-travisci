({
    doInit : function(component, event, helper) {
        helper.doAction('getCaseList', null, 'error', component, helper, function(res) {
            component.set('v.list', res);
        });
    },

    add : function(component, event, helper) {
        helper.doAction('createCase', null, 'error', component, helper, function(res) {
            location.reload();
        });
    }
})
