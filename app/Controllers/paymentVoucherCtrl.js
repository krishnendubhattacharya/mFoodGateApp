'use strict';
/** 
 * controllers used for the login
 */
app.controller('paymentVoucherCtrl', function ($rootScope, $scope, $http, $location) {

    $scope.voucherList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getPromoList",
        }).success(function (data) {

            $scope.voucherInfo =data.getMenuPromo;
            //console.log($scope.catInfo);

        });
    }
    $scope.voucherList();

    $scope.newPromoList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLaunchTodayPaymentPromo",
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
            url: $rootScope.serviceurl + "getHotSellingPaymentPromo",
        }).success(function (data) {
            $scope.hotSellingInfo = data.getHotSellingPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.hotSellingList();

    $scope.lastDayPromoList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLastdayPaymentPromo",
        }).success(function (data) {
            $scope.lastDayPromoInfo = data.lastdayPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.lastDayPromoList();




    $scope.specialList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getSpecialPaymentPromo",
        }).success(function (data) {
            $scope.specialInfo = data.getSpecialPromo;
            //console.log($scope.specialInfo);

        });
    }
    $scope.specialList();

    $scope.voucherExpireSoonList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getExpireSoonPromoList",
        }).success(function (data) {

            $scope.voucherExpireSoonInfo =data.getMenuPromo;
            //console.log($scope.catInfo);

        });
    }
    $scope.voucherExpireSoonList();




   
});

