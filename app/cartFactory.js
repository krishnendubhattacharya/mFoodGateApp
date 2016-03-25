angular
.module("mCart", ["ngCookies"])
.factory("mFoodCart", function ($http, $cookies, $cookieStore, $window) {
  var factobj = {};
  
    


    /******************************** Cart ***********************************/
    //factobj.cart = [];
    factobj.add_to_cart = function(promo){
        var cart=$cookieStore.get('cart');
        if(cart)
        {
            var found=false;
            angular.forEach(cart,function(val){
                if(val.offer_id == promo.offer_id)
                {
                    found = true;
                }
            })
            if(!found)
            {
                cart.push(promo);
            }
        }
        else{
            cart = [];
            cart.push(promo);
        }
        $cookieStore.put('cart',cart);

    }
    /******************************** Cart ***********************************/

    factobj.get_cart = function(){
        var cart=$cookieStore.get('cart');
        return cart;
    }

    factobj.update_cart_quantity = function(offer_id,quantity){
        var cart=$cookieStore.get('cart');
        angular.forEach(cart,function(val,key){
            if(val.offer_id == offer_id)
            {
                cart[key].quantity = quantity;
                //found = true;
            }
        })
        $cookieStore.put('cart',cart);

    }

    factobj.remove = function(offer_id){
        var cart=$cookieStore.get('cart');
        angular.forEach(cart,function(val,key){
            if(val.offer_id == offer_id)
            {
               cart.splice(key,1);
                //found = true;
            }
        })
        $cookieStore.put('cart',cart);

    }
    
    
    return factobj;
    
})
