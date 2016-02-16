'use strict';
/** 
 * controllers used for the register
 */
 
app.controller('registerCtrl', function ($rootScope, $scope, $http, $location) {
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
$scope.radioGroup = {
        changeLayout: {
        items: user_type,
        value: user_type[0],
        layout: "horizontal"
        }
};
$scope.validateAndSubmit = function(params) {
        
        
    var result = params.validationGroup.validate();    
    if(result.isValid) {
        $http({
                method: "POST",
                url: $rootScope.serviceurl+"users",
                data: {"email":$scope.email,"password":$scope.password,"user_type_id":$scope.user_type_id,"activation_url":"http://107.170.152.166/mFood/activation"},
                headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
                console.log(data);
                if(data.type == 'success'){
                        var message = data.message;
                        params.validationGroup.reset(); 
                        $location.path('/login'); 
                        DevExpress.ui.notify({
                            message: "Added Successfilly, please check your email for account activation",
                            position: {
                                my: "center top",
                                at: "center top"
                            }
                        }, "success", 3000);                     
                }else{
                        var message = "Email or Username already exist.";
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



/*$scope.firstNameValidationRules = {
    validationRules: [{
        type: "required",
        message: "First name is required"
    }]
};

$scope.lastNameValidationRules = {
    validationRules: [{
        type: "required",
        message: "Last name is required"
    }]
};*/

$scope.emailValidationRules = {
    validationRules: [{
        type: "required",
        message: "Email is required"
    }]
};  

/*$scope.usernameValidationRules = {
    validationRules: [{
        type: "required",
        message: "Username is required"
    }]
};*/

$scope.passwordValidationRules = {
    validationRules: [{
        type: "required",
        message: "Password is required"
    }]
};
   
   
});

