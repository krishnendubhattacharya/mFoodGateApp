app.controller('websiteaboutCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, NgMap) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    NgMap.getMap().then(function(map) {
        $scope.map = map;
    });

    $scope.showMap = false;

    $scope.res_id = $stateParams.res_id;
    $scope.id = $stateParams.id;
    $scope.getFeatureds = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getMerchantRestaurantDetails/"+$scope.res_id,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            $scope.restaurant = data.data;
        })
    }
    $scope.getFeatureds();

    $scope.getMerchant = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"user/"+$scope.id,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.type=='success')
            {
                $scope.merchant = data.user_details;
            }

        })
    }
    $scope.getMerchant();

    $scope.changeMap = function(outletInfo){
        $scope.showMap = true;
        $scope.mapaddress = outletInfo.address;
        $scope.maptitle = outletInfo.title;
    }


});
