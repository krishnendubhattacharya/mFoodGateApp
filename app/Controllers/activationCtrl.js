'use strict';
/** 
 * controllers used for the register
 */
var showText = function (e) {
    DevExpress.ui.notify("Back button clicked", "success", 5000);
};
var menuItemClicked = function (e) {
    DevExpress.ui.notify(e.model.text + " item clicked", "success", 2000);
};
app.controller('activationCtrl', function ($rootScope, $scope, $http, $location, $stateParams) {

    $scope.toolbarItems = [
        { location: 'before', widget: 'button', options: { type: 'back', text: 'Back', onClick: showText }},
        { location: 'menu', text: "Add", onClick: menuItemClicked },
        { location: 'menu', text: "Change", onClick: menuItemClicked },
        { location: 'menu', text: "Remove", onClick: menuItemClicked },
        { location: 'center', text: 'Products' }
    ];

   console.log($stateParams.userId);
   $scope.activateUser = function() {           
        
        //alert(23);
        $http({
                method: "PUT",
                url: $rootScope.serviceurl+"users/activeProfile/"+$stateParams.userId,
                data: {"is_active":"1","is_logged_in":"1"},
                headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
                console.log(data);
                if(data.type == 'success'){
                        var message = "you have successfully logged in";
                        //params.validationGroup.reset(); 
                        $location.path('/');                      
                }else{
                        var message = "Login error.";
                }                
                DevExpress.ui.notify({
                    message: message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "success", 3000);
        })
        
        //form.submit();
        //params.validationGroup.reset();
    
};
   
   
});
