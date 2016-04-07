app.controller('profileCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    //console.log($scope.loggedindetails);
    //$scope.userInfo ='';
    $scope.capitals = [];
    $scope.getUserInfo = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "user/"+$scope.loggedindetails.id,
            //data: {"email":$scope.email,"password":$scope.password},
            //headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            //console.log(data.email);
            $scope.userInfo =data.user_details;
            //console.log($scope.allcat);
            $scope.capitals = [{"id":"5","name":"Japanese Food","parent_id":"0","is_active":"1"},{"id":"7","name":"Warong Kopi","parent_id":"0","is_active":"1"},{"id":"8","name":"Cafe & Bar","parent_id":"0","is_active":"1"}];

            console.log($scope.userInfo.email);



        });

    }
    $scope.getUserInfo();
    $scope.dateBox = {
        dob: {
            format: "yyyy/MM/dd"
        },
    };
    var selectBoxData = [
        { "name": "Male", "value": "M" },
        { "name": "Female", "value": "F" }
    ];
    $scope.selectBox = {
        simple: {
            dataSource: selectBoxData,
            displayExpr: "name",
            valueExpr: "value"
        }
    };
    $scope.textBox = {
        first_name: {
            mode: "text"

        },
        last_name: {
            mode: "text",

        },
        email: {
            mode: "email",

        },
        username: {
            mode: "text",

        },
        phone: {
            mode: "number",

        }
    };

    $scope.textArea = {
        height: 90
    };

    $scope.emailValidationRules = {
        validationRules: [{
            type: "required",

        }]
    };
    var BoxData = [
        { "name": "Male", "id": "M" },
        { "name": "Female", "id": "F" }
    ];

    /*$scope.tagBoxData = new DevExpress.data.DataSource({ store: [], paginate: false });

        for (var i = 0; i < BoxData.length; i++) {
            $scope.tagBoxData.store().insert(BoxData[i]);
        }
        $scope.tagBoxData.load();
    console.log($scope.tagBoxData);*/

    $scope.tagBoxData = new DevExpress.data.DataSource({ store: [], paginate: false });
    $scope.viewCategory = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getCategories",

        }).success(function (data) {

            $scope.allcat = data.category;

            for (var i = 0; i < $scope.allcat.length; i++) {
                $scope.tagBoxData.store().insert($scope.allcat[i]);
            }
            $scope.tagBoxData.load();
            console.log($scope.tagBoxData._items);
            $scope.taglist = $scope.tagBoxData._items;



        });

    }

    $scope.viewCategory();
    //$scope.capitals = [];
    //$scope.capitals = ["8", "5"];

    $scope.validateAndSubmit = function(params) {

        //alert(1);
        console.log($scope.capitals);
        return false;
        //var result = params.validationGroup.validate();
        //if(result.isValid) {
        console.log($scope.capitals);
        alert($scope.userInfo.dob);
        $scope.userInfo.dob = moment($scope.userInfo.dob).format("YYYY/MM/DD");
        alert($scope.userInfo.dob);


        //return false;

            $http({
                method: "PUT",
                url: $rootScope.serviceurl+"users/"+$scope.loggedindetails.id,
                data: {"email":$scope.userInfo.email,"phone":$scope.userInfo.phone,"about_me":$scope.userInfo.about_me,"first_name":$scope.userInfo.first_name,"last_name":$scope.userInfo.last_name,"dob":$scope.userInfo.dob,"occupation":$scope.userInfo.occupation,"gender":$scope.userInfo.gender},
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                console.log(data);
                if(data.type == 'success'){
                    var message = data.message;
                    //params.validationGroup.reset();
                    //$location.path('/login');
                    $scope.getUserInfo();
                    DevExpress.ui.notify({
                        message: "Edited Successfilly",
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "success", 3000);
                }else{
                    var message = "Error occured.";
                    DevExpress.ui.notify({
                        message: message,
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "error", 3000);
                }

            })

            //form.submit();
            //params.validationGroup.reset();
       // }
    };



});