'use strict';
/** 
 * controllers used for the login
 */
app.controller('voucherCtrl', function ($rootScope, $scope, $http, $location) {

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
            url: $rootScope.serviceurl + "getLaunchTodayMenuPromo",
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
            url: $rootScope.serviceurl + "getHotSellingMenuPromo",
        }).success(function (data) {
            $scope.hotSellingInfo = data.getHotSellingPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.hotSellingList();

    $scope.lastDayPromoList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLastdayMenuPromo",
        }).success(function (data) {
            $scope.lastDayPromoInfo = data.lastdayPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.lastDayPromoList();




    $scope.specialList = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getSpecialMenuPromo",
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

    $scope.voucherAllMenuPromo = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getActiveMenuPromo",
        }).success(function (data) {

            $scope.voucherMenuInfo =data.Promo;
            console.log($scope.voucherMenuInfo);

        });
    }
    $scope.voucherAllMenuPromo();




   
});

