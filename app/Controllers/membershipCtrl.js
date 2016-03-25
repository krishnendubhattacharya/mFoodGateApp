'use strict';
/** 
 * controllers used for the login
 */
app.controller('membershipCtrl', function ($rootScope, $scope, $http, $location) {

    $scope.membershipList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMerchantPromo",
        }).success(function (data) {

            $scope.voucherInfo =data.getMerchantPromo;
            //console.log($scope.catInfo);

        });
    }
    $scope.membershipList();





   
});

