app.controller('addswapvoucherCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }


    $scope.swapvoucherADD = function () {
        //$location.path('/giftvoucher/' + $stateParams.voucherId);
        //alert(offer_id);
        //return false;
       // $location.path('/addswapvoucher/' + $stateParams.voucherId + '/' + $stateParams.offerId);
        $http({
            method: "POST",
            url: $rootScope.serviceurl + "swap",
            data: {"voucher_id":$stateParams.voucherId,"user_id":$scope.loggedindetails.id,"offer_id":$stateParams.offerId,"description":$scope.description},
        }).success(function (data) {
            console.log(data);
            if(data.type == 'success'){
                //var message = data.message;
                //params.validationGroup.reset();
                $location.path('/allvoucher');

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
        });
    }




});