app.controller('eventbidderCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.bidInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    };
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




    $scope.dataGridOptions = {
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
        onInitialized : function(e){
            $scope.datagridobj = e.component;
        },
        columns: ["price", "email", "name",
            {
                caption:'Action',
                width: 200,
                alignment: 'center',
                cellTemplate: function (container, options) {
                    $('<button/>').addClass('dx-button')
                        .text('Accept')
                        .on('dxclick',function(){$scope.accept_event(options.data.id); })
                        .appendTo(container);


                }
            },


        ]
    };

	$scope.dataGridOptionss = {
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
        onInitialized : function(e){
            $scope.datagridobjj = e.component;
        },
        columns: ["price", "email", "name",
            {
                caption:'Action',
                width: 200,
                alignment: 'center',
                cellTemplate: function (container, options) {
                    $('<button/>').addClass('dx-button')
                        .text('Accept')
                        .on('dxclick',function(){$scope.accept_event(options.data.id); })
                        .appendTo(container);


                }
            },


        ]
    };

    $scope.getEventBidder = function() {
        //$scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getEventBidsWithUser/" + $stateParams.eventId,
        }).success(function (data) {
            $scope.bidInfo = data.event_bids;
            //console.log($scope.voucherInfo);
            $scope.datagridobj.option('dataSource',$scope.bidInfo);
		$scope.datagridobjj.option('dataSource',$scope.bidInfo);
        });
    }
    $scope.getEventBidder();

    $scope.accept_event = function(bid_id) {
        //$scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "acceptEventBid/" + $stateParams.eventId + "/" +bid_id,
        }).success(function (data) {
            //$scope.bidInfo = data.event_bids;
            //console.log($scope.voucherInfo);
            //$scope.datagridobj.option('dataSource',$scope.bidInfo);
            if (data.type == 'success') {
                var message = data.message;
                //params.validationGroup.reset();
                //$location.path('/login');
                //$scope.getUserInfo();
                //$location.path('/merchantoffer');
                DevExpress.ui.notify({
                    message: message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "success", 3000);
                $location.path('/myevent');
            } else {
                var message = "Error occured.";
                DevExpress.ui.notify({
                    message: message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "error", 3000);
            }
        });
    }


















});
