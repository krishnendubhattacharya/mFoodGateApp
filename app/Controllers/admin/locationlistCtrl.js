'use strict';
/** 
 * controllers used for the login
 */
app.controller('locationlistCtrl', function ($rootScope, $scope, $http, $location, myAuth, $cookieStore) {
    $scope.viewLocation = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLocations",
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {

            $scope.alllocation = data.location;
            //console.log($scope.allcat);


        });
        $scope.locationView='view';
    }

    $scope.viewLocation();

    $scope.editLocation = function (params) {
        $scope.item = params;
        $scope.locationView='edit';
    }

    $scope.addLocation = function () {
        //alert(13);
        $scope.item={
            "name": '',
            "id": '',
            "is_active":0
        };
        $scope.example1model = [];
        $scope.example1data = [
            {id: 1, label: "David"},
            {id: 2, label: "Jhon"},
            {id: 3, label: "Danny"}];
        $scope.locationView='edit';
    }

    $scope.cancelLocation = function () {
        $scope.locationView();
    }

    $scope.saveLocation = function () {

        //return false;
        if($scope.item.id == '') {
            $http({
                method: "POST",
                url: $rootScope.serviceurl + "categories",
                data: {"name": $scope.item.name, "parent_id": "0", "is_active": $scope.item.is_active},
                headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                console.log(data);
                $scope.viewCategory();
                //$scope.allcat = data.category;
                //console.log($scope.allcat);
            });
        }else{
            $http({
                method: "PUT",
                url: $rootScope.serviceurl + "categories/"+$scope.item.id,
                data: {"name": $scope.item.name,"is_active": $scope.item.is_active},
                headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                console.log(data);
                $scope.viewCategory();
                //$scope.allcat = data.category;
                //console.log($scope.allcat);
            });
        }

    }

    $scope.deleteLocation = function (c_id) {
        //alert(c_id);
        if ( window.confirm("Want to delete?") ) {
            $http({
                method: "DELETE",
                url: $rootScope.serviceurl + "categories/"+c_id,
                //data: {"name": $scope.item.name,"is_active": $scope.item.is_active},
                //headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                console.log(data);
                $scope.viewCategory();
                //$scope.allcat = data.category;
                //console.log($scope.allcat);
            });
        }else{

        }

    }



         
         //$scope.getLoginDetails();

         
   
});

