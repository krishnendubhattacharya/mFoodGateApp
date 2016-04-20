app.controller('swapinterestededitCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
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

    $scope.bidSwapEdit = function () {
        //$location.path('/resaleCancel/' + voucher_resale_id);
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getDetailsSwapBid/"+$stateParams.siid,
            //data: {"id":voucher_resale_id},
        }).success(function (data) {
            //$scope.voucherInfo =data.bid_details;
            //console.log($scope.voucherInfo);
            $scope.item = data.bid_details;
            //$location.path('/editbid/'+bid_id);




        });
    }

    $scope.bidSwapEdit();

    $scope.validateAndSubmit = function(params) {

        //alert(1);
        //console.log(params);
        var result = params.validationGroup.validate();
        if(result.isValid) {
            //alert($scope.subject);
            //alert($scope.voucher_url);
            //alert($scope.comment);
            //return false;
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"updateSwapBid",
                data: {"subject":$scope.item.subject,"voucher_url":$scope.item.voucher_url,"comment":$scope.item.comment,"userid":$scope.loggedindetails.id,"id":$stateParams.siid},
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                console.log(data);
                //return false;
                //params.validationGroup.reset();
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
                    $location.path('/swapvoucher');
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