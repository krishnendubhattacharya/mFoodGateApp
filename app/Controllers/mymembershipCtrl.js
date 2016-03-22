app.controller('mymembershipCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    $scope.selectedEmployee = {};
    $scope.voucherInfo = null;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMyMembership/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo =data;
            //console.log($scope.voucherInfo.membership);
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

                columns: ["title", "price", "offer_percent", "expire_date",
                    {
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
                    }

                ],
                onSelectionChanged: function (selectedItems) {
                    //console.log(selectedItems);
                    $scope.selectedEmployee = selectedItems.selectedRowsData[0];
                }
            };


        });


});