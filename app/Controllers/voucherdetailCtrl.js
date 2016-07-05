app.controller('voucherdetailCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth,$timeout) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    console.log($stateParams.voucherId);
    $scope.voucherInfo = null;


    $scope.getVoucherDetail = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "vourcherdetail/"+$stateParams.voucherId,
        }).success(function (data) {
            //console.log('Voucher details === ',data);
            $scope.voucherInfo =data;

                $scope.restaurant = data.restaurant;
            $scope.related_images = data.promo_images;
            $timeout(function(){
                // $('#ca-container').contentcarousel();
                var banner_carousal = $('.featured_carousel2');
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
                            items:1
                        }
                    }
                });
            },30);
            $timeout(function(){
                // $('#ca-container').contentcarousel();
                var banner_carousal = $('.featured_carousel3');
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
                            items:1
                        }
                    }
                });
            },30);

            $scope.getQrCode();
        });

    }
    $scope.getVoucherDetail();

    $scope.qrlink = '';
    $scope.getQrCode = function(){
        if($scope.voucherInfo) {
            var query_string='';
            query_string += "?merchant_id=" + $scope.voucherInfo.mer_name;
            query_string += "&restaurant_ids=" + $scope.voucherInfo.all_res;
            query_string += "&voucher_id=" + $scope.voucherInfo.voucher_no;
            $scope.qrlink = $rootScope.serviceurl + "genVoucherQrCode" + query_string;
        }
    }

    $scope.boucherResell = function () {
        $location.path('/vouchersell/' + $stateParams.voucherId);
    }

    $scope.bocherGift = function () {
        $location.path('/giftvoucher/' + $stateParams.voucherId);
    }

    $scope.swapvoucher = function (offer_id) {
        //$location.path('/giftvoucher/' + $stateParams.voucherId);
        //alert(offer_id);
        //return false;
        $location.path('/addswapvoucher/' + $stateParams.voucherId + '/' +offer_id);
        /*$http({
            method: "POST",
            url: $rootScope.serviceurl + "swap",
            data: {"voucher_id":$stateParams.voucherId,"user_id":$scope.loggedindetails.id,"offer_id":offer_id},
        }).success(function (data) {
            console.log(data);
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
    }




});