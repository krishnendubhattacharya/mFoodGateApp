var app = angular.module("mFoodApp", [
        'ngRoute',
        'ngAnimate',
        'ngCookies',
        'ngSanitize',
        'ngTouch',
        'ui.router',
        'base64',
        'oc.lazyLoad',
        'cfp.loadingBar',
        'dx',
        'authFront',
        'ngToast',
        'ngFacebook',
        'angularFileUpload',
        'angularjs-dropdown-multiselect',
]);

app.config(['$facebookProvider', function($facebookProvider) {
        $facebookProvider.setAppId('1240070162687364');
    }])
    .run( function( $rootScope ) {
        // Load the facebook SDK asynchronously
        (function(){
            // If we've already installed the SDK, we're done
            if (document.getElementById('facebook-jssdk')) {return;}

            // Get the first script element, which we'll use to find the parent node
            var firstScriptElement = document.getElementsByTagName('script')[0];

            // Create a new script element and set its id
            var facebookJS = document.createElement('script');
            facebookJS.id = 'facebook-jssdk';

            // Set the new script's source to the source of the Facebook JS SDK
            facebookJS.src = '//connect.facebook.net/en_US/all.js';

            // Insert the Facebook JS SDK into the DOM
            firstScriptElement.parentNode.insertBefore(facebookJS, firstScriptElement);
        }());
    });


app.run(['$rootScope', '$state', '$stateParams',
    function ($rootScope, $state, $stateParams, myAuth) {
        // Attach Fastclick for eliminating the 300ms delay between a physical tap and the firing of a click event on mobile browsers
      // FastClick.attach(document.body);

        // Set some reference to access them from any scope
        $rootScope.$state = $state;
        $rootScope.$stateParams = $stateParams;

        // GLOBAL APP SCOPE
        // set below basic information
        //$rootScope.serviceurl = "http://localhost/prohelp/";
        //$rootScope.serviceurl = "http://livehelpout.com/beta.admin";
        $rootScope.serviceurl = "http://107.170.152.166/mFoodGateAPI/";
         $rootScope.siteurl = "http://107.170.152.166/mFood/#/";
        $rootScope.app = {
            name: 'mFoodGate', // name of your project
            author: 'NITS', // author's name or company name
            //admindescription: 'LiveHelpout Admin', // brief description
            //frontdescription: 'LiveHelpout', // brief description
            description:'mFoodGate',
            keywords:'mFoodGate',
            version: '1.0', // current version
            year: ((new Date()).getFullYear()), // automatic current year (for copyright information)
            isMobile: (function () {// true if the browser is a mobile device
                var check = false;
                if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                    check = true;
                };
                return check;
            })()
        };

    }]);

// translate config
/*app.config(['$translateProvider',
    function ($translateProvider) {

        // prefix and suffix information  is required to specify a pattern
        // You can simply use the static-files loader with this pattern:
        $translateProvider.useStaticFilesLoader({
            prefix: 'app/assets/i18n/',
            suffix: '.json'
        });

        // Since you've now registered more then one translation table, angular-translate has to know which one to use.
        // This is where preferredLanguage(langKey) comes in.
        $translateProvider.preferredLanguage('en');

        // Store the language in the local storage
        $translateProvider.useLocalStorage();

    }]);*/

// Angular-Loading-Bar
// configuration
app.config(['cfpLoadingBarProvider',
    function (cfpLoadingBarProvider) {
        cfpLoadingBarProvider.includeBar = true;
        cfpLoadingBarProvider.includeSpinner = false;

    }]);


