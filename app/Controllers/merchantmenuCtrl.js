app.controller('merchantmenuCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }




    $scope.changeView = function(){
        $scope.edit_mode = !$scope.edit_mode;
        $scope.menuInfo = {
            title:'',
            description:'',
            price:'',
            status:false
        }
    }

    $scope.getPoints = function() {
        $scope.edit_mode = false;
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
        });
    }
    $scope.getPoints();

    $scope.save_menu = function(){
        console.log($scope.menuInfo);
        $scope.menuInfo.user_id = $scope.loggedindetails.id;
        $http({
            method: "POST",
            url: $rootScope.serviceurl+"addMenu",
            data: $scope.menuInfo,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            console.log(data);
            if(data.type == 'success'){
                var message = data.message;
                //params.validationGroup.reset();
                //$location.path('/login');
                //$scope.getUserInfo();
                //$location.path('/merchantoffer');
                DevExpress.ui.notify({
                    message: "Added Successfilly",
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "success", 3000);
            }else{
                var message = "Error occured.";
                DevExpress.ui.notify({
                    message: message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "error", 3000);
            }

        })
    }



});
