'use strict';
/** 
 * controllers used for the login
 */
app.controller('headerCtrl', function ($rootScope, $scope, $http, $location, $base64, myAuth, $cookieStore) {
        $scope.getLoginDetails=function(){
       
        myAuth.updateUserinfo(myAuth.getUserAuthorisation());
        $scope.loggedindetails = myAuth.getUserNavlinks();
        console.log($scope.loggedindetails);
        console.log('nnnnnnnnnnnnn');
         };
         $scope.getLoginDetails();
         $scope.$on('updateLoginDetails',function(){
                 console.log('called');
                 $scope.getLoginDetails();
                 $scope.$apply();
         });
         
   
});

