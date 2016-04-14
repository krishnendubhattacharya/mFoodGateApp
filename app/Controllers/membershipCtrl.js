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

    $scope.newPromoList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLaunchTodayMembership",
        }).success(function (data) {
            $scope.newPromoInfo = data.todayPromo;
            $scope.newPromoCount = data.count;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.newPromoList();

    $scope.hotSellingList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getHotSellingMembership",
        }).success(function (data) {
            $scope.hotSellingInfo = data.getHotSellingPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.hotSellingList();

    $scope.lastDayPromoList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLastdayMembership",
        }).success(function (data) {
            $scope.lastDayPromoInfo = data.lastdayPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.lastDayPromoList();




    $scope.specialList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getSpecialMembership",
        }).success(function (data) {
            $scope.specialInfo = data.getSpecialPromo;
            //console.log($scope.specialInfo);

        });
    }
    $scope.specialList();





   
});

