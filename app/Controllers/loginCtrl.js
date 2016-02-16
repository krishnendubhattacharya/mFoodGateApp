'use strict';
/** 
 * controllers used for the login
 */
app.controller('loginCtrl', function ($rootScope, $scope, $http, $location, myAuth, $cookieStore) {

   var user_type = ["Merchant", "Client"];
$scope.textBox = {
        first_name: {
        placeholder: "Enter First Name",
        mode: "text",
        bindingOptions: { value: 'first_name' },
               
        },
        last_name: {
        placeholder: "Enter Second Name",
        mode: "text",
              
        },
        email: {
        placeholder: "Enter Email",
        mode: "email",
               
        },
        username: {
        placeholder: "Enter Username",
        mode: "text",
               
        },
        password: {
        placeholder: "Enter Password",
        mode: "password",
                 
        }
};

$scope.validateAndSubmit = function(params) {
          
        
    var result = params.validationGroup.validate();    
    if(result.isValid) {
        $http({
                method: "POST",
                url: $rootScope.serviceurl+"users/login",
                data: {"email":$scope.email,"password":$scope.password},
                headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
                console.log(data);
                if(data.type == 'success'){
                        $scope.loggedindetails = '';
                        var message = data.message;
                        params.validationGroup.reset();
                        $cookieStore.put('users', data.user_details); 
                        $scope.user_username = '';
                        $scope.user_password = '';
                        myAuth.updateUserinfo(myAuth.getUserAuthorisation());
                        $scope.loggedindetails = myAuth.getUserNavlinks();
                        //console.log('hiiiiiiiiii');
                        $rootScope.$emit('updateLoginDetails');
                        $scope.loggedin = true;
                        $scope.notloggedin = false;
                        //console.log($scope.loggedindetails);
                        $location.path('/');
                        DevExpress.ui.notify({
                            message: message,
                            position: {
                                my: "center top",
                                at: "center top"
                            }
                        }, "success", 3000);                      
                }else{
                        var message = "Login failed.";
                        DevExpress.ui.notify({
                            message: message,
                            position: {
                                my: "center top",
                                at: "center top"
                            }
                        }, "error", 3000);
                }                
                
        })
        
        //form.submit();
        //params.validationGroup.reset();
    }
};





$scope.emailValidationRules = {
    validationRules: [{
        type: "required",
        message: "Email is required"
    }]
};  



$scope.passwordValidationRules = {
    validationRules: [{
        type: "required",
        message: "Password is required"
    }]
};
   
});

