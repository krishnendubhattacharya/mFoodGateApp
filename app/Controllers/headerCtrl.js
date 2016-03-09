'use strict';
/** 
 * controllers used for the login
 */
app.controller('headerCtrl', function ($rootScope, $scope, $http, $location, myAuth, $cookieStore) {

    /*$scope.sidemenubar=function() {
        var slideout = new Slideout({
            'panel': document.getElementById('panel'),
            'menu': document.getElementById('menu'),
            'side': 'right'
        });

        document.querySelector('.js-slideout-toggle').addEventListener('click', function () {
            slideout.toggle();
        });

        document.querySelector('.menu').addEventListener('click', function (eve) {
            if (eve.target.nodeName === 'A') {
                slideout.close();
            }
        });
    };
    $scope.sidemenubar();*/
        $scope.getLoginDetails=function(){
       
        myAuth.updateUserinfo(myAuth.getUserAuthorisation());
        $scope.loggedindetails = myAuth.getUserNavlinks();
        console.log($scope.loggedindetails);
        //console.log('nnnnnnnnnnnnn');
         };
         
         $scope.userLogout=function(){
                console.log($scope.loggedindetails);
                //return false;
                $http({
                    method: "POST",
                    url: $rootScope.serviceurl + "users/logout",
                    data: {'userid': $scope.loggedindetails.id},
                        headers: {'Content-Type': 'application/json'},
                }).success(function(data) {
                    
                    
                myAuth.resetUserinfo();
                    $cookieStore.put('users', null);
                    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
                    $scope.loggedindetails = myAuth.getUserNavlinks();
                    $scope.loggedindetails = '';
                    $rootScope.$emit('updateLoginDetails');
                    $scope.loggedin = false;                   
                    $scope.notloggedin = true;                   
			        
                    $location.path("/");
                    DevExpress.ui.notify({
                            message: "Logout Successfully",
                            position: {
                                my: "center top",
                                at: "center top"
                            }
                        }, "success", 3000); 
                });
                
         };
         
         $scope.getLoginDetails();
         $rootScope.$on('updateLoginDetails',function(){
                 //console.log('called');
                 $scope.getLoginDetails();
                 //$scope.$apply();
         });
         
   
});

