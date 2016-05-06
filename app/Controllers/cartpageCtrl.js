app.controller('promodetailsCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, NgMap,mFoodCart,$window,$cookieStore) {
    $scope.promoId = $stateParams.promoId;
    $scope.loggedindetails = myAuth.getUserNavlinks();

    $scope.cartIds = [];
    $scope.save_to_db = function() {
        $scope.cartDetails = mFoodCart.get_cart();
        if ($scope.loggedindetails) {
            $http({
                method: "POST",
                url: $rootScope.serviceurl + "addToCart",
                headers: {'Content-Type': 'application/json'},
                data:{user_id:$scope.loggedindetails.id,cart:$scope.cartDetails}
            }).success(function (data) {
                console.log('saved');
                if(data)
                {
                    mFoodCart.resetAndAdd(data);
                    $scope.cartDetails = mFoodCart.get_cart();
                    //$scope.getCartDetails();
                }
            })
        }
    }
    $scope.save_to_db();

    //$scope.$watch(function(){
    //    var cart=$cookieStore.get('cart');
    //    if(cart)
    //        $scope.getCartDetails();
    //});

    $scope.mpoints = 0;
    NgMap.getMap().then(function(map) {
        $scope.map = map;
    });

    $scope.getUsersPoints = function()
    {
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getUsersPoints/" + $scope.loggedindetails.id,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.status == 'success') {
                $scope.mpoints = data.data.sum;
            }
        })
    }
    if($scope.loggedindetails)
    {
        $scope.getUsersPoints();
    }





    $scope.add_to_cart = function(){
        var cart_obj = {
            offer_id            :   $scope.promodetails.id,
            restaurant_id       :   $scope.restaurant.id,
            offer_title         :   $scope.promodetails.title,
            restaurant_title    :   $scope.restaurant.title,
            offer_percent       :   $scope.promodetails.offer_percent,
            price               :   $scope.promodetails.price,
            mpoints             :   $scope.promodetails.mpoints,
            offer_price         :   $scope.promodetails.offer_price,
            quantity            :   1
        }
        mFoodCart.add_to_cart(cart_obj);
        $scope.cartDetails = mFoodCart.get_cart();
        console.log('hi');
        $scope.save_to_db();
        console.log('hello');
    }

    $scope.getCartDetails = function() {
        $scope.cartDetails = mFoodCart.get_cart();
        //console.log('cart',$scope.cartDetails);
    }
    $scope.getCartDetails();


    if($scope.cartDetails)
    {
        angular.forEach($scope.cartDetails,function(v){
            $scope.cartIds.push(v.offer_id);
        })

        if($scope.cartIds)
        {
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"checkExpiredOffers",
                headers: {'Content-Type': 'application/json'},
                data:{offer_ids:$scope.cartIds}
            }).success(function(data) {
                if(data.type=='success')
                {
                    angular.forEach(data.ids,function(v){
                        $scope.remove_offer(v);
                    })
                }
                console.log(data);
            })
        }
        console.log("===================IDS================", $scope.cartIds);
    }

    $scope.updateQuantity = function(data){
        if(data.quantity>0) {
            mFoodCart.update_cart_quantity(data.offer_id, data.quantity);
            $scope.getCartTotals();
        }
    }

    $scope.cart_total = 0;
    $scope.cart_total_points = 0;

    $scope.getCartTotals = function(){
        $scope.cart_total = 0;
        $scope.cart_total_points = 0;
        $scope.cartDetails = mFoodCart.get_cart();
        angular.forEach($scope.cartDetails,function(value){
            $scope.cart_total = $scope.cart_total + (value.quantity * value.offer_price);
            $scope.cart_total_points += (value.quantity * value.mpoints);
        })
    }

    $scope.pay_now = function(){

        $scope.cartDetails = mFoodCart.get_cart();
        console.log($scope.cartDetails);
        if(!$scope.loggedindetails){
            var ret = $location.path();
            $location.path("/login").search('returnUrl', ret);
        }
        else {
            $scope.getCartTotals();
            if($scope.payments=='C')
            {
                $http({
                    method: "POST",
                    url: $rootScope.serviceurl+"cart_checkout",
                    headers: {'Content-Type': 'application/json'},
                    data:{cart:$scope.cartDetails,total:$scope.cart_total,user_id:$scope.loggedindetails.id}
                }).success(function(data) {

                    if(data.type == 'success') {
                        //console.log(data.getRelatedPromo);
                        //$scope.related_products = data.getRelatedPromo;
                        //console.log($scope.related_products);
                        $window.location.href = data.url;

                    }
                    else {
                        var message = "Internal error. Please try again later";
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
            else {
                if($scope.mpoints>=$scope.cart_total_points) {
                    $http({
                        method: "POST",
                        url: $rootScope.serviceurl + "redeemUserPoints",
                        headers: {'Content-Type': 'application/json'},
                        data: {cart:$scope.cartDetails,points: $scope.cart_total_points, user_id: $scope.loggedindetails.id}
                    }).success(function (data) {

                        if (data.status == 'success') {
                            $cookieStore.remove('cart');
                            //console.log(data.getRelatedPromo);
                            //$scope.related_products = data.getRelatedPromo;
                            //console.log($scope.related_products);
                            //$window.location.href = data.url;
                            var message = "Redeem successfull.";
                            DevExpress.ui.notify({
                                message: message,
                                position: {
                                    my: "center top",
                                    at: "center top"
                                }
                            }, "success", 3000);
                            $location.path('/');
                        }
                        else {
                            var message = "Internal error. Please try again later";
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
                else {
                    var message = "You don't have sufficient points to redeem.";
                    DevExpress.ui.notify({
                        message: message,
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "error", 3000);
                }

            }
        }
        /**/
    }

    $scope.delete_from_cart = function (id)
    {
        if($scope.loggedindetails) {
            $http({
                method: "POST",
                url: $rootScope.serviceurl + "deleteFromCart",
                headers: {'Content-Type': 'application/json'},
                data: {user_id: $scope.loggedindetails.id, offer_id: id}
            }).success(function (data) {
            })
        }
    }

    $scope.remove_offer = function(offer_id){
        mFoodCart.remove(offer_id);
        $scope.getCartTotals();
        $scope.delete_from_cart(offer_id);
    }

    $scope.payments = 'C';
});
