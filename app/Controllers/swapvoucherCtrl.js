app.controller('swapvoucherCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.voucherInfo = null;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "swaplist",
        }).success(function (data) {
            $scope.voucherInfo =data.data;
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

                columns: ["title", "price", "offer_percent", "expire_date",
                    {
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            $('<button/>').addClass('dx-button')
                                .text('Details')
                                .on('dxclick', function () {
                                    $location.path('/swapvoucherdetail/'+ options.data.id);
                                })
                                .appendTo(container);
                        }
                    },
                    {
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {
                            //console.log(options);
                            if (options.data.user_id != $scope.loggedindetails.id) {
                                $('<button/>').addClass('dx-button')
                                    .text('Swap')
                                    .on('dxclick', function () {
                                        //Do something with options.data;
                                        $location.path('/swapinterested/' + options.data.id);
                                    })
                                    .appendTo(container);
                            }

                        }
                    }

                ]
            };


        });






});