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
        'pascalprecht.translate',
        'dx',
        'authFront'
]);


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
         $rootScope.siteurl = "http://107.170.152.166/mFood/";
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
 $locationProvider.html5Mode(true).hashPrefix('!');

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
            //resolve: loadSequence('devExtremeJS','devExtremeCSS'),

        })
        .state('frontend.index', {
          url: '/',
          resolve: loadSequence('home'),
          templateUrl: 'app/views/home.html',
          title: 'Home'
        })
        .state('frontend.login', {
            url: '/login',
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
        .state('sample', {
            url: '/sample',
            resolve: loadSequence('activation'),
            templateUrl: 'app/views/sample.html',
            title: 'sample'
        });



























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
