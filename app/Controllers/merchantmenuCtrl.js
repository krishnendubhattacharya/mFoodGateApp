app.controller('merchantmenuCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, $timeout) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    $scope.img_uploader = null;
    $scope.textBox = {image:  {
            buttonText: 'Select file',
            labelText: 'Drop file here',
            multiple: false,
            accept: 'image/*',
            uploadUrl: $rootScope.serviceurl + 'menuFileUpload',
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
        }};


    $scope.changeView = function(){
        $scope.edit_mode = !$scope.edit_mode;
        $scope.menuInfo = {
            id:'',
            title:'',
            description:'',
            price:'',
            status:false
        }
        //$scope.textBox.image.value = null;
        //$scope.img_uploader = ;
        $scope.img_uploader.reset();

    }

    $scope.edit_menu = function(menu)
    {
        console.log(menu);
        $scope.edit_mode = !$scope.edit_mode;
        $scope.menuInfo = {
            id:menu.id,
            title:menu.title,
            description:menu.description,
            price:menu.price,
            status:menu.status=="Active"?true:false,
            imageurl:menu.imageurl
        }
    }
    $scope.datag = null;
    $scope.getMenus = function() {
        $scope.dataGridOptions = null;
        $scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getMenuByUser/" + $scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
            $scope.dataGridOptions = {
                dataSource: $scope.voucherInfo,
                onInitialized:function(e){
                    console.log('By Bikash  --  ',e);
                    $scope.datag = e.component;
                },
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
                columns: ["sl", "title","price", {
                    caption:'Image',
                    cellTemplate: function (container, options) {
                        if(options.data.image) {
                            $('<img />')
                                .height(100)
                                .attr('src', options.data.imageurl)
                                .appendTo(container);
                        }
                    }
                },"status",
                    {
                         caption:'Action',
                         width: 100,
                         alignment: 'center',
                         cellTemplate: function (container, options) {
                             $('<button/>').addClass('dx-button')
                             .text('Edit')
                             .on('dxclick',function(){$scope.edit_menu(options.data); })
                             .appendTo(container);

                             $('<button/>').addClass('dx-button')
                                 .text('Edit')
                                 .on('dxclick',function(){$scope.edit_menu(options.data); })
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


            //$timeout(function(){
                //$scope.datag.refresh();
            //},3000)


        });
    }
    $scope.getMenus();

    $scope.refresh_grid = function()
    {
        var dataGrid = angular.element('#gridContainer').dxDataGrid('instance');
        console.log($scope.voucherInfo);
        dataGrid.refresh();
    }

    $scope.save_menu = function(){

        //console.log($scope.textBox.image.value,$scope.menuInfo);
        if($scope.menuInfo.id)
        {
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"updateMenu",
                data: $scope.menuInfo,
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                console.log(data);
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
                    $scope.getMenus();
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
            $scope.menuInfo.user_id = $scope.loggedindetails.id;
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"addMenu",
                data: $scope.menuInfo,
                headers: {'Content-Type': 'application/json'},
            }).success(function(data) {
                console.log(data);
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
                    $scope.getMenus();
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



});
