app.controller('swapbidderlistCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

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



    $scope.bidderList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "interestedSwapList/"+$stateParams.swapId,
        }).success(function (data) {
            $scope.bidInfo =data.data;
            console.log($scope.bidInfo);
            $scope.dataGridOptions4 = {
                dataSource: $scope.bidInfo,
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

                columns: ["first_name", "last_name", "email", "title","voucher_url",
                    {
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            $('<button/>').addClass('dx-button')
                                .text('Accept')
                                .on('dxclick', function () {
                                   // $location.path('/voucherdetail/'+options.data.id);
                                    $scope.acceptSwapVoucher(options.data.id);
                                })
                                .appendTo(container);
                        }
                    }

                ]
            };


        });

    }
    $scope.bidderList();
    $scope.acceptSwapVoucher = function(swapInterestedId){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"swapInterestAccept/"+swapInterestedId,
        }).success(function(data) {
            //console.log(data);
            $location.path("/swapvoucher");
            $scope.message = data.message;

        })

    }
});