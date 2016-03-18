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
   
});

