app.controller('merchantoutletsCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, $timeout) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    $scope.img_uploader = null;
    $scope.all_locations = [];
    $scope.all_restaurant = [];
    $scope.textBox = {image:  {
            buttonText: 'Select file',
            labelText: 'Drop file here',
            multiple: false,
            accept: 'image/*',
            uploadUrl: $rootScope.serviceurl + 'MerchantOutletFileUpload',
            onUploaded:function(ret){
                $scope.menuInfo.image = ret.file.value.name;
                console.log(ret.file.value,ret.file.value.name);
            },
            onInitialized : function(e)
            {
                $scope.img_uploader = e.component;
            }
    },
        price:{
            mode: "number"
        },location:{
            dataSource: $scope.all_locations,
            displayExpr: "name",
            valueExpr: "value",
            onInitialized:function(e){
                $scope.loc_select = e.component;
                $scope.getLocations();
            }
        },restaurant:{
            dataSource: $scope.all_restaurant,
            displayExpr: "name",
            valueExpr: "value",
            onInitialized:function(e){
                $scope.res_select = e.component;
                $scope.getRestaurants();
            }
        }};


    $scope.changeView = function(){
        $scope.edit_mode = !$scope.edit_mode;
        $scope.menuInfo = {
            id:'',
            title:'',
            description:'',
            image:'',
            restaurant_id:'',
            address:'',
            business_hours:'',
            location_id:'',
            is_active:false
        }
        //$scope.textBox.image.value = null;
        //$scope.img_uploader = ;
        $scope.img_uploader.reset();

    }


    $scope.voucherInfo = null;
    $scope.datag = null;

    $scope.dataGridOptions = {
        dataSource: $scope.voucherInfo,

        selection: {
            mode: "single"
        },
        paging: {
            pageSize: 5
        },
        pager: {
            showPageSizeSelector: true,
            allowedPageSizes: [5, 10, 20],
            showInfo: true
        },
        onInitialized : function(e){
            console.log('By Bikash  --  ',e);
            $scope.datag = e.component;
        },
        columns: ["title","address", {
            caption:'Image',
            cellTemplate: function (container, options) {
                if(options.data.image) {
                    $('<img />')
                        .width(100)
                        .attr('src', options.data.imageurl)
                        .appendTo(container);
                }
            }
        },{caption:"Active",cellTemplate: function (container, options) {
            var text = options.data.is_active==1?'Yes':'No';
            $(container).html(text);
        }},
            {
                caption:'Edit',
                width: 100,
                alignment: 'center',
                cellTemplate: function (container, options) {
                    $('<button/>').addClass('dx-button')
                        .text('Edit')
                        .on('dxclick',function(){$scope.edit_menu(options.data); })
                        .appendTo(container);
                }
            },
            {
                caption:'Delete',
                width: 100,
                alignment: 'center',
                cellTemplate: function (container, options) {
                    $('<button/>').addClass('dx-button')
                        .text('Delete')
                        .on('dxclick',function(){$scope.delete_menu(options.data); })
                        .appendTo(container);
                }
            }/*,
             {
             width: 100,
             alignment: 'center',
             cellTemplate: function (container, options) {
             $('<button/>').addClass('dx-button')
             .text('ReSell')
             .on('dxclick', function () {
             //Do something with options.data;
             $location.path('/vouchersell/' + options.data.id);
             ghghgh(options.data.id);
             })
             .appendTo(container);

             }
             }*/

        ]
    };



    $scope.getLocations = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getAllLocations",

        }).success(function (data) {
            $scope.all_locations = [];
            angular.forEach(data.locations,function(val){
                $scope.all_locations.push({name:val.city,value:val.id});
            })
            $scope.loc_select.option({dataSource: $scope.all_locations});



        });

    }

    $scope.getRestaurants = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getActiveMerchantRestaurant/"+$scope.loggedindetails.id,

        }).success(function (data) {
            $scope.all_restaurant = [];
            angular.forEach(data.restaurants,function(val){
                $scope.all_restaurant.push({name:val.title,value:val.id});
            })
            $scope.res_select.option({dataSource: $scope.all_restaurant});



        });

    }




    $scope.getOutlets = function() {
        //$scope.dataGridOptions = null;
        $scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMerchantsOutlet/" + $scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
            //if($scope.datag)
            $scope.datag.option({dataSource:$scope.voucherInfo});

            $scope.listViewData.option({"dataSource": $scope.voucherInfo,hoverStateEnabled: false });
            //$scope.refresh_grid();
            //$timeout(function(){
            //$scope.datag.refresh();
            //},3000)


        });
    }
    $scope.getOutlets();


    $scope.save_menu = function(){

        //console.log($scope.textBox.image.value,$scope.menuInfo);
        if($scope.menuInfo.id)
        {
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"updateMerchantOutlet",
                data: $scope.menuInfo,
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                //console.log(data);
                if(data.type == 'success'){
                    var message = data.message;
                    //params.validationGroup.reset();
                    //$location.path('/login');
                    //$scope.getUserInfo();
                    //$location.path('/merchantoffer');
                    DevExpress.ui.notify({
                        message: "Updated Successfilly",
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "success", 3000);
                    $scope.edit_mode = !$scope.edit_mode;
                    $scope.getOutlets();
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
        }
        else
        {
            console.log($scope.menuInfo);
            $scope.menuInfo.user_id = $scope.loggedindetails.id;
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"addMerchantOutlet",
                data: $scope.menuInfo,
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                //console.log(data);
                if(data.type == 'success'){
                    var message = data.message;
                    //params.validationGroup.reset();
                    //$location.path('/login');
                    //$scope.getUserInfo();
                    //$location.path('/merchantoffer');
                    DevExpress.ui.notify({
                        message: "Added Successfilly",
                        position: {
                            my: "center top",
                            at: "center top"
                        }
                    }, "success", 3000);
                    $scope.edit_mode = !$scope.edit_mode;
                    $scope.getOutlets();
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
        }
    }

    $scope.edit_menu = function(menu)
    {
        console.log(menu);
        $scope.edit_mode = !$scope.edit_mode;
        $scope.menuInfo = {
            id:menu.id,
            title:menu.title,
            description:menu.description,
            image:menu.image,
            imageurl:menu.imageurl,
            restaurant_id:menu.restaurant_id,
            address:menu.address,
            business_hours:menu.business_hours,
            location_id:menu.location_id,
            outlet_id:menu.outlet_id,
            is_active:menu.is_active
        }
        $scope.img_uploader.reset();
    }

    $scope.loadList=function(e)
    {
        console.log("loadList")
        $scope.listViewData= e.component;
    }

    $scope.delete_menu = function (data) {
        if(confirm("Are you sure you want to delete?"))
        {
            $http({
                method: "DELETE",
                url: $rootScope.serviceurl + "deleteMerchantOutlet/"+data.id,
            }).success(function (data) {
                $scope.getOutlets();
            });
        }
    }

});
