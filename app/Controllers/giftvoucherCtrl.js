app.controller('giftvoucherCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    $scope.giftUserList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "clientlist/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.userInfo =data.user_details;
            console.log($scope.userInfo);
            $scope.dataGridOptions = {
                dataSource: $scope.userInfo,
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

                columns: ["first_name", "last_name", "email",
                    {
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {

                            $('<button/>').addClass('dx-button')
                                .text('Gift')
                                .on('dxclick', function () {
                                   // $location.path('/voucherdetail/'+options.data.id);
                                })
                                .appendTo(container);
                        }
                    }

                ]
            };


        });

    }
    $scope.giftUserList();
});