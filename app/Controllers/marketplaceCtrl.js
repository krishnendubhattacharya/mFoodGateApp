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
    $scope.swapList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "swaplist",
        }).success(function (data) {

            $scope.promoInfo =data.data;
            //console.log($scope.catInfo);

        });
    }
    $scope.swapList();

    $scope.eventList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getActiveEvents",
        }).success(function (data) {

            $scope.eventInfo =data.data;
            //console.log($scope.catInfo);

        });
    }
    $scope.eventList();

    $scope.offerdetails = function(voucher_id,resell_id){

        /*$http({
            method: "GET",
            url: $rootScope.serviceurl + "getAllResellList",
        }).success(function (data) {

            $scope.resaleInfo =data.resale_details;

        });*/
        $location.path('/sellvoucherdetail/'+voucher_id+'/'+resell_id);
        //alert(12);
        //alert(voucher_id);

    }

    $scope.swapdetails = function(voucher_id){

        $location.path('/swapallvoucherdetail/'+voucher_id);

    }

    $scope.eventdetails = function(event_id){

        $location.path('/eventalldetail/'+event_id);

    }


   
});

