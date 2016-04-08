app.controller('merchanteventCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.eventInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }


    ;




    $scope.dataGridOptions = {
        dataSource: $scope.eventInfo,
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
        columns: ["title", "from_date", "to_date",
            {
                caption:'Action',
                width: 200,
                alignment: 'center',
                cellTemplate: function (container, options) {
                    $('<button/>').addClass('dx-button')
                        .text('Detail')
                        .on('dxclick',function(){
                            //$scope.accept_event(options.data.id);
                            $location.path('/eventdetail/' + options.data.id);
                        })
                        .appendTo(container);
                    $('<button/>').addClass('dx-button')
                        .text('Bid')
                        .on('dxclick',function(){
                            //$scope.accept_event(options.data.id);
                            $location.path('/eventbid/' + options.data.id);
                        })
                        .appendTo(container);



                }
            },


        ]
    };

    $scope.getEventList = function() {
        //$scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getActiveEvents",
        }).success(function (data) {
            $scope.eventInfo = data.data;
            //console.log($scope.voucherInfo);
            $scope.datagridobj.option('dataSource',$scope.eventInfo);
        });
    }
    $scope.getEventList();




















});
