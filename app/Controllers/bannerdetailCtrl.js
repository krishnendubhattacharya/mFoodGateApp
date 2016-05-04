app.controller('bannerdetailCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    /*$scope.pageName = $stateParams.pageName;

    if($scope.pageName=='contact-us')
    {
        NgMap.getMap().then(function(map) {
            console.log(map.getCenter());
            console.log('markers', map.markers);
            console.log('shapes', map.shapes);
        });
    }
    $scope.pagedetails = []
    $scope.getPageDetails = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getContent/" + $scope.pageName,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.content) {
                $scope.pagedetails = data.content;
            }
        })
    }
    $scope.getPageDetails();*/
    $scope.topTab = 1;
    $scope.setActiveTab = function(v){
        $scope.topTab = v;
    }

    $scope.bottomTab = 1;
    $scope.setBottomTab = function(v){
        $scope.bottomTab = v;
    }

    $scope.getNewsDetail = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getBannerDetails/"+$stateParams.bannerId,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            console.log('===================',data);
            if(data.type="success") {
                $scope.allnews = data.data;
                console.log('===================',$scope.allnews);
            }
        })
    }
    $scope.getNewsDetail();

    $scope.getMostViews = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getNewsMostViews",
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.mostviews) {
                $scope.mostviews = data.mostviews;
            }
        })
    }
    $scope.getMostViews();

    $scope.getLatestNews = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getActiveBannerOther/"+$stateParams.bannerId,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.type == 'success') {
                $scope.latestnews = data.banner;
            }
        })
    }
    $scope.getLatestNews();

    $scope.getUpdatedBanner = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getUpdateBannerOther/"+$stateParams.bannerId,
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.banner) {
                $scope.updatebanner = data.banner;
                //console.log($scope.bannernews);
            }
        })
    }
    $scope.getUpdatedBanner();


    $scope.getFeaturedPromo = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getFeaturedCategories",
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            if(data.type == 'success') {
                $scope.featuredPromo = data.featuredcat;
            }
        })
    }
    $scope.getFeaturedPromo();

    $scope.getFeaturedAds = function(){
        $http({
            method: "GET",
            url: $rootScope.serviceurl+"getActiveAdsByLocation/1",
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {

                $scope.featuredAds = data.ads;
                console.log(1);
                console.log($scope.featuredAds);

        })
    }

    $scope.getFeaturedAds();
});