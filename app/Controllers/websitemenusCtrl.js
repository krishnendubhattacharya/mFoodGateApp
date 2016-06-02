app.controller('websitemenusCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.res_id = $stateParams.res_id;
    $scope.getFeatureds = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getActiveWebsiteMenus/"+$scope.res_id,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            $scope.featuredMenus = data.data;
        })
    }
    $scope.getFeatureds();


    $scope.getSliderImages = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getWebsiteMenuSliderImages/"+$scope.res_id,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            $scope.sliderImages = data.data;
        })
    }
    $scope.getSliderImages();


});
