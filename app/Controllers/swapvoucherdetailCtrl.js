app.controller('swapvoucherdetailCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    console.log($stateParams.voucherId);
    $scope.voucherInfo = null;

    $scope.getSwapVoucherDetail = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "swapdetails/"+$stateParams.swapId,
        }).success(function (data) {
            console.log(data);
            $scope.voucherInfo =data;
        });

    }
    $scope.getSwapVoucherDetail();









});