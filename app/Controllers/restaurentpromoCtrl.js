'use strict';
/** 
 * controllers used for the login
 */
app.controller('restaurentpromoCtrl', function ($rootScope, $scope, $http, $location, $stateParams) {


    $scope.resPromoList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getResturantPromo/"+$stateParams.restaurantId,
            //url: $rootScope.serviceurl + "getSpecialPromo",
        }).success(function (data) {
            $scope.restaurantPromoInfo =data.getMerchantPromo;
            $scope.restaurantInfo =data.restaurant;
            //console.log($scope.restaurantPromoInfo);

        });
    }
    $scope.resPromoList();

   
});

