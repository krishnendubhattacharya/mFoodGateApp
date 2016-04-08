'use strict';
/**
 * controllers used for the login
 */
app.controller('outleteditCtrl', function ($rootScope, $scope, $http, $location, myAuth, $cookieStore, $timeout, $stateParams) {
    $scope.viewOutlet = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getRestaurantDetails/"+$stateParams.outletId,
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            console.log(data.data);
            $scope.categoryList=data.data.categories;
            $scope.category_id = [];
            angular.forEach($scope.categoryList,function(value){
                $scope.category_id.push({id:value.category_id})
            })
            console.log($scope.category_id);
            $scope.item = { id:data.data.restaurant.id,
                user_id:data.data.user.id,
                title:data.data.restaurant.title,
                image_url:data.data.restaurant.logo_url,
                is_featured:data.data.restaurant.is_featured,
                is_active:data.data.restaurant.is_active,
                category_id:$scope.category_id
            }
            console.log($scope.item.category_id);
            console.log($scope.item);
        });

    }
    $scope.viewOutlet();
    $scope.getCategories = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "categories",
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            if(angular.isObject(data))
            {
                $scope.categoryList=data.category;
                $scope.allCat = [];
                angular.forEach($scope.categoryList,function(value){
                    $scope.allCat.push({id:value.id,label:value.name})
                })
            }
        });

    }
    $scope.getLocation = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getAllLocations",
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            if(angular.isObject(data))
            {
                $scope.locationList=data;
            }
        });

    }

    $scope.saveOutlet = function () {
        console.log($scope.item);
        //return false;
        if($scope.item.id == '') {
            $http({
                method: "POST",
                url: $rootScope.serviceurl + "addOutlett",
                data: $scope.item,
                headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                console.log(data);
                $scope.viewOutlet();
                $scope.item={};
                //$scope.allcat = data.category;
                //console.log($scope.allcat);
            });
        }else{
            $http({
                method: "PUT",
                url: $rootScope.serviceurl + "updateOutlet/"+$scope.item.id,
                data: $scope.item,
                headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                console.log(data);
                // $scope.viewOutlet();
                $scope.item={};
                $location.path('/admin/outletlist');
                //$scope.allcat = data.category;
                //console.log($scope.allcat);
            });
        }

    }

    $scope.deleteOutlet = function (c_id) {
        //alert(c_id);
        if ( window.confirm("Want to delete?") ) {
            $http({
                method: "DELETE",
                url: $rootScope.serviceurl + "deleteOutlet/"+c_id,
                //data: {"name": $scope.item.name,"is_active": $scope.item.is_active},
                //headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                console.log(data);
                $scope.viewOutlet();
                //$scope.allcat = data.category;
                //console.log($scope.allcat);
            });
        }else{

        }

    }




    //$scope.getLoginDetails();



});

