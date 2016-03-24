'use strict';
/** 
 * controllers used for the register
 */

app.controller('acceptswapCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, $cookieStore) {




   //console.log($stateParams.userId);
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
                        $cookieStore.put('users', data.user_details);
                        $scope.user_username = '';
                        $scope.user_password = '';
                        myAuth.updateUserinfo(myAuth.getUserAuthorisation());
                        $scope.loggedindetails = myAuth.getUserNavlinks();
                        //console.log('hiiiiiiiiii');
                        console.log($scope.loggedindetails);
                        $rootScope.$emit('updateLoginDetails');
                        $scope.loggedin = true;
                        $scope.notloggedin = false;
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
