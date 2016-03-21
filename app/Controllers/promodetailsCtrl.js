app.controller('promodetailsCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, NgMap,mFoodCart) {
    $scope.promoId = $stateParams.promoId;

    NgMap.getMap().then(function(map) {
        $scope.map = map;
    });

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
            offer_price         :   $scope.promodetails.offer_price,
            quantity            :   1
        }
        mFoodCart.add_to_cart(cart_obj);
        $scope.cartDetails = mFoodCart.get_cart();
    }

    $scope.cartDetails = mFoodCart.get_cart();

    $scope.updateQuantity = function(data){
        if(data.quantity>0) {
            mFoodCart.update_cart_quantity(data.offer_id, data.quantity);
            $scope.getCartTotals();
        }
    }

    $scope.cart_total = 0;

    $scope.getCartTotals = function(){
        $scope.cart_total = 0;
        $scope.cartDetails = mFoodCart.get_cart();
        angular.forEach($scope.cartDetails,function(value){
            $scope.cart_total = $scope.cart_total + (value.quantity * value.offer_price);
        })
    }

    $scope.pay_now = function(){

    }

});