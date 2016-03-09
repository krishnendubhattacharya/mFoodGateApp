app.controller('giftvoucherCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.giftVoucher = function(to_id){
        alert(to_id);
        alert($stateParams.voucherId);
        alert($scope.loggedindetails.id);
       /* $http({
             method: "POST",
             url: $rootScope.serviceurl+"resale",
             data: {"to_user_id":to_id,"voucher_id":$stateParams.voucherId,"from_user_id":$scope.loggedindetails.id},
             headers: {'Content-Type': 'application/json'},
         }).success(function(data) {
             console.log(data);
             //return false;
             //params.validationGroup.reset();
             if(data.type == 'success'){
             //var message = data.message;
             //params.validationGroup.reset();
                 $location.path('/allvoucher');

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

         });*/
    };

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
                                    $scope.giftVoucher(options.data.id);
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