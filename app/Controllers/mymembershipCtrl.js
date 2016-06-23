app.controller('mymembershipCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth,$state) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    //console.log($state.$current.name);
    $scope.selectedEmployee = {};
    $scope.voucherInfo = null;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMyMembership/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo =data;
            //console.log($scope.voucherInfo.membership);
            $scope.listViewData.option({"dataSource": $scope.voucherInfo.membership,showSelectionControls: true });

            $scope.listViewData.option({"onItemClick":$scope.viewDetails});
            $scope.dataGridOptions = {
                dataSource: $scope.voucherInfo.membership,
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

                columns: [{ dataField: 'title',caption:'Description'},
                    { dataField: 'restaurant_name',caption:'Restaurant'},
                    { dataField: 'purchased_date',caption:'Member Since'}, "expire_date",
                    { dataField: 'member_id',caption:'Member Id'},
                    {
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            //$('<button/>').addClass('dx-button')
                            //                              .text('Details')
                            //                               .on('dxclick', function () {
                            //                                       $location.path('/membershipdetail/'+options.data.voucher_id);
                            //                                 })
                            //                              .appendTo(container);

                            $('<button/>').addClass('dx-button')
                                .text('Details')
                                .on('dxclick', function () {
                                    $location.path('/merchant-membership/'+options.data.voucher_id+'/'+options.data.merchant_id+'/');
                                })
                                .appendTo(container);
                        }
                    }

                ],
                onSelectionChanged: function (selectedItems) {
                    //console.log(selectedItems);
                    //$scope.selectedEmployee = selectedItems.selectedRowsData[0];
                }
            };


        });

    $scope.getExpiredMemberships = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMyExpiredMembership/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo =data;
            //console.log($scope.voucherInfo.membership);
            $scope.listViewData1.option({"dataSource": $scope.voucherInfo.membership,showSelectionControls: true });
            $scope.dataGridOptions1 = {
                dataSource: $scope.voucherInfo.membership,
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

                columns: [{ dataField: 'title',caption:'Description'},
                    { dataField: 'restaurant.title',caption:'Restaurant'},
                    { dataField: 'purchased_date',caption:'Member Since'}, "expire_date"
                    /*{
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            $('<button/>').addClass('dx-button')
                                .text('Details')
                                .on('dxclick', function () {
                                    $location.path('/membershipdetail/'+options.data.voucher_id);
                                })
                                .appendTo(container);
                        }
                    }*/

                ],
                onSelectionChanged: function (selectedItems) {
                    //console.log(selectedItems);
                    //$scope.selectedEmployee = selectedItems.selectedRowsData[0];
                }
            };


        });
    }

    $scope.getExpiredMemberships();

    $scope.loadList=function(e)
    {
        $scope.listViewData= e.component;

    }

    $scope.loadList1=function(e)
    {
        $scope.listViewData1= e.component;
    }

    $scope.viewDetails = function (data) {
        //console.log(data.itemData);
        $location.path('/merchant-membership/'+data.itemData.merchant_id + '/');
    }


});