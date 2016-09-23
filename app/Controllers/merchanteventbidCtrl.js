'use strict';
/** 
 * controllers used for the login
 */
app.controller('merchanteventbidCtrl', function ($rootScope, $scope, $http, $location, $stateParams, myAuth) {

    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    
    

    ;
    $scope.edit_mode = false;
    $scope.imageBid = [];
    $scope.changeView = function(){
        $scope.edit_mode = !$scope.edit_mode;
        //$scope.textBox.image.value = null;
        //$scope.img_uploader = ;
        $scope.img_uploader.reset();

    }
    $scope.all_restaurant = [];
    $scope.textBox = {restaurant:{
            dataSource: $scope.all_restaurant,
            displayExpr: "name",
            valueExpr: "value",
             
            onInitialized:function(e){
                $scope.res_select = e.component;
                $scope.getRestaurants();
            },
            onSelectionChanged:function(e){
                $http({
				  method: "GET",
				  url: $rootScope.serviceurl + "getMerchantOutletsByRestaurant/"+e.selectedItem.value,

			   }).success(function (data) {
				  $scope.all_outlet = [];
				  angular.forEach(data.data,function(val){
				  	 $scope.all_outlet.push({name:val.title,value:val.id});
				  })
				  $scope.res_select1.option({dataSource: $scope.all_outlet});
			   });
            }
        },template:{
            dataSource: $scope.all_template,
            displayExpr: "name",
            valueExpr: "value",
             
            onInitialized:function(e){
                $scope.res_select2 = e.component;
                $scope.getTemplates();
            },
            onSelectionChanged:function(e){
                $http({
				  method: "GET",
				  url: $rootScope.serviceurl + "getEventTemplate/"+e.selectedItem.value+"/"+$stateParams.eventId,

			   }).success(function (data) {
				  $scope.description = data.data.content;
				  $scope.res_select3.option({dataSource: $scope.description});
				  $http({
					  method: "GET",
					  url: $rootScope.serviceurl + "getImagesByEventTemplate/" + e.selectedItem.value,
				   }).success(function (data) {
					  $scope.edit_mode = false;
					  $scope.voucherInfo = data.data;
					  $scope.loadEventImages($scope.voucherInfo);
					  
					  
					  angular.forEach(data.data,function(val){
					  	 $scope.imageBid.push(val.image);
					  })
					  //$scope.$apply();
					  //$scope.datag.option('dataSource',$scope.voucherInfo);
					  console.log($scope.voucherInfo);
				   });
			   });
            }           
        },outlet:{
            dataSource: $scope.all_outlet,
            displayExpr: "name",
            valueExpr: "value",
            
            onInitialized:function(e){
                $scope.res_select1 = e.component;
                //$scope.getRestaurants();
            }
        }
        };
        
    $scope.loadEventImages = function(voucherIn) {
					   $scope.dataGridOptions = {
						  dataSource: voucherIn,

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
						  onInitialized: function (e) {
							 console.log('By Bikash  --  ', e);
							 $scope.datag = e.component;
						  },
						  columns: [{
							 caption: 'Image',
							 cellTemplate: function (container, options) {
								if (options.data.image) {
								    $('<img />')
								        .height(100)
								        .attr('src', options.data.image_url)
								        .appendTo(container);
								}
							 }
						  }/*,
							 {
								caption: 'Delete',
								width: 100,
								alignment: 'center',
								cellTemplate: function (container, options) {
								    $('<button/>').addClass('dx-button')
								        .text('Delete')
								        .on('dxclick', function () {
								            $scope.delete_event_image(options.data.id);
								        })
								        .appendTo(container);
								}
							 }*/

						  ]
					   };
				    }    
    
    $scope.textArea = {description:{
            dataSource: $scope.description,
            height: "200",               
            onInitialized:function(e){
                $scope.res_select3 = e.component;
                //$scope.getRestaurants();
            }
        }
    };    
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
    $scope.getRestaurants(); 
    
    $scope.getTemplates = function () {
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getTemplateByUser/"+$scope.loggedindetails.id,

        }).success(function (data) {
            
            $scope.all_template = [];
            angular.forEach(data.data,function(val){
				  	 $scope.all_template.push({name:val.title,value:val.id});
				  })
            $scope.res_select2.option({dataSource: $scope.all_template});
        });
    }
    $scope.getTemplates();   
        
	
    
    $scope.saveEventBid = function(params) {
        console.log($scope);
        //alert(1);
        //return false;
        
        //alert($scope.price);
        //alert($scope.points);
        //alert($stateParams.voucherId);
        //alert($scope.loggedindetails.id);
        //var result = params.validationGroup.validate();
        // if(result.isValid) {
        $http({
            method: "POST",
            url: $rootScope.serviceurl+"addEventBid",
            data: {"price":$scope.price,"resturant_id":$scope.restaurant_id,"outlet_id":$scope.outlet_id,"template_id":$scope.template_id,"contact_person":$scope.contact_person,"contact_phone":$scope.contact_phone,"event_id":$stateParams.eventId,"user_id":$scope.loggedindetails.id,"description":$scope.description,"imagebid":$scope.imageBid},
            headers: {'Content-Type': 'application/json'},
        }).success(function(data) {
            
            //return false;
            //params.validationGroup.reset();
            if(data.type == 'success'){
                //var message = data.message;
                //params.validationGroup.reset();
                $location.path('/merchantevent');

                DevExpress.ui.notify({
                    message: data.message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "success", 3000);
            }else{
                var message = "Error occured.";
                DevExpress.ui.notify({
                    message: data.message,
                    position: {
                        my: "center top",
                        at: "center top"
                    }
                }, "error", 3000);
            }

        })

        //form.submit();
        //params.validationGroup.reset();
        //}
    };
   
});

