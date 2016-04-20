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

                columns: ["sl", "points","redeemed_points", "remaining_points" ,"source", "date","expire_date"
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
            console.log("ajax")
            $scope.listViewData.option({"dataSource": $scope.voucherInfo,hoverStateEnabled: false });

           /*$scope.listDataSource = new DevExpress.data.DataSource({
                store: []
            });
            for (var i = 0; i < $scope.voucherInfo.length; i++) {
                $scope.listDataSource.store().insert($scope.voucherInfo[i]);
            }

            $scope.listDataSource.load();*/



        });
    }
    $scope.loadList=function(e)
    {
        console.log("loadList")
        $scope.listViewData= e.component;
    }
    $scope.getPoints();

    $scope.getExpiredSoon = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "expiresoonpoints/" + $scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
            $scope.dataGridOptions2 = {
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

                columns: ["sl", "points", "redeemed_points", "remaining_points", "source", "date","expire_date"
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
            $scope.listExpiredPointViewData.option({"dataSource": $scope.voucherInfo,hoverStateEnabled: false });
        });
    }
    $scope.loadExpiredPointList=function(e)
    {
        //console.log("loadList")
        $scope.listExpiredPointViewData= e.component;
    }
    $scope.getExpiredSoon();



});