app.config(['$stateProvider', '$urlRouterProvider', '$controllerProvider', '$compileProvider', '$filterProvider', '$provide', '$ocLazyLoadProvider', 'JS_REQUIRES','$locationProvider',
    function ($stateProvider, $urlRouterProvider, $controllerProvider, $compileProvider, $filterProvider, $provide, $ocLazyLoadProvider, jsRequires,$locationProvider) {

    app.controller = $controllerProvider.register;
     app.directive = $compileProvider.directive;
     app.filter = $filterProvider.register;
     app.factory = $provide.factory;
     app.service = $provide.service;
     app.constant = $provide.constant;
     app.value = $provide.value;

        // LAZY MODULES
        $ocLazyLoadProvider.config({
            debug: false,
            events: true,
            modules: jsRequires.modules
        });

///Remove Hash from URL//////
 //$locationProvider.html5Mode(true).hashPrefix('!');

    // APPLICATION ROUTES
    // -----------------------------------
    // For any unmatched url, redirect to /app/dashboard
    $urlRouterProvider.otherwise("/");
    //
    // Set up the states

        $stateProvider
        //Login state
            .state('frontend', {
                url: '',
                templateUrl: 'app/views/app.html',
                abstract :true,
                resolve: loadSequence('footer'),

            })
            .state('frontend.index', {
                url: '/',
                resolve: loadSequence('home'),
                templateUrl: 'app/views/home.html',
                title: 'Home'
            })
            .state('frontend.login', {
                url: '/login?returnUrl',
                resolve: loadSequence('login'),
                templateUrl: 'app/views/login.html',
                title: 'Login'
            })
            .state('frontend.register', {
                url: '/register',
                resolve: loadSequence('register'),
                templateUrl: 'app/views/register.html',
                title: 'Register'
            })
            .state('frontend.activation', {
                url: '/activation/:userId',
                resolve: loadSequence('activation'),
                templateUrl: 'app/views/activation.html',
                title: 'activation'
            })
            .state('frontend.dashboard', {
                url: '/dashboard',
                resolve: loadSequence('dashboard'),
                templateUrl: 'app/views/dashboard.html',
                title: 'Dashboard'
            })
            .state('frontend.profile', {
                url: '/profile',
                resolve: loadSequence('profile'),
                templateUrl: 'app/views/profile.html',
                title: 'Profile'
            })
            .state('frontend.changepassword', {
                url: '/changepassword',
                resolve: loadSequence('changepassword'),
                templateUrl: 'app/views/changepassword.html',
                title: 'Change Password'
            })
            .state('frontend.allvoucher', {
                url: '/allvoucher',
                resolve: loadSequence('allvoucher'),
                templateUrl: 'app/views/allvoucher.html',
                title: 'Voucher'
            })
            .state('frontend.swapvoucher', {
                url: '/swapvoucher',
                resolve: loadSequence('swapvoucher'),
                templateUrl: 'app/views/swapvoucher.html',
                title: 'Swap Voucher'
            })
            .state('frontend.mymembership', {
                url: '/mymembership',
                resolve: loadSequence('mymembership'),
                templateUrl: 'app/views/mymembership.html',
                title: 'My Membership',
                controller:'mymembershipCtrl'
            })
            .state('frontend.membershipdetail', {
                url: '/membershipdetail/:membershipId',
                resolve: loadSequence('membershipdetail'),
                templateUrl: 'app/views/membershipdetail.html',
                title: 'Membership Detail',
                controller:'membershipdetailCtrl'
            })
            .state('frontend.swapvoucherdetail', {
                url: '/swapvoucherdetail/:swapId',
                resolve: loadSequence('swapvoucherdetail'),
                templateUrl: 'app/views/swapvoucherdetail.html',
                title: 'Swap Voucher Detail'
            })
            .state('frontend.swapinterested', {
                url: '/swapinterested/:swapId',
                resolve: loadSequence('swapinterested'),
                templateUrl: 'app/views/swapinterested.html',
                title: 'Swap Voucher'
            })
            .state('frontend.voucherdetail', {
                url: '/voucherdetail/:voucherId',
                resolve: loadSequence('voucherdetail'),
                templateUrl: 'app/views/voucherdetail.html',
                title: 'Voucher Detail'
            })
            .state('frontend.addbid', {
                url: '/addbid/:sellId/:voucherId',
                resolve: loadSequence('bidvoucher'),
                templateUrl: 'app/views/addbid.html',
                title: 'Add Bid'
            })
            .state('frontend.sellbid', {
                url: '/sellbid/:sellId/:voucherId',
                resolve: loadSequence('bidvoucher'),
                templateUrl: 'app/views/sellbid.html',
                title: 'Add Bid'
            })
            .state('frontend.bidderlist', {
                url: '/bidderlist/:sellId',
                resolve: loadSequence('bidderlist'),
                templateUrl: 'app/views/bidderlist.html',
                title: 'Bidder List'
            })
            .state('frontend.giftvoucher', {
                url: '/giftvoucher/:voucherId',
                resolve: loadSequence('giftvoucher'),
                templateUrl: 'app/views/giftvoucher.html',
                title: 'Gift Voucher'
            })
            .state('frontend.mypoints', {
                url: '/mypoints',
                resolve: loadSequence('mypoints'),
                templateUrl: 'app/views/mypoints.html',
                title: 'My Points'
            })
            .state('frontend.bidvoucher', {
                url: '/bidvoucher',
                resolve: loadSequence('bidvoucher'),
                templateUrl: 'app/views/bidvoucher.html',
                title: 'Voucher Resell'
            })
            .state('frontend.setting', {
                url: '/setting',
                resolve: loadSequence('setting'),
                templateUrl: 'app/views/setting.html',
                title: 'Setting'
            })
            .state('frontend.vouchersell', {
                url: '/vouchersell/:voucherId',
                resolve: loadSequence('vouchersell'),
                templateUrl: 'app/views/vouchersell.html',
                title: 'Voucher Sell'
            })
            .state('sample', {
                url: '/sample',
                resolve: loadSequence('activation'),
                templateUrl: 'app/views/sample.html',
                title: 'sample'
            })
            .state('frontend.feedback', {
                url: '/feedback',
                resolve: loadSequence('feedback'),
                templateUrl: 'app/views/feedback.html',
                title: 'Feedback'
            })
            .state('frontend.preorder', {
                url: '/preorder',
                resolve: loadSequence('preorder'),
                templateUrl: 'app/views/preorder.html',
                title: 'Pre-Order'
            })
            .state('frontend.queuing', {
                url: '/queuing',
                resolve: loadSequence('queuing'),
                templateUrl: 'app/views/queuing.html',
                title: 'Merchant-queuing'
            })
            .state('frontend.merchantmembership', {
                url: '/merchant-membership',
                resolve: loadSequence('merchantmembership'),
                templateUrl: 'app/views/merchantmembership.html',
                title: 'Merchant-membership'
            })
            .state('frontend.promotionresults', {
                url: '/promotion-results',
                resolve: loadSequence('promotionresults'),
                templateUrl: 'app/views/promotionresults.html',
                title: 'Promotion Results'
            })
            .state('frontend.cms', {
                url: '/cms/:pageName',
                resolve: loadSequence('cms','ngMap'),
                templateUrl: 'app/views/cms.html',
                title: 'Pages'
            })
            .state('admin', {
                url: '/admin',
                templateUrl: 'app/views/admin/adminbase.html',
                abstract :true,
                resolve: loadSequence('admin','datatables'),

            })
            .state('admin.index', {
                url: '/home',
                templateUrl: 'app/views/admin/home.html',
                title: 'Home'
            })
            .state('admin.categorylist', {
                url: '/categorylist',
                templateUrl: 'app/views/admin/categorylist.html',
                title: 'Category List',
                resolve: loadSequence('categorylist')
            })
            .state('admin.newslist', {
                url: '/newslist',
                templateUrl: 'app/views/admin/newslist.html',
                title: 'News List',
                resolve: loadSequence('newslist','ngCkeditor','naif.base64')
            })
            .state('admin.locationlist', {
                url: '/location',
                templateUrl: 'app/views/admin/locationlist.html',
                title: 'Location List',
                resolve: loadSequence('locationlist')
            })
            .state('adminlogin', {
                url: '/adminlogin',
                template: '<div ui-view ></div>',
                abstract :true,
                resolve: loadSequence('admin')
            })
            .state('adminlogin.signin', {
                url: '/signin',
                templateUrl: 'app/views/admin/login.html',
                resolve: loadSequence('adminlogin'),
                title: 'Login'
            })
            .state('merchant', {
                url: '/merchant',
                templateUrl: 'app/views/merchant/merchantbase.html',
                abstract :true,
                resolve: loadSequence('merchanthome'),

            })
            .state('merchant.login', {
                url: '/login',
                templateUrl: 'app/views/merchant/merchantlogin.html',
                resolve: loadSequence('merchantlogin'),

            })
            .state('frontend.merchantprofile', {
                url: '/merchantprofile',
                resolve: loadSequence('merchantprofile'),
                templateUrl: 'app/views/merchant/merchantprofile.html',
                title: 'Merchant Profile'
            })
            .state('frontend.merchantoffer', {
                url: '/merchantoffer',
                resolve: loadSequence('merchantoffer'),
                templateUrl: 'app/views/merchant/merchantoffer.html',
                title: 'My Offer'
            })
            .state('frontend.merchantaddoffer', {
                url: '/merchantaddoffer',
                resolve: loadSequence('merchantaddoffer'),
                templateUrl: 'app/views/merchant/merchantaddoffer.html',
                title: 'Add Offer'
            })
            .state('frontend.merchantofferdetail', {
                url: '/merchantofferdetail/:offerId',
                resolve: loadSequence('merchantofferdetail'),
                templateUrl: 'app/views/merchant/merchantofferdetail.html',
                title: 'Offer Detail'
            })
            .state('frontend.voucher', {
                url: '/voucher',
                resolve: loadSequence('voucher'),
                templateUrl: 'app/views/voucher.html',
                title: 'Voucher'
            })
            .state('frontend.membership', {
                url: '/membership',
                resolve: loadSequence('membership'),
                templateUrl: 'app/views/membership.html',
                title: 'Membership'
            })
            .state('frontend.marketplace', {
                url: '/marketplace',
                resolve: loadSequence('marketplace'),
                templateUrl: 'app/views/marketplace.html',
                title: 'Marketplace'
            })
            .state('frontend.news', {
                url: '/news',
                resolve: loadSequence('news'),
                templateUrl: 'app/views/news.html',
                title: 'News'
            })
            .state('frontend.promodetails', {
                url: '/promodetails/:promoId',
                resolve: loadSequence('promodetails','ngMap','mCart'),
                templateUrl: 'app/views/promodetails.html',
                title: 'Promo Detail'
            })
            .state('frontend.refinerestaurent', {
                url: '/refinerestaurent/:categoryId',
                resolve: loadSequence('refinerestaurent'),
                templateUrl: 'app/views/refinerestaurent.html',
                title: 'Restaurent'
            })
            .state('frontend.restaurentpromo', {
                url: '/restaurentpromo/:restaurantId',
                resolve: loadSequence('restaurentpromo'),
                templateUrl: 'app/views/restaurentpromo.html',
                title: 'Restaurent Promo'
            })
            .state('frontend.voucherdetailforall', {
                url: '/sellvoucherdetail/:voucherId/:sellId',
                resolve: loadSequence('voucherdetailforall'),
                templateUrl: 'app/views/voucherdetailforall.html',
                title: 'Voucher Detail'
            })
            .state('frontend.payment_return',{
                url:'/payment_return?success&paymentId&token&PayerID',
                resolve: loadSequence('paymentreturnCtrl'),
                templateUrl:'app/views/payment_return.html',
                title: 'Please Wait...'
            })
            .state('frontend.acceptswap', {
                url: '/acceptswap/:siid',
                resolve: loadSequence('acceptswap'),
                templateUrl: 'app/views/acceptswap.html',
                title: 'swap'
            })
            .state('frontend.newsdetail', {
                url: '/newsdetail/:newsId',
                resolve: loadSequence('newsdetail'),
                templateUrl: 'app/views/newsdetail.html',
                title: 'News Detail'
            })


        ;



























        function loadSequence() {
            var _args = arguments;
            return {
                deps: ['$ocLazyLoad', '$q',
                    function ($ocLL, $q) {
                        var promise = $q.when(1);
                        for (var i = 0, len = _args.length; i < len; i++) {
                            promise = promiseThen(_args[i]);
                        }
                        return promise;

                        function promiseThen(_arg) {
                            if (typeof _arg == 'function')
                                return promise.then(_arg);
                            else
                                return promise.then(function () {
                                    var nowLoad = requiredData(_arg);
                                    if (!nowLoad)
                                        return $.error('Route resolve: Bad resource name [' + _arg + ']');
                                    return $ocLL.load(nowLoad);
                                });
                        }

                        function requiredData(name) {
                            if (jsRequires.modules)
                                for (var m in jsRequires.modules)
                                    if (jsRequires.modules[m].name && jsRequires.modules[m].name === name)
                                        return jsRequires.modules[m];
                            return jsRequires.scripts && jsRequires.scripts[name];
                        }
                    }]
            };
        }

  }]);
