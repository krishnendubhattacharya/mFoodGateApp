'use strict';
/** 
 * controllers used for the register
 */
 
app.controller('activationCtrl', function ($rootScope, $scope, $http, $location, $stateParams) {

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

