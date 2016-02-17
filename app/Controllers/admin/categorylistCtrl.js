'use strict';
/** 
 * controllers used for the login
 */
app.controller('categorylistCtrl', function ($rootScope, $scope, $http, $location, myAuth, $cookieStore) {

    $http({
        method: "GET",
        url: $rootScope.serviceurl+"categories",
        //data: {"email":$scope.email,"password":$scope.password},
        //headers: {'Content-Type': 'application/json'},
    }).success(function(data) {

        $scope.allcat=data.category;
        //console.log($scope.allcat);


    });



         
         //$scope.getLoginDetails();

         
   
});

