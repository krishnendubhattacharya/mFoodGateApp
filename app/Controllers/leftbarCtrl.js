app.controller('leftbarCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth,$upload) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    console.log($scope.loggedindetails);

    $scope.getImageInfo = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "user/"+$scope.loggedindetails.id,
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            //console.log(data);
            //$scope.userInfo =data;
            $scope.userImagePath = data.user_details.image;
            //console.log($scope.allcat);

            //console.log($scope.userInfo.email);



        });

    }
    $scope.getImageInfo();

    $scope.urlParam = $location.path();
    //console.log($scope.urlParam);

    $scope.uploadResult = [];
    $scope.onFileSelect = function($files) {
        //$files: an array of files selected, each file has name, size, and type.
        // for (var i = 0; i < $files.length; i++) {
        var $file = $files;
        //console.log($file);
        $upload.upload({
            url: $rootScope.serviceurl + "profileimageupload",
            file: $file,
            data:{"user_id":$scope.loggedindetails.id},
            method: "POST",
            progress: function(e){}
        }).then(function(response) {
            // file is uploaded successfully
            //console.log($file);
            console.log(response);
            $scope.userImagePath = response.data.user_image_details;
            console.log($scope.userImagePath);

                //$scope.uploadResult.push(response.data);
                //console.log($scope.uploadResult);


        });
        //}
    }

});