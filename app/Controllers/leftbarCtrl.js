app.controller('leftbarCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth,$upload) {

    $scope.uploadResult = [];
    $scope.onFileSelect = function($files) {
        //$files: an array of files selected, each file has name, size, and type.
        // for (var i = 0; i < $files.length; i++) {
        var $file = $files;
        //console.log($file);
        $upload.upload({
            url: $rootScope.serviceurl + "profileimageupload",
            file: $file,
            method: "POST",
            progress: function(e){}
        }).then(function(response) {
            // file is uploaded successfully
            //console.log($file);
            console.log(response);

                //$scope.uploadResult.push(response.data);
                //console.log($scope.uploadResult);


        });
        //}
    }

});