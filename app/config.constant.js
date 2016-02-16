'use strict';

/**
 * Config constant
 */
app.constant('APP_MEDIAQUERY', {
    'desktopXL': 1200,
    'desktop': 992,
    'tablet': 768,
    'mobile': 480
});
app.constant('JS_REQUIRES', {
    //*** Scripts
    scripts: {
        'devExtremeJS':['app/assets/js/globalize.min.js','app/assets/js/dx.chartjs.js','http://cdn3.devexpress.com/jslib/14.1.3/js/dx.all.js','app/assets/js/vectormap-data/world.js',
        'app/assets/js/vectormap-data/africa.js','app/assets/js/vectormap-data/canada.js','app/assets/js/vectormap-data/eurasia.js','app/assets/js/vectormap-data/europe.js','app/assets/js/vectormap-data/usa.js',
        'app/assets/scripts/date.js'],
        'devExtremeCSS':['app/assets/css/reset.css','app/assets/css/dx.common.css','app/assets/css/dx.light.css'],
        'home':['app/Controllers/homeCtrl.js'],
        'login':['app/Controllers/loginCtrl.js'],
        'register':['app/Controllers/registerCtrl.js'],
        'activation':['app/Controllers/activationCtrl.js'],
        'sample':['app/Controllers/sampleCtrl.js'],
    },

    //*** angularJS Modules
    modules: [{
        name: 'angularMoment',
        files: ['vendor/moment/angular-moment.min.js']
    }]
});
