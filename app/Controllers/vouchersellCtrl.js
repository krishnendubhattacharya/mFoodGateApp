app.controller('vouchersellCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    //console.log($scope.loggedindetails);
    //$scope.userInfo ='';

    $scope.textBox = {
        price: {
            mode: "text"

        },
        points: {
            mode: "text",

        }
    };



    /*$scope.oldPasswordValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };
    $scope.newPasswordValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };
    $scope.confirmPasswordValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };*/

    $scope.validateAndSubmit = function(params) {

        //alert(1);
        console.log(params);
        //alert($scope.price);
        //alert($scope.points);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
        //var result = params.validationGroup.validate();
       // if(result.isValid) {
            /*$http({
                method: "POST",
                url: $rootScope.serviceurl+"voucher/savesell",
                data: {"price":$scope.price,"points":$scope.points,"voucher_id":$stateParams.voucherId,"user_id":$scope.loggedindetails.id},
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                console.log(data);
                //return false;
                params.validationGroup.reset();
                if(data.type == 'success'){
                    //var message = data.message;
                    //params.validationGroup.reset();
                    //$location.path('/dashboard');

                    DevExpress.ui.notify({
                        message: data.message,
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "success", 3000);
                }else{
                    var message = "Error occured.";
                    DevExpress.ui.notify({
                        message: data.message,
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "error", 3000);
                }

            })*/

            //form.submit();
            //params.validationGroup.reset();
        //}
    };



});