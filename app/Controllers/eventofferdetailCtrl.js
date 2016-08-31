app.controller('eventofferdetailCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    console.log($scope.loggedindetails);
    $scope.voucherInfo;

    $scope.voucherInfo = null;

    $scope.getEventDetail = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getEvenDetails/"+$stateParams.eventId,
        }).success(function (data) {
            console.log(data);
            $scope.eventInfo =data;
            $scope.category_count =$scope.eventInfo.data.categories.length;
            $scope.location_count =$scope.eventInfo.data.locations.length;
        });

    }
    $scope.getEventDetail();

    $scope.eventBid = function (id) {
        $location.path('/eventbid/' +$stateParams.eventId);
    }








});