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

    $scope.offerdetails = function(voucher_id,resell_id){

        /*$http({
            method: "GET",
            url: $rootScope.serviceurl + "getAllResellList",
        }).success(function (data) {

            $scope.resaleInfo =data.resale_details;

        });*/
        $location.path('/sellvoucherdetail/'+voucher_id+'/'+resell_id);
        alert(12);
        alert(voucher_id);

    }


   
});

