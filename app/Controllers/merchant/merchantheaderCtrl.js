'use strict';
/** 
 * controllers used for the login
 */
app.controller('merchantheaderCtrl', function ($rootScope, $scope, $http, $location, myAuth,mFoodCart, $cookieStore,$stateParams) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
$scope.merchant_id = $stateParams.id;
$scope.res_id = $stateParams.res_id;
//console.log($scope.merchant_id);
//console.log($scope.res_id);
    $scope.getMerResDetail = function() {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMerResDetail/" + $scope.merchant_id+"/"+$scope.res_id+"/"+$scope.loggedindetails.id,
        }).success(function (data) {
            console.log(data);
            $scope.det = data;
            $scope.merchantId = data.merchant_id;
            $scope.resId = data.restaurant_id;
            $scope.memberId = data.member_id;
            //$scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
            //if($scope.datag)
            //$scope.datag.option({dataSource:$scope.voucherInfo});


            //$scope.refresh_grid();
            //$timeout(function(){
            //$scope.datag.refresh();
            //},3000)


        });
    }
    $scope.getMerResDetail();
   
});

