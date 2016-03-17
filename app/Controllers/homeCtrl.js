'use strict';
/** 
 * controllers used for the login
 */
app.controller('homeCtrl', function ($rootScope, $scope, $http, $location) {

    $scope.catList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getCategories",
        }).success(function (data) {
            $scope.catInfo =data.category;
            console.log($scope.catInfo);

        });
    }
    $scope.catList();

    $scope.featuredPromoList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getFeaturedCategories",
        }).success(function (data) {
            $scope.featuredCatInfo =data.featuredcat;
            //console.log($scope.featuredCatInfo);

        });
    }
    $scope.featuredPromoList();

    $scope.newPromoList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLaunchTodayPromo",
        }).success(function (data) {
            $scope.newPromoInfo =data.todayPromo;
            $scope.newPromoCount =data.count;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.newPromoList();

    $scope.hotSellingList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getFeaturedCategories",
        }).success(function (data) {
            $scope.hotSellingInfo =data.featuredcat;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.hotSellingList();

    $scope.lastDayPromoList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLastdayPromo",
        }).success(function (data) {
            $scope.lastDayPromoInfo =data.lastdayPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.lastDayPromoList();


    $scope.restaurantList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLastdayPromo",
        }).success(function (data) {
            $scope.restaurantInfo =data.lastdayPromo;
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.restaurantList();
   
});

