app.controller('profileCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    //console.log($scope.loggedindetails);
    //$scope.userInfo ='';
    $scope.getUserInfo = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "user/"+$scope.loggedindetails.id,
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            //console.log(data.email);
            $scope.userInfo =data.user_details;
            //console.log($scope.allcat);

            console.log($scope.userInfo.email);



        });

    }
    $scope.getUserInfo();
    $scope.textBox = {
        first_name: {
            mode: "text"

        },
        last_name: {
            mode: "text",

        },
        email: {
            mode: "email",

        },
        username: {
            mode: "text",

        },
        phone: {
            mode: "number",

        }
    };

    $scope.textArea = {
        height: 90
    };

    $scope.emailValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };

    $scope.validateAndSubmit = function(params) {

        //alert(1);
        //console.log(params);
        //var result = params.validationGroup.validate();
        //if(result.isValid) {
            $http({
                method: "PUT",
                url: $rootScope.serviceurl+"users/"+$scope.loggedindetails.id,
                data: {"email":$scope.userInfo.email,"phone":$scope.userInfo.phone,"about_me":$scope.userInfo.about_me,"first_name":$scope.userInfo.first_name,"last_name":$scope.userInfo.last_name},
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                console.log(data);
                if(data.type == 'success'){
                    var message = data.message;
                    //params.validationGroup.reset();
                    //$location.path('/login');
                    $scope.getUserInfo();
                    DevExpress.ui.notify({
                        message: "Edited Successfilly",
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "success", 3000);
                }else{
                    var message = "Error occured.";
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
       // }
    };



});