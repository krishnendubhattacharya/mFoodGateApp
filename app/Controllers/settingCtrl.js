app.controller('settingCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }


    $scope.checkBox = {
        checked: {
            value: true
        },
        unchecked: {
            value: false
        }

    };

    $scope.settingList = function(){

        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getUserSettings/"+$scope.loggedindetails.id,
        }).success(function (data) {
                console.log(data.data.media_notification);

            //$scope.settingList =data.getMenuPromo;
            if( data.data.media_notification == 0){
                $scope.media_notification = false;
            }else{
                $scope.media_notification = true;
            }

            if( data.data.expire_date_notification == 0){
                $scope.expire_date_notification = false;
            }else{
                $scope.expire_date_notification = true;
            }

            if( data.data.promo_notification == 0){
                $scope.promo_notification = false;
            }else{
                $scope.promo_notification = true;
            }

            if( data.data.news_letter_notification == 0){
                $scope.news_letter_notification = false;
            }else{
                $scope.news_letter_notification = true;
            }
            //$scope.media_notification = data.data.media_notification;
            //$scope.expire_date_notification = data.data.expire_date_notification;
            //$scope.promo_notification = data.data.promo_notification;
            //$scope.news_letter_notification = data.data.news_letter_notification;

            //console.log($scope.catInfo);

        });
    }
    $scope.settingList();

    $scope.saveSetting = function(params) {
        //alert($scope.media_notification);
        //alert($scope.expire_date_notification);
        //alert($scope.promo_notification);


        $http({
            method: "PUT",
                url: $rootScope.serviceurl+"updateUserSettings/"+$scope.loggedindetails.id,
                data: {"media_notification":$scope.media_notification,"expire_date_notification":$scope.expire_date_notification,"user_id":$scope.loggedindetails.id,"promo_notification":$scope.promo_notification,"news_letter_notification":$scope.news_letter_notification},
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                console.log(data);
                //return false;
                //params.validationGroup.reset();
                if(data.type == 'success'){
                    //var message = data.message;
                    //params.validationGroup.reset();
                    $location.path('/setting');

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

            });
    };

});