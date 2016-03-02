app.controller('mypointsCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.voucherInfo = null;

    $scope.getPoints = function() {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "mypoints/" + $scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo = data.data;
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

                columns: ["sl", "points", "type", "date","expire_date"
                    /*{
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            $('<button/>').addClass('dx-button')
                                .text('Details')
                                .on('dxclick', function () {
                                    $location.path('/voucherdetail/' + options.data.id);
                                })
                                .appendTo(container);
                        }
                    },
                    {
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {
                            $('<button/>').addClass('dx-button')
                                .text('ReSell')
                                .on('dxclick', function () {
                                    //Do something with options.data;
                                    $location.path('/vouchersell/' + options.data.id);
                                })
                                .appendTo(container);

                        }
                    }*/

                ]
            };
        });
    }
    $scope.getPoints();

    $http({
        method: "GET",
        url: $rootScope.serviceurl + "expiresoonvoucher/"+$scope.loggedindetails.id,
    }).success(function (data) {
        $scope.soonVoucherInfo =data;
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

            columns: ["title", "price", "offer_percent", "to_date",
                {
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
                },
                {
                    width: 100,
                    alignment: 'center',
                    cellTemplate: function (container, options) {
                        $('<button/>').addClass('dx-button')
                            .text('ReSell')
                            .on('dxclick', function () {
                                //Do something with options.data;
                                $location.path('/vouchersell/'+options.data.id);
                            })
                            .appendTo(container);

                    }
                }

            ]
        };


    });




});