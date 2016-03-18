app.controller('promodetailsCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    $scope.promoId = $stateParams.promoId;

    $scope.getPromoDetails = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getContent/" + $scope.pageName,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.content) {
                $scope.promodetails = data.content;
            }
        })
    }
    $scope.getPromoDetails();

     /*if($scope.pageName=='contact-us')
    {
        NgMap.getMap().then(function(map) {
            console.log(map.getCenter());
            console.log('markers', map.markers);
            console.log('shapes', map.shapes);
        });
    }
    $scope.pagedetails = []
    $scope.getPageDetails = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getContent/" + $scope.pageName,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.content) {
                $scope.pagedetails = data.content;
            }
        })
    }
    $scope.getPageDetails();*/


});