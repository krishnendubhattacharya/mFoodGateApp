'use strict';
/** 
 * controllers used for the login
 */
app.controller('merchanteventbidCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {

    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    if(!$scope.loggedindetails){

        $location.path("/login");
    }

    ;

    $scope.saveEventBid = function(params) {
        //alert(1);
        //return false;
        console.log(params);
        //alert($scope.price);
        //alert($scope.points);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
        //var result = params.validationGroup.validate();
        // if(result.isValid) {
        $http({
            method: "POST",
            url: $rootScope.serviceurl+"addEventBid",
            data: {"price":$scope.price,"event_id":$stateParams.eventId,"user_id":$scope.loggedindetails.id,"description":$scope.description},
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            console.log(data);
            //return false;
            //params.validationGroup.reset();
            if(data.type == 'success'){
                //var message = data.message;
                //params.validationGroup.reset();
                $location.path('/merchantevent');

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

