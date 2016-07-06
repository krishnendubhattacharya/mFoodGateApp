'use strict';
/** 
 * controllers used for the login
 */
app.controller('merchantheaderCtrl', function ($rootScope, $scope, $http, $location, myAuth,mFoodCart, $cookieStore,$stateParams) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
$scope.merchant_id = $stateParams.id;
$scope.v_id = $stateParams.v_id;
$scope.res_id = $stateParams.res_id;
//console.log($scope.merchant_id);
//console.log($scope.res_id);
    //localStorage.setItem('merchantweb', "");
    $scope.resShow = localStorage.getItem('merchantweb');
    $scope.headerShow = localStorage.getItem('merchantheadername');
    //alert($scope.resShow);
    if($scope.headerShow){
        $scope.merheaderShow = $scope.headerShow;
    }else{
        $scope.merheaderShow = 0;
    }
    if($scope.resShow){
        $scope.restaurantShow = 1;
    }else{
        $scope.restaurantShow = 0;
    }
    $scope.getMerResDetail = function() {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMerResDetail/" + $scope.merchant_id+"/"+$scope.res_id+"/"+$scope.loggedindetails.id+"/"+$scope.v_id,
        }).success(function (data) {
            console.log(data);
            $scope.det = data;
            $scope.merchantId = data.merchant_id;
            $scope.resId = data.restaurant_id;
            $scope.memberId = data.member_id;
            console.log($scope.memberId);
            //$scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
            //if($scope.datag)
            //$scope.datag.option({dataSource:$scope.voucherInfo});


            //$scope.refresh_grid();
            //$timeout(function(){
            //$scope.datag.refresh();
            //},3000)


        });
    }
    $scope.getMerResDetail();

    $scope.viewIcon = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getIconList",
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            $scope.allicons = data.icon;
            //console.log($scope.allicons);

        });
    }
    $scope.viewIcon();

    $scope.headerLink = function (link_name) {
        //console.log(pageName+'/'+v_id+'/'+id+'/'+res_id);
        //$cookieStore.put('merchantweb', v_id);
        localStorage.setItem('merchantheadername', link_name);
        localStorage.setItem('merchantweb', 1);
        //$location.path(pageName+'/'+v_id+'/'+id+'/'+res_id);

    }
    $scope.backLink = function (v_id,merchant_id,res_id) {
        //console.log(pageName+'/'+v_id+'/'+id+'/'+res_id);
        //$cookieStore.put('merchantweb', v_id);
        localStorage.setItem('merchantheadername', "");
        localStorage.setItem('merchantweb', "");
        //$location.path(pageName+'/'+v_id+'/'+id+'/'+res_id);
        $location.path('/merchant-membership/'+v_id+'/'+merchant_id + '/'+res_id);


    }
   
});

