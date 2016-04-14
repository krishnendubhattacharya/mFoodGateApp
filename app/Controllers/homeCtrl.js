'use strict';
/** 
 * controllers used for the login
 */
app.controller('homeCtrl', function ($rootScope, $scope, $http, $location) {

    $scope.showAll = false;
    $scope.showAllFunc = function() {
        $scope.catList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getCategories",
            }).success(function (data) {
                $scope.catInfo = data.category;
                console.log($scope.catInfo);

            });
        }
        $scope.catList();

        $scope.featuredPromoList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getFeaturedCategories",
            }).success(function (data) {
                $scope.featuredCatInfo = data.featuredcat;
                //console.log($scope.featuredCatInfo);

            });
        }
        $scope.featuredPromoList();

        $scope.newPromoList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getLaunchTodayPromo",
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
                url: $rootScope.serviceurl + "getHotSellingPromo",
            }).success(function (data) {
                $scope.hotSellingInfo = data.getHotSellingPromo;
                //console.log($scope.newPromoInfo);

            });
        }
        $scope.hotSellingList();

        $scope.lastDayPromoList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getLastdayPromo",
            }).success(function (data) {
                $scope.lastDayPromoInfo = data.lastdayPromo;
                //console.log($scope.newPromoInfo);

            });
        }
        $scope.lastDayPromoList();


        $scope.restaurantList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getFeaturedResturantHome",
            }).success(function (data) {
                $scope.restaurantInfo = data.restaurants;
                //console.log($scope.restaurantInfo);

            });
        }
        $scope.restaurantList();

        $scope.specialList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getSpecialPromo",
            }).success(function (data) {
                $scope.specialInfo = data.getSpecialPromo;
                //console.log($scope.specialInfo);

            });
        }
        $scope.specialList();

        $scope.menuPromoList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getMenuPromo",
            }).success(function (data) {
                $scope.menuPromoInfo = data.getMenuPromo;
                //console.log($scope.menuPromoInfo);

            });
        }
        $scope.menuPromoList();

        $scope.paymentPromoList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getPaymentPromo",
            }).success(function (data) {
                $scope.paymentPromoInfo = data.getPaymentPromo;
                //console.log($scope.menuPromoInfo);

            });
        }
        $scope.paymentPromoList();

        $scope.merchamtMembershipPromoList = function () {

            $http({
                method: "GET",
                url: $rootScope.serviceurl + "getMerchantPromo",
            }).success(function (data) {
                $scope.merchantMembershipPromoInfo = data.getMerchantPromo;
                //console.log($scope.menuPromoInfo);

            });
        }
        $scope.merchamtMembershipPromoList();
        $scope.showAll = true;
    }
    $scope.showAllFunc();
   
});

