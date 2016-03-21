'use strict';
/** 
 * controllers used for the login
 */
app.controller('refinerestaurentCtrl', function ($rootScope, $scope, $http, $location, $stateParams) {

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


    $scope.restaurantList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getResturantByCategory/"+$stateParams.categoryId,
        }).success(function (data) {
            $scope.restaurantInfo =data.restaurants;
            console.log($scope.restaurantInfo);

        });
    }
    $scope.restaurantList();

   
});

