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
            $scope.listViewData.option({"dataSource": $scope.voucherInfo,showSelectionControls: true });
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

                columns: ["title", {caption:'Voucher Value',dataField:"voucher_price"},
                    {caption:'Purchase Price',dataField:"purchase_price"},
                    {caption:'Reseller Price',dataField:"price"},
                    {caption:'Points',dataField:"points"},
                    {caption:'Highest Bid',dataField:"high_bid"},
                    //{caption:'Higest Bid Price',dataField:"price"},
                    {caption:'Expired Date',dataField:"expire_date"},
                    {caption:'Status',dataField:"status"},
                    //{caption:'Reseller Date',dataField:"expire_date"},
                    //{caption:'Status',dataField:"is_sold==1?'Active':'Inactive'"},

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
                        width: 230,
                        alignment: 'center',
                        cellTemplate: function (container, options) {
                            $('<button/>').addClass('dx-button')
                                .text('Bidder')
                                .on('dxclick', function () {
                                    //Do something with options.data;
                                    $scope.bidderList(options.data.voucher_resale_id);

                                    //$scope.bidderList(options.data.voucher_resale_id,$scope.loggedindetails.id);

                                })
                                .appendTo(container);

                            $('<button/>').addClass('dx-button')
                                .text('Detail')
                                .on('dxclick', function () {
                                    //Do something with options.data;
                                    //$location.path('/bidderlist/'+options.data.voucher_resale_id);
                                    $scope.detailVoucher(options.data.voucher_id);
                                    //$scope.bidderList(options.data.voucher_resale_id,$scope.loggedindetails.id);

                                })
                                .appendTo(container);
                            if(options.data.high_bid == 0) {
                                $('<button/>').addClass('dx-button')
                                    .text('Cancel')
                                    .on('dxclick', function () {
                                        //Do something with options.data;
                                        //$location.path('/bidderlist/' + options.data.voucher_resale_id);
                                        $scope.cancelResell(options.data.voucher_resale_id);
                                        //$scope.bidderList(options.data.voucher_resale_id,$scope.loggedindetails.id);

                                    })
                                    .appendTo(container);
                            }

                        }
                    }

                ]
            };


        });

    $scope.bidderList = function (voucher_resale_id) {
        $location.path('/bidderlist/'+voucher_resale_id);

    }

    $scope.cancelResell = function (voucher_resale_id) {
        //$location.path('/resaleCancel/' + voucher_resale_id);
        $http({
            method: "POST",
            url: $rootScope.serviceurl + "resaleCancel",
            data: {"id":voucher_resale_id},
        }).success(function (data) {
            //$scope.voucherInfo =data.bid_details;
            //console.log($scope.voucherInfo);
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



        });
    }

    $scope.detailVoucher = function (voucher_id) {
        $location.path('/voucherdetail/' + voucher_id);

    }

    $http({
        method: "GET",
        url: $rootScope.serviceurl + "ownbid/"+$scope.loggedindetails.id,
    }).success(function (data) {
        $scope.voucherInfo =data.bid_details;
        //console.log($scope.voucherInfo);
        $scope.listViewData1.option({"dataSource": $scope.voucherInfo,showSelectionControls: true });
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

            columns: ["title", {caption:'Voucher Value',dataField:"voucher_price"},
                {caption:'Purchase Price',dataField:"purchase_price"},
                {caption:'Bid Price',dataField:"bid_price"},
                {caption:'Bid Points',dataField:"bid_points"},
                {caption:'Expire Date',dataField:"to_date"},
                {caption:'Status',dataField:"Status"},
                {
                    width: 150,
                    alignment: 'center',
                    cellTemplate: function (container, options) {
                        $('<button/>').addClass('dx-button')
                            .text('Edit')
                            .on('dxclick', function () {
                                //Do something with options.data;
                                $scope.bidEdit(options.data.bid_id);

                                //$scope.bidderList(options.data.voucher_resale_id,$scope.loggedindetails.id);

                            })
                            .appendTo(container);

                        $('<button/>').addClass('dx-button')
                            .text('Detail')
                            .on('dxclick', function () {
                                //Do something with options.data;
                                //$location.path('/bidderlist/'+options.data.voucher_resale_id);
                                $scope.detailVoucher(options.data.voucher_id);
                                //$scope.bidderList(options.data.voucher_resale_id,$scope.loggedindetails.id);

                            })
                            .appendTo(container);


                    }
                }
            ]
        };


    });

    $scope.bidEdit = function (bid_id) {

            $location.path('/editbid/'+bid_id);

    }

    $http({
        method: "GET",
        url: $rootScope.serviceurl + "othersresellList/"+$scope.loggedindetails.id,
    }).success(function (data) {
        $scope.soonVoucherInfo =data.resale_details;
        //console.log($scope.voucherInfo);
        $scope.listViewData2.option({"dataSource": $scope.soonVoucherInfo,showSelectionControls: true });
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
                    width: 140,
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

                        $('<button/>').addClass('dx-button')
                            .text('Detail')
                            .on('dxclick', function () {
                                //Do something with options.data;
                                //$location.path('/bidderlist/'+options.data.voucher_resale_id);
                                $scope.detailVoucher(options.data.voucher_id);
                                //$scope.bidderList(options.data.voucher_resale_id,$scope.loggedindetails.id);

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
            data: {"bid_price":$scope.bid_price,"m_points":$scope.m_points,"voucher_id":$stateParams.voucherId,"user_id":$scope.loggedindetails.id,"voucher_resale_id":$stateParams.sellId},
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

    $scope.saveEditBid = function(params) {

        //alert(1);
        console.log(params);
        //alert($scope.price);
        //alert($scope.points);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
        //var result = params.validationGroup.validate();
        // if(result.isValid) {
        $http({
            method: "PUT",
            url: $rootScope.serviceurl+"updateVoucherBid"+$stateParams.bidId,
            data: {"bid_price":$scope.item.bid_price,"m_points":$scope.item.m_points},
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

    $scope.loadList=function(e)
    {
        $scope.listViewData= e.component;
    }

    $scope.loadList1=function(e)
    {
        $scope.listViewData1= e.component;
    }

    $scope.loadList2=function(e)
    {
        $scope.listViewData2= e.component;
    }


});