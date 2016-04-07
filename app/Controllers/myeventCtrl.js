app.controller('myeventCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }



    $scope.typeList = [];
    $scope.areaList = [];
    //$scope.event.image = [];
    $scope.changeView = function(){
        $scope.edit_mode = !$scope.edit_mode;
        $scope.event = {
            title:'',
            description:'',
            from_date:'',
            to_date:'',
            is_active:false,
        }
    }
    $scope.edit_event = function(event)
    {
        console.log(event);
        $scope.edit_mode = !$scope.edit_mode;
        $scope.event = {
            id:event.id,
            title:event.title,
            description:event.description,
            from_date:event.from_date,
            to_date:event.to_date,
            status:event.is_active=="1"?true:false
        }
        //$scope.img_uploader.reset();
    }

    $scope.getEvents = function() {
        $scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getEventsByUser/" + $scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
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

                columns: ["title", "created_on","from_date", "to_date",
                    {
                        caption:'Action',
                        width: 300,
                        alignment: 'center',
                        cellTemplate: function (container, options) {
                            $('<button/>').addClass('dx-button')
                                .text('Image')
                                .on('dxclick',function(){$scope.image_event(options.data); })
                                .appendTo(container);

                            $('<button/>').addClass('dx-button')
                                .text('Edit')
                                .on('dxclick',function(){$scope.edit_event(options.data); })
                                .appendTo(container);

                            $('<button/>').addClass('dx-button')
                                .text('Delete')
                                .on('dxclick', function () {
                                    $scope.delete_event(options.data);
                                })
                                .appendTo(container);
                        }
                    },
                    /*{
                        caption:'Edit',
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {
                            $('<button/>').addClass('dx-button')
                                .text('Edit')
                                .on('dxclick',function(){$scope.edit_event(options.data); })
                                .appendTo(container);
                        }
                    },
                    {
                        caption: 'Delete',
                        width: 100,
                        alignment: 'center',
                        cellTemplate: function (container, options) {
                            $('<button/>').addClass('dx-button')
                                .text('Delete')
                                .on('dxclick', function () {
                                    $scope.delete_event(options.data);
                                })
                                .appendTo(container);
                        }
                    }*/

                    /*{
                     width: 100,
                     alignment: 'center',
                     cellTemplate: function (container, options) {

                     $('<button/>').addClass('dx-button')
                     .text('Details')
                     .on('dxclick', function () {
                     $location.path('/voucherdetail/' + options.data.id);
                     })
                     .appendTo(container);
                     }
                     },
                     {
                     width: 100,
                     alignment: 'center',
                     cellTemplate: function (container, options) {
                     $('<button/>').addClass('dx-button')
                     .text('ReSell')
                     .on('dxclick', function () {
                     //Do something with options.data;
                     $location.path('/vouchersell/' + options.data.id);
                     })
                     .appendTo(container);

                     }
                     }*/

                ]
            };
        });
    }
    $scope.getEvents();

    $scope.dateBox = {
        from_date: {
            format: "date",
            value: new Date(2015, 12, 1, 6)
        },
        to_date: {
            format: "yyyy/MM/dd"
        },
    };
    /*$scope.img_uploader = null;
    $scope.textBox = {image:  {
        buttonText: 'Select file',
        labelText: 'Drop file here',
        multiple: true,
        accept: 'image/*',
        onValueChanged:function(){
            $scope.event.image=[];
        },
        uploadUrl: $rootScope.serviceurl + 'eventFilesUpload',
        onUploaded:function(ret){
            //console.log(ret.file);
            //$scope.event.image = ret.file.value.name;
            $scope.event.image.push(ret.file.value.name);
            //console.log(ret.file.value,ret.file.value.name);
        },
        onInitialized : function(e)
        {
            $scope.img_uploader = e.component;
        }
    }
    };*/
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

    $scope.tagBoxDataLocation = new DevExpress.data.DataSource({ store: [], paginate: false });
    $scope.viewLocation = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getLocations",

        }).success(function (data) {

            $scope.allLoc = data.location;

            for (var i = 0; i < $scope.allLoc.length; i++) {
                $scope.tagBoxDataLocation.store().insert($scope.allLoc[i]);
            }
            $scope.tagBoxDataLocation.load();
            //console.log($scope.tagBoxData._items);
            //$scope.taglist = $scope.tagBoxData._items;



        });

    }

    $scope.viewLocation();

    $scope.save_event = function(){
        console.log($scope.event);
        console.log($scope.typeList);
        console.log($scope.areaList);

        $scope.event.from_date = moment($scope.event.from_date).format("YYYY/MM/DD");
        $scope.event.to_date = moment($scope.event.to_date).format("YYYY/MM/DD");

        $scope.event.user_id = $scope.loggedindetails.id;
        $scope.eventdata = $scope.event;
        $scope.typedata = $scope.typeList;
        $scope.areadata = $scope.areaList;

        //return false;
        $http({
            method: "POST",
            url: $rootScope.serviceurl+"addEvent",
            data: {"eventdata":$scope.eventdata,"typedata":$scope.typedata,"areadata":$scope.areadata},
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



});
