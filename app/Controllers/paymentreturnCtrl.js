'use strict'; 
/** 
  * controllers used for the open request
*/
app.controller('paymentreturnCtrl', function ($rootScope, $scope, $http, $location,myAuth,$stateParams,$cookieStore,$timeout) {
   //console.log('Token =========== ', $stateParams.token);
   $scope.token = $stateParams.token;
    $scope.loggedindetails = myAuth.getUserNavlinks();
    console.log($stateParams);
    if($stateParams.success=='true')
    {

        $http({
            method: "POST",
            url: $rootScope.serviceurl + "success_payment",
            data: 'payment_id=' + $stateParams.paymentId,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function(data){
            $cookieStore.remove('cart');
            $http({
                method: "DELETE",
                url: $rootScope.serviceurl+"deleteCartByUser/"+$scope.loggedindetails.id,
                headers: {'Content-Type': 'application/json'}
            }).success(function(data) {

            })
            $timeout(function(){
            var message = "Payment successfull.";
            DevExpress.ui.notify({
                message: message,
                position: {
                    my: "center top",
                    at: "center top"
                }
            }, "success", 3000);
            $location.path('/');
            $location.search('success', null);
            $location.search('token', null);
            $location.search('paymentId', null);
            $location.search('PayerID',null);
            },3000);
        })
    }
    else {

        $location.search('success', null);
        $location.search('token', null);
        //$stateParams= null;
        $timeout(function(){
            var message = "Payment failed. Please try again later.";
            DevExpress.ui.notify({
                message: message,
                position: {
                    my: "center top",
                    at: "center top"
                }
            }, "error", 3000);
            $location.path('/');
        },3000);



    }

    
    /*if($stateParams.PayerID)
    {
        $scope.getPaymentDetails();
    }
    else
    {
        $location.search({});
        $location.path('/frontend/payment_cancel');
    }*/
});


