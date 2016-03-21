app.controller('bidvoucherCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
   /* $scope.bidderList = function(sellId,userId){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "bidders/"+sellId+"/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.bidInfo =data.bid_details;
            //console.log($scope.voucherInfo);
            $location.path('/bidderlist');
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

                columns: ["first_name", "last_name", "email", "bid_price",
                    {
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            $('<button/>').addClass('dx-button')
                                .text('Sell')
                                .on('dxclick', function () {
                                   // $location.path('/voucherdetail/'+options.data.id);
                                })
                                .appendTo(container);
                        }
                    }

                ]
            };


        });

    }*/

    $scope.voucherInfo = null;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "ownresellList/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo =data.resale_details;
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

                columns: ["title", "price", "expire_date",
                    /*{
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            $('<button/>').addClass('dx-button')
                                .text('Details')
                                .on('dxclick', function () {
                                    $location.path('/voucherdetail/'+options.data.id);
                                })
                                .appendTo(container);
                        }
                    },*/
                    {
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {
                            $('<button/>').addClass('dx-button')
                                .text('Bidder List')
                                .on('dxclick', function () {
                                    //Do something with options.data;
                                    $location.path('/bidderlist/'+options.data.voucher_resale_id);
                                    //$scope.bidderList(options.data.voucher_resale_id,$scope.loggedindetails.id);

                                })
                                .appendTo(container);

                        }
                    }

                ]
            };


        });

    $http({
        method: "GET",
        url: $rootScope.serviceurl + "ownbid/"+$scope.loggedindetails.id,
    }).success(function (data) {
        $scope.voucherInfo =data.bid_details;
        //console.log($scope.voucherInfo);
        $scope.dataGridOptions3 = {
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

            columns: ["title", "bid_price", "to_date","Status"]
        };


    });

    $http({
        method: "GET",
        url: $rootScope.serviceurl + "othersresellList/"+$scope.loggedindetails.id,
    }).success(function (data) {
        $scope.soonVoucherInfo =data.resale_details;
        //console.log($scope.voucherInfo);
        $scope.dataGridOptions2 = {
            dataSource: $scope.soonVoucherInfo,
            paging: {
                pageSize: 5
            },
            pager: {
                showPageSizeSelector: true,
                allowedPageSizes: [5, 10, 20],
                showInfo: true
            },

            columns: ["title", "price", "expire_date",
                /*{
                    width: 100,
                    alignment: 'center',
                    cellTemplate: function (container, options) {
                        $('<button/>').addClass('dx-button')
                            .text('Details')
                            .on('dxclick', function () {
                                //Do something with options.data;
                                $location.path('/voucherdetail/'+options.data.id);
                            })
                            .appendTo(container);
                    }
                },*/
                {
                    width: 100,
                    alignment: 'center',
                    cellTemplate: function (container, options) {
                        $('<button/>').addClass('dx-button')
                            .text('Bid')
                            .on('dxclick', function () {
                                //Do something with options.data;
                                //$scope.addBid();
                                $location.path('/addbid/'+options.data.voucher_resale_id+'/'+options.data.voucher_id)

                            })
                            .appendTo(container);

                    }
                }

            ]
        };


    });

    $scope.textBox = {
        bid_price: {
            mode: "text"

        }
    };

    $scope.saveBid = function(params) {

        //alert(1);
        console.log(params);
        //alert($scope.price);
        //alert($scope.points);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
        //var result = params.validationGroup.validate();
        // if(result.isValid) {
        $http({
            method: "POST",
            url: $rootScope.serviceurl+"bids",
            data: {"bid_price":$scope.bid_price,"voucher_id":$stateParams.voucherId,"user_id":$scope.loggedindetails.id,"voucher_resale_id":$stateParams.sellId},
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            console.log(data);
            //return false;
            //params.validationGroup.reset();
            if(data.type == 'success'){
                //var message = data.message;
                //params.validationGroup.reset();
                $location.path('/dashboard');

                DevExpress.ui.notify({
                    message: data.message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "success", 3000);
            }else{
                var message = "Error occured.";
                DevExpress.ui.notify({
                    message: data.message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "error", 3000);
            }

        })

        //form.submit();
        //params.validationGroup.reset();
        //}
    };




});