'use strict';
/**
 * controllers used for the login
 */
app.controller('merchantlistCtrl', function ($rootScope, $scope, $http, $location, myAuth, $cookieStore, $timeout, $stateParams, notify) {

    $scope.viewMerchant = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getAllMerchants",
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {

            $scope.allMerchant = data;
            console.log($scope.allMerchant);
            $timeout(function(){

                $scope.table=  angular.element('#merchantsList').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
            }, 3000, false);
            //console.log($scope.allcat);


        });
        $scope.merchantView='view';
    }
    $scope.viewMerchant();

    $scope.editMerchant = function (params) {

        setTimeout(function () {
            $scope.$apply(function () {
                $scope.item = params;
            });
        }, 2000);


        //console.log(params);$scope.item = params;
        //setTimeout(function(){$scope.item = params},1000);
        $scope.merchantView='edit';
    }


    $scope.addMerchant = function () {

        //alert(13);
        $scope.item={
            "first_name":'',
            "last_name": '',
            "merchant_name": '',
            "email": '',
            "image": '',
            "is_active":0,
            "user_type_id":3,
            "id":'',
        };console.log($scope.item);

        $scope.merchantView='edit';
    }

    $scope.cancelMerchant = function () {
        $scope.viewMerchant();
    }

    $scope.saveMerchant = function () {
        console.log($scope.item);
        //return false;


            if($scope.item.id == '') {
                $http({
                    method: "POST",
                    url: $rootScope.serviceurl + "addMerchant",
                    data: $scope.item,
                    headers: {'Content-Type': 'application/json'},
                }).success(function (data) {

                    console.log(data);
                    if(data.type=='error')
                    {
                        notify({
                            message : data.message,
                            classes : 'alert-danger'
                        });
                    }else{
                        $scope.viewMerchant();
                        $scope.item={};
                    }
                });
            }else{
                $http({
                    method: "PUT",
                    url: $rootScope.serviceurl + "updateMerchant/"+$scope.item.id,
                    data: {"city": $scope.item.city, "country_id": $scope.item.country_id,"is_active": $scope.item.is_active},
                    headers: {'Content-Type': 'application/json'},
                }).success(function (data) {
                    console.log(data);
                    $scope.viewMerchant();
                    $scope.item={};
                    //$scope.allcat = data.category;
                    //console.log($scope.allcat);
                });
            }



    }

    $scope.deleteMerchant = function (c_id) {
        //alert(c_id);
        if ( window.confirm("Want to delete?") ) {
            $http({
                method: "DELETE",
                url: $rootScope.serviceurl + "users/"+c_id,
                //data: {"name": $scope.item.name,"is_active": $scope.item.is_active},
                //headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                $scope.viewMerchant();
                //$scope.allcat = data.category;
                //console.log($scope.allcat);
            });
        }else{
        }
    }
   //$scope.getLoginDetails();
});

