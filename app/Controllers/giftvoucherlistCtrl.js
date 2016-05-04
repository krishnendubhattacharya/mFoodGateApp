app.controller('giftvoucherlistCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.voucherInfo = null;
    $http({
        method: "GET",
        url: $rootScope.serviceurl + "getGiftedToMe/"+$scope.loggedindetails.id,
    }).success(function (data) {
        $scope.voucherInfo =data.gifts;
        //console.log($scope.voucherInfo);
        $scope.dataGridOptions = {
            dataSource: $scope.voucherInfo,
            selection: {
                mode: "single"
            },
            paging: {
                pageSize: 5
            },
            pager: {
                showPageSizeSelector: true,
                allowedPageSizes: [5, 10, 20],
                showInfo: true
            },

            columns: ["voucher_name", "resturant_name", "price",
                {caption:"Expire Date",dataField:"offer_to_date"},
                {caption:"From Friend Name",dataField:"friend"}
            ]
        };
        $scope.listExpiredPointViewData.option({"dataSource": $scope.voucherInfo,hoverStateEnabled: false });
    });
    $scope.loadExpiredPointList=function(e)
    {
        //console.log("loadList")
        $scope.listExpiredPointViewData= e.component;
    }

    $http({
        method: "GET",
        url: $rootScope.serviceurl + "getGiftedByMe/"+$scope.loggedindetails.id,
    }).success(function (data) {
        $scope.voucherInfo2 =data.gifts;
        //console.log($scope.voucherInfo);
        $scope.dataGridOptions2 = {
            dataSource: $scope.voucherInfo2,
            selection: {
                mode: "single"
            },
            paging: {
                pageSize: 5
            },
            pager: {
                showPageSizeSelector: true,
                allowedPageSizes: [5, 10, 20],
                showInfo: true
            },

            columns: ["voucher_name", "resturant_name", "price",
                {caption:"Expire Date",dataField:"offer_to_date"},
                {caption:"To Friend Name",dataField:"friend"}
            ]
        };
        $scope.listViewData.option({"dataSource": $scope.voucherInfo2,hoverStateEnabled: false });
    });


    $scope.loadList=function(e)
    {
        console.log("loadList")
        $scope.listViewData= e.component;
    }

});