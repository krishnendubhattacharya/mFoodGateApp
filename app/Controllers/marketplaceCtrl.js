'use strict';
/** 
 * controllers used for the login
 */
app.controller('marketplaceCtrl', function ($rootScope, $scope, $http, $location) {

    $scope.resaleList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getAllResellList",
        }).success(function (data) {
            $scope.resaleInfo =data.resale_details;
            //console.log($scope.catInfo);

        });
    }
    $scope.resaleList();


   
});

