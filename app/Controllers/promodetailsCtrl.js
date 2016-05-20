app.controller('promodetailsCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, NgMap,mFoodCart,$window,$cookieStore,$timeout) {
    $scope.promoId = $stateParams.promoId;
    $scope.loggedindetails = myAuth.getUserNavlinks();

    //stButtons.makeButtons();
    $scope.mpoints = 0;
    NgMap.getMap().then(function(map) {
        $scope.map = map;
    });

    $scope.save_to_db = function() {
        console.log("saving -1",$scope.loggedindetails);
        if ($scope.loggedindetails) {
            console.log("saving -2");
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

                }
            })
        }
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

    $scope.getPromoDetails = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getPromoDetails/" + $scope.promoId,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.type == 'success') {
                $scope.promodetails = data.offer;
                $scope.restaurant = data.restaurants;
            }
        })
    }
    $scope.getPromoDetails();

    $scope.relateds = [];
    $scope.getRelatedProducts = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getRelatedPromo",
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.type == 'success') {
                //console.log(data.getRelatedPromo);
                $scope.related_products = data.getRelatedPromo;
                //console.log($scope.related_products);
                $timeout(function(){
                    // $('#ca-container').contentcarousel();
                    var banner_carousal = $('.featured_carousel');
                    banner_carousal.owlCarousel({
                        autoplay:true,
                        touchDrag:false,
                        loop:true,
                        dots:true,
                        nav:true,
                        navContainerClass:"ca-nav",
                        navText:false,
                        autoplayTimeout:6000,
                        autoplayHoverPause:true,
                        responsive:{
                            0:{
                                items:1
                            },
                            600:{
                                items:1
                            },
                            1000:{
                                items:3
                            }
                        }
                    });
                },30);

            }
        })
    }
    $scope.getRelatedProducts();

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
            quantity            :   1,
            image               :   $scope.promodetails.image
        }
        mFoodCart.add_to_cart(cart_obj);
        $scope.cartDetails = mFoodCart.get_cart();
        $scope.getCartTotals();
        $scope.save_to_db();
    }

    $scope.cartDetails = mFoodCart.get_cart();
    console.log('cart',$scope.cartDetails);

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
        $location.path("/cartpage");
        /*
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
        }*/
        /**/
    }

    $scope.remove_offer = function(offer_id){
        mFoodCart.remove(offer_id);
        $scope.getCartTotals();
        $scope.delete_from_cart(offer_id);
    }

    $scope.getAds = function () {

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getActiveAdsByLocation/2",
        }).success(function (data) {
            $scope.ads = data.ads;
            $timeout(function(){
                // $('#ca-container').contentcarousel();
                var carousal = $('.owl-carousel1');
                carousal.owlCarousel({
                    autoplay:true,
                    touchDrag:false,
                    loop:true,
                    dots:true,
                    nav:true,
                    navContainerClass:"ca-nav",
                    navText:false,
                    autoplayTimeout:5000,
                    autoplayHoverPause:true,

                    responsive:{
                        0:{
                            items:1
                        },
                        600:{
                            items:1
                        },
                        1000:{
                            items:1
                        }
                    }
                });
           },1);
            //console.log($scope.newPromoInfo);

        });
    }
    $scope.getAds();

    $scope.payments = 'C';
});
