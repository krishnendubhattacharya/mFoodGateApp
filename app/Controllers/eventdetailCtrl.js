app.controller('eventdetailCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    console.log($stateParams.voucherId);
    $scope.voucherInfo = null;

    $scope.getEventDetail = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getEvenDetails/"+$stateParams.eventId,
        }).success(function (data) {
            console.log(data);
            $scope.eventInfo =data;
        });

    }
    $scope.getEventDetail();








});