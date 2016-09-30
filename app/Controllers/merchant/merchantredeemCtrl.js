app.controller('merchantredeemCtrl', function ($rootScope, $scope, $http, $location, mFoodCart, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    $scope.first_show = 1;
    $scope.second_show = 1;
    $scope.third_show = 1;
    $scope.firstShowHide = function () {
        if($scope.first_show == 1){
            $scope.first_show = 0;
        }else{
            $scope.first_show = 1;
        }
    }
    $scope.secondShowHide = function () {
        if($scope.second_show == 1){
            $scope.second_show = 0;
        }else{
            $scope.second_show = 1;
        }

    }
    $scope.thirdShowHide = function () {
        if($scope.third_show == 1){
            $scope.third_show = 0;
        }else{
            $scope.third_show = 1;
        }

    }
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.voucherInfo = null;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getRedeemVoucher/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo =data.data;
            //console.log($scope.voucherInfo);

            $scope.dataGridOptions = {
                dataSource: $scope.voucherInfo,
                wordWrapEnabled: true,
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

                columns: [{caption:'Voucher Number',dataField:"voucher_number"}, {caption:'Voucher Name',dataField:"offer_title"},
                    {caption:'Voucher Value',dataField:"price"},
                    {caption:'Voucher Price',dataField:"offer_price"},
                    {caption:'Voucher Expired Date',dataField:"to_date"},
                    {caption:'Redeem Date',dataField:"RedeemDate"},
                    //{caption:'Higest Bid Price',dataField:"price"},
                    {caption:'Restaurant Redeem',dataField:"title"},
                    {caption:'Status',dataField:"Status"}




                ]
            };


        });

});
