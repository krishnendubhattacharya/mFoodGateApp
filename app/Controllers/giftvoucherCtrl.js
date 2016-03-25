app.controller('giftvoucherCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    $scope.giftVoucher = function(to_id){
        //alert(to_id);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
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

    $scope.saveGift = function(params) {

        //alert($scope.gift_email);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
        //return false;
        //alert(1);
        //console.log(params);
        //alert($scope.price);
        //alert($scope.points);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
        //var result = params.validationGroup.validate();
        // if(result.isValid) {
        $http({
            method: "POST",
            url: $rootScope.serviceurl+"giftVoucher",
            data: {"email":$scope.gift_email,"vid":$stateParams.voucherId,"userid":$scope.loggedindetails.id},
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            console.log(data);
            //return false;
            //params.validationGroup.reset();
            if(data.type == 'success'){
                //var message = data.message;
                //params.validationGroup.reset();
                $location.path('/dashboard');

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

        })

        //form.submit();
        //params.validationGroup.reset();
        //}
    };


});