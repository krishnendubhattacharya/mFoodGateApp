app.controller('myeventCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    if(!$scope.loggedindetails){

        $location.path("/login");
    }


    $scope.event_info=null;
    $scope.typeList = [];
    $scope.areaList = [];
    $scope.selectedLocation = [];
    $scope.selectedTypes = [];
    //$scope.event.image = [];
    $scope.img_uploader = null;
    $scope.textBox = {image:  {
        buttonText: 'Select file',
        labelText: 'Drop file here',
        multiple: false,
        accept: 'image/*',
        uploadUrl: $rootScope.serviceurl + 'eventFilesUpload',
        onUploaded:function(ret){
            //console.log(ret.file);
            //$scope.event.image = ret.file.value.name;
            $scope.event.image = ret.file.value.name;
            //console.log(ret.file.value,ret.file.value.name);
        },
        onInitialized : function(e)
        {
            $scope.img_uploader = e.component;
        }
    }
    };

    $scope.changeView = function(){
        $scope.edit_mode = !$scope.edit_mode;
        $scope.event = {
            title:'',
            description:'',
            from_date:'',
            to_date:'',
            is_active:false,
        }
        $scope.selectedLocation=[];
        $scope.selectedTypes =[];
        $scope.img_uploader.reset();

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
            is_active:event.is_active=="1"?true:false,
            imageurl:event.image_url
        }
        $scope.event_info=event;
        $scope.setSelectedTypes();
        $scope.setSelectedLocation();
        $scope.img_uploader.reset();
        //console.log($scope.event);
        //$scope.img_uploader.reset();
    }

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
            $scope.datagridobj = e.component;
        },
        columns: ["title", "created_on","from_date", "to_date","status",
            {
                caption:'Action',
                width: 400,
                alignment: 'center',
                cellTemplate: function (container, options) {
                    $('<button/>').addClass('dx-button')
                        .text('Detail')
                        .on('dxclick',function(){
                            //$scope.image_event(options.data.id);
                            $location.path('/eventdetail/' + options.data.id);
                        })
                        .appendTo(container);
                    $('<button/>').addClass('dx-button')
                        .text('Image')
                        .on('dxclick',function(){$scope.image_event(options.data.id); })
                        .appendTo(container);

                    $('<button/>').addClass('dx-button')
                        .text('Edit')
                        .on('dxclick',function(){$scope.edit_event(options.data); })
                        .appendTo(container);

                    /*$('<button/>').addClass('dx-button')
                        .text('Delete')
                        .on('dxclick', function () {
                            $scope.delete_event(options.data);
                        })
                        .appendTo(container);*/
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

    $scope.getEvents = function() {
        $scope.edit_mode = false;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getEventsByUser/" + $scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo = data.data;
            //console.log($scope.voucherInfo);
            $scope.datagridobj.option('dataSource',$scope.voucherInfo);
        });
    }
    $scope.getEvents();

    $scope.image_event = function (event_id) {
        $location.path('/eventimage/' + event_id);
    }

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
            $scope.typeData.option('items',$scope.allcat);
            $scope.setSelectedTypes();

            /*for (var i = 0; i < $scope.allcat.length; i++) {
                $scope.tagBoxData.store().insert($scope.allcat[i]);
            }
            $scope.tagBoxData.load();
            console.log($scope.tagBoxData._items);
            $scope.taglist = $scope.tagBoxData._items;*/



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
            $scope.locationData.option('items',$scope.allLoc);
            $scope.setSelectedLocation();

            /*for (var i = 0; i < $scope.allLoc.length; i++) {
                $scope.tagBoxDataLocation.store().insert($scope.allLoc[i]);
            }
            $scope.tagBoxDataLocation.load();*/
            //console.log($scope.tagBoxData._items);
            //$scope.taglist = $scope.tagBoxData._items;



        });

    }

    $scope.viewLocation();

    $scope.save_event = function() {
        console.log($scope.event);
        //return false;
        console.log($scope.typeList);
        console.log($scope.areaList);

        $scope.event.from_date = moment($scope.event.from_date).format("YYYY/MM/DD");
        $scope.event.to_date = moment($scope.event.to_date).format("YYYY/MM/DD");

        $scope.event.user_id = $scope.loggedindetails.id;
        $scope.eventdata = $scope.event;
        $scope.typedata = $scope.typeList;
        $scope.areadata = $scope.areaList;
        if ($scope.event.id) {

            $http({
                method: "PUT",
                url: $rootScope.serviceurl + "updateEvent/"+$scope.event.id,
                data: {"eventdata": $scope.eventdata, "typedata": $scope.typedata, "areadata": $scope.areadata},
                headers: {'Content-Type': 'application/json'},
            }).success(function (data) {
                console.log(data);
                if (data.type == 'success') {
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
                    $scope.getEvents();
                } else {
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

        }else{

        //return false;
        $http({
            method: "POST",
            url: $rootScope.serviceurl + "addEvent",
            data: {"eventdata": $scope.eventdata, "typedata": $scope.typedata, "areadata": $scope.areadata},
            headers: {'Content-Type': 'application/json'},
        }).success(function (data) {
            console.log(data);
            if (data.type == 'success') {
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
                $scope.getEvents();
            } else {
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

    $scope.setSelectedTypes = function(){
        $scope.selectedTypes =[];
        if($scope.allcat && $scope.event_info)
        {
            //console.log($scope.allLoc,$scope.userInfo.locations);

            angular.forEach($scope.allcat,function(all,key){
                angular.forEach($scope.event_info.categories,function(own){
                    if(all.id == own.category_id)
                    {
                        $scope.selectedTypes.push($scope.allcat[key]);
                    }
                })
            })
            $scope.typeList = $scope.selectedTypes;
            if($scope.typeData)
            {
                console.log(' types ========',$scope.selectedTypes);
                $scope.typeData.option('values',$scope.selectedTypes);
            }
            //console.log('hellooo',$scope.allLoc[0]);

        }
    }

    $scope.setSelectedLocation = function(){
        $scope.selectedLocation=[];
        if($scope.allLoc && $scope.event_info)
        {
            //console.log($scope.allLoc,$scope.userInfo.locations);

            angular.forEach($scope.allLoc,function(all,key){
                angular.forEach($scope.event_info.locations,function(own){
                    if(all.id == own.location_id)
                    {
                        $scope.selectedLocation.push($scope.allLoc[key]);
                    }
                })
            })
            $scope.areaList = $scope.selectedLocation;

        }
    }

    $scope.$watchCollection('selectedLocation',function(){
        if($scope.selectedLocation)
        //console.log('hellooo',$scope.allLoc[0]);
            $scope.locationData.option('values',$scope.selectedLocation);
    })

    //$scope.$watchCollection('selectedTypes',function(){
    //    if($scope.typeData)
    //    //console.log('hellooo',$scope.allLoc[0]);
    //        $scope.typeData.option('values',$scope.selectedTypes);
    //})


    $scope.inialLoc = function(e){
        $scope.locationData = e.component;
        //if($scope.allLoc[0])
        //$scope.locationData.option('values',$scope.allLoc[0]);
    }

    $scope.inialType = function(e){
        $scope.typeData = e.component;
        //if($scope.allLoc[0])
        //$scope.locationData.option('values',$scope.allLoc[0]);
    }
    var statuses = ["All","Open", "Completed", "Expired"];
    $scope.selectStatusOptions = {
        dataSource: statuses,
        value: statuses[0],
        onValueChanged: function(data) {
            if (data.value == "All")
                $("#gridContainer")
                    .dxDataGrid("instance")
                    .clearFilter();
            else
                $("#gridContainer")
                    .dxDataGrid("instance")
                    .filter(["status", "=", data.value]);
        }
    };



});
