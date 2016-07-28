'use strict';
/** 
 * controllers used for the login
 */
app.controller('merchantdashboardCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {

    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.all_outlet = [];
    $scope.all_restaurant = [];
    $scope.autoidArray = [];
    $scope.residArray = [];
    $scope.reshow = false;
    $scope.reshow1 = false;
    $scope.reshow2 = false;
    $scope.reshow3 = false;

    $scope.getUptodateInfo = function () {
        $scope.curDt = new Date();
        //console.log(d);
        $scope.current_date = moment($scope.curDt).format("YYYY-MM-DD");
        $scope.current_year = moment($scope.curDt).format("YYYY");
        $scope.current_month = moment($scope.curDt).format("MM");
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getAllInfoUptoDate/"+$scope.loggedindetails.id,
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            //console.log(data);
            $scope.uptodateInfo =data.data;
            $scope.member_graph =data.member_graph;
            $scope.new_member_graph =data.new_member_graph;
            $scope.promo_graph =data.promo_graph;
            $scope.order_graph =data.order_graph;
            $scope.month_name =data.month_name;

            $scope.dataSource = [{
                day: "All",
                oranges: $scope.member_graph.all
            }, {
                day: "Active",
                oranges: $scope.member_graph.active_user
            }, {
                day: "Non Active",
                oranges: $scope.member_graph.inactive_user
            }, {
                day: "Female",
                oranges: $scope.member_graph.female_user
            }, {
                day: "Male",
                oranges: $scope.member_graph.male_user
            }];

            $scope.dataSource1 = [{
                day: $scope.month_name.first,
                oranges: $scope.new_member_graph.Feb
            }, {
                day: $scope.month_name.second,
                oranges: $scope.new_member_graph.Mar
            }, {
                day: $scope.month_name.third,
                oranges: $scope.new_member_graph.Apr
            }, {
                day: $scope.month_name.fourth,
                oranges: $scope.new_member_graph.May
            }, {
                day: $scope.month_name.fifth,
                oranges: $scope.new_member_graph.Jun
            }, {
                day: $scope.month_name.sixth,
                oranges: $scope.new_member_graph.Jul
            }];
            $scope.dataSource2 = [{
                day: $scope.month_name.first,
                oranges: $scope.promo_graph.Feb
            }, {
                day: $scope.month_name.second,
                oranges: $scope.promo_graph.Mar
            }, {
                day: $scope.month_name.third,
                oranges: $scope.promo_graph.Apr
            }, {
                day: $scope.month_name.fourth,
                oranges: $scope.promo_graph.May
            }, {
                day: $scope.month_name.fifth,
                oranges: $scope.promo_graph.Jun
            }, {
                day: $scope.month_name.sixth,
                oranges: $scope.promo_graph.Jul
            }];
            $scope.dataSource3 = [{
                day: $scope.month_name.first,
                oranges: $scope.order_graph.Feb
            }, {
                day: $scope.month_name.second,
                oranges: $scope.order_graph.Mar
            }, {
                day: $scope.month_name.third,
                oranges: $scope.order_graph.Apr
            }, {
                day: $scope.month_name.fourth,
                oranges: $scope.order_graph.May
            }, {
                day: $scope.month_name.fifth,
                oranges: $scope.order_graph.Jun
            }, {
                day: $scope.month_name.sixth,
                oranges: $scope.order_graph.Jul
            }];
            $scope.reshow =true;
            $scope.reshow1 =true;
            $scope.reshow2 = true;
            $scope.reshow3 = true;
            //console.log($scope.dataSource);


        });

        $http({
            method: "POST",
            url: $rootScope.serviceurl + "getAllInfoDateRange",
            data: {"merchant_id":$scope.loggedindetails.id,"from_date":$scope.current_year+"-"+$scope.current_month+"-1","to_date":$scope.current_date},
            headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            console.log(data);
            $scope.rangeInfo =data.data;

        });

    }
    $scope.getUptodateInfo();

    $scope.getRestaurants = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getActiveMerchantRestaurant/"+$scope.loggedindetails.id,

        }).success(function (data) {
            $scope.all_restaurant = [];
            angular.forEach(data.restaurants,function(val){
                $scope.all_restaurant.push({name:val.title,id:val.id,'res_id':val.restaurant_id});
            })
            console.log($scope.all_restaurant);
        });

    }
    $scope.getRestaurants();
    //$scope.rescheck=[];

    $scope.checkclick = function () {
        console.log($scope.rescheck);
    }

    $scope.save = function(){
        $scope.autoidArray = [];
        $scope.residArray = [];
        angular.forEach($scope.all_restaurant, function(res){
            if (res.selected) $scope.autoidArray.push(res.id);
            if (res.selected) $scope.residArray.push(res.res_id);
        });
        console.log($scope.autoidArray);
        console.log($scope.residArray);

        $http({
            method: "POST",
            url: $rootScope.serviceurl + "getMerchantOutletsBySelectedRestaurant",
            data: {"restaurant_id":$scope.autoidArray},
            headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            console.log(data);
            $scope.all_outlet = [];
            angular.forEach(data.data,function(val){
                $scope.all_outlet.push({name:val.title,id:val.id,'out_id':val.outlet_id});
            })

        });

    }

    $scope.validateAndSubmit = function(params) {

        ///console.log($scope.userInfo);
        $scope.from_date = moment($scope.userInfo.from_date).format("YYYY-MM-DD");
        $scope.to_date = moment($scope.userInfo.to_date).format("YYYY-MM-DD");
        console.log($scope.from_date);
        console.log($scope.to_date);
        //$scope.curDt = new Date();
        //console.log(d);
        //$scope.current_date = moment($scope.curDt).format("YYYY-MM-DD");
        //console.log($scope.current_date);

        $http({
            method: "POST",
            url: $rootScope.serviceurl + "getAllInfoDateRange",
            data: {"merchant_id":$scope.loggedindetails.id,"from_date":$scope.from_date,"to_date":$scope.to_date},
            headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            console.log(data);
            $scope.rangeInfo =data.data;

        });
    };

    $scope.validateAndSubmitTransaction = function(params) {

        console.log($scope.trans);
        $scope.start_date = moment($scope.userInfo.start_date).format("YYYY-MM-DD");
        $scope.end_date = moment($scope.userInfo.end_date).format("YYYY-MM-DD");
        console.log($scope.start_date);
        console.log($scope.end_date);

        $scope.outlArray = [];
        $scope.resArray = [];
        angular.forEach($scope.all_restaurant, function(res){
            //if (res.selected) $scope.autoidArray.push(res.id);
            if (res.selected) $scope.resArray.push(res.res_id);
        });

        angular.forEach($scope.all_outlet, function(outl){
            //if (res.selected) $scope.autoidArray.push(res.id);
            if (outl.selected) $scope.outlArray.push(outl.out_id);
        });
        console.log($scope.outlArray);
        console.log($scope.resArray);

        $http({
            method: "POST",
            url: $rootScope.serviceurl + "transactionTabDetails",
            data: {"merchant_id":$scope.loggedindetails.id,"start_date":$scope.start_date,"end_date":$scope.end_date,"selRes":$scope.resArray,"selout":$scope.outlArray,"type":$scope.trans},
            headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            //console.log(data);
            $scope.transactionInfo =data.data;

        });



    };
    /*$scope.dataSource = [{
        day: "Monday",
        oranges: 3
    }, {
        day: "Tuesday",
        oranges: 2
    }, {
        day: "Wednesday",
        oranges: 3
    }, {
        day: "Thursday",
        oranges: 4
    }, {
        day: "Friday",
        oranges: 6
    }, {
        day: "Saturday",
        oranges: 11
    }, {
        day: "Sunday",
        oranges: 4
    }];*/





});

