app.controller('swapinterestedCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    //console.log($scope.loggedindetails);
    //$scope.userInfo ='';

    $scope.textBox = {
        subject: {
            mode: "text"

        },
        voucher_url: {
            mode: "text",

        },
        confirm_password: {
            mode: "text",

        }
    };



    $scope.subjectValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };
    $scope.voucherurlValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };
    $scope.commentValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };

    $scope.validateAndSubmit = function(params) {

        //alert(1);
        //console.log(params);
        var result = params.validationGroup.validate();
        if(result.isValid) {
            alert($scope.subject);
            alert($scope.voucher_url);
            alert($scope.comment);
            //return false;
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"swapinterest",
                data: {"subject":$scope.subject,"voucher_url":$scope.voucher_url,"comment":$scope.comment,"user_id":$scope.loggedindetails.id,"swap_id":$stateParams.swapId},
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

            })

            //form.submit();
            //params.validationGroup.reset();
        }
    };



});