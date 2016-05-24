app.controller('merchantnewsCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth, $timeout) {
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
            uploadUrl: $rootScope.serviceurl + 'newsFileUpload',
            onUploaded:function(ret){
                $scope.menuInfo.image = ret.file.value.name;
                console.log(ret.file.value,ret.file.value.name);
            },
            onInitialized : function(e)
            {
                $scope.img_uploader = e.component;
            }
    },
        };


    $scope.changeView = function(){
        $scope.edit_mode = !$scope.edit_mode;
        $scope.menuInfo = {
            id:'',
            title:'',
            description:'',
            published_date:'',
            featured_event:false,
            special_event:false,
            post_to_public:false,
            is_active:false,
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
            published_date:menu.published_date,
            featured_event:menu.featured_event==1?true:false,
            special_event:menu.featured_event==1?true:false,
            post_to_public:menu.post_to_public==1?true:false,
            image:menu.image,
            imageurl:menu.imageurl
        }
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
        columns: [ "title", {
            caption:'Image',
            cellTemplate: function (container, options) {
                if(options.data.image) {
                    $('<img />')
                        .width(200)
                        .attr('src', options.data.imageurl)
                        .appendTo(container);
                }
            }
        },{caption:"status",cellTemplate:function(container, options){
            var f=options.data.is_active==1?'Yes':'No';
            $(container).text(f);
        }},
            {caption:"Featured",cellTemplate:function(container, options){
                var f=options.data.featured_event==1?'Yes':'No';
                $(container).text(f);
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

    $scope.delete_menu = function(data)
    {
        if(confirm('Are you sure you want to delete this news?'))
        {
            $http({
                method: "delete",
                url: $rootScope.serviceurl + "deleteNews/" + data.id,
            }).success(function (data) {
                DevExpress.ui.notify({
                    message: "Deleted Successfilly",
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "success", 3000);
                //$scope.edit_mode = !$scope.edit_mode;
                $scope.getMenus();
            })
        }
    }

    $scope.getMenus = function() {
        //$scope.dataGridOptions = null;
        $scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getNewsByMerchant/" + $scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
            if($scope.datag)
                $scope.datag.option({dataSource:$scope.voucherInfo});


            //$scope.refresh_grid();
            //$timeout(function(){
                //$scope.datag.refresh();
            //},3000)


        });
    }
    $scope.getMenus();



   $scope.$watchCollection('voucherInfo', function() {
        //var dataGrid = angular.element('#gridContainer').dxDataGrid('instance');
        //console.log($scope.voucherInfo);
        //if(dataGrid)
            //dataGrid.option({dataSource:$scope.voucherInfo});
       //console.log('1st');
       if($scope.datag) {
           $scope.datag.option({dataSource:$scope.voucherInfo});
           //console.log('2nd');
       }
    });

    $scope.save_menu = function(){

        //console.log($scope.textBox.image.value,$scope.menuInfo);
        $scope.menuInfo.published_date = moment($scope.menuInfo.published_date).format("YYYY/MM/DD");
        if($scope.menuInfo.id)
        {
            $http({
                method: "POST",
                url: $rootScope.serviceurl+"updateMerchantNews",
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
                url: $rootScope.serviceurl+"addMerchantNews",
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
