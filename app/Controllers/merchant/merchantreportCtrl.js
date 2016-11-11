app.controller('merchantreportCtrl', function ($rootScope, $scope, $http, $location, mFoodCart, $stateParams, myAuth) {
    myAuth.updateUserinfo(myAuth.getUserAuthorisation());
    $scope.loggedindetails = myAuth.getUserNavlinks();
    $scope.voucherInfo;
    $scope.first_show = 1;
    $scope.second_show = 1;
    $scope.third_show = 1;
    $scope.firstShowHide = function () {
        if($scope.first_show == 1){
            $scope.first_show = 0;
        }else{
            $scope.first_show = 1;
        }
    }
    $scope.secondShowHide = function () {
        if($scope.second_show == 1){
            $scope.second_show = 0;
        }else{
            $scope.second_show = 1;
        }

    }
    $scope.thirdShowHide = function () {
        if($scope.third_show == 1){
            $scope.third_show = 0;
        }else{
            $scope.third_show = 1;
        }

    }
    $scope.resname = [];
    if(!$scope.loggedindetails){

        $location.path("/login");
    }
    
    $scope.dateBox = {
            customFormat: {
				  displayFormat: "EEEE, MMM dd"
				            
			   }
         }
         $scope.from_date = '';
     $scope.validateAndSubmit = function(params) {

        console.log($scope.from_date);
        
        if ($scope.from_date == "" || $scope.from_date == null)
                {
                 console.log('Blank');
                     $("#gridContainer")
                        .dxDataGrid("instance")
                        .clearFilter();
                }
                else
                {$scope.from_date = moment($scope.from_date).format("MM-DD-YYYY");
                console.log($scope.from_date);
                    $("#gridContainer")
                        .dxDataGrid("instance")
                        .filter(["RedeemDate", "=", $scope.from_date]);
                }        

    }; 
    
    $scope.validateAndSubmitmob = function(params) {

        console.log($scope.from_date);
        if ($scope.from_date == "" || $scope.from_date == null)
        {
                    $scope.resnamemob = '';
        }        else
        {
                    $scope.from_date = moment($scope.from_date).format("MM-DD-YYYY");
                    $scope.resnamemob = $scope.from_date;
        }            
    };   

    $scope.voucherInfo = null;
        $http({
            method: "GET",
            url: $rootScope.serviceurl + "getRedeemVoucher/"+$scope.loggedindetails.id,
        }).success(function (data) {
            $scope.voucherInfo =data.data;
            $scope.resname.push('All');
            angular.forEach($scope.voucherInfo, function (v) {
                if($scope.resname.indexOf(v.restaurant_title) == -1){
                    $scope.resname.push(v.restaurant_title);
                }
                /*angular.forEach($scope.resname, function (r) {
                    if(r == v.restaurant_title){
                        $scope.resname.push(v.restaurant_title);
                    }else{
                        $scope.resname.push(v.restaurant_title);
                    }
                })*/
                                
            })
            //console.log($scope.voucherInfo);

            $scope.dataGridOptions = {
                dataSource: $scope.voucherInfo,
                wordWrapEnabled: true,
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

                columns: [{caption:'Restaurant',dataField:"restaurant_title"},
			{caption:'Outlet Redeem',dataField:"title"},
			{caption:'Redeem Date',dataField:"RedeemDate"},
                    {caption:'Voucher Name',dataField:"offer_title"},
                    {caption:'Voucher Number',dataField:"voucher_number"},
                    {caption:'Voucher Value',dataField:"price"},
                    
			{caption:'Status Redeem',dataField:"Status"}
                    //{caption:'Voucher Price',dataField:"offer_price"},
                   // {caption:'Voucher Expired Date',dataField:"to_date"},
                    
                    //{caption:'Higest Bid Price',dataField:"price"},
                    
                  //  {caption:'Status',dataField:"Status"}




                ]
            };


        });
        
         
        $scope.selectStatusOptions = {
            displayFormat: "mm-dd-yyyy",
            dataSource: $scope.resname,
            value: $scope.resname[0],
            onValueChanged: function(data) {
                if (data.value == "")
                    $("#gridContainer")
                        .dxDataGrid("instance")
                        .clearFilter();
                else
                    $("#gridContainer")
                        .dxDataGrid("instance")
                        .filter(["RedeemDate", "=", data.value]);
            }
        };
        $scope.resnamemob = '';
        $scope.selectStatusOptionsmob = {
            dataSource: $scope.resname,
            value: $scope.resname[0],
            onValueChanged: function(data) {
                if (data.value == "All")
                    $scope.resnamemob = '';
                else
                    $scope.resnamemob = data.value;
                
                console.log($scope.resnamemob);
            }
        };

});
