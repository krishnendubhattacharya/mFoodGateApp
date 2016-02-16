app.controller("RootScopeCtrl", function($scope) {
	$scope.menuVisible=false;
   $scope.navigationItems=[
        {
            title: 'Week',
            text: 'Week',
            uri: '/week'
        },
        {
            title: 'About',
            text: 'About',
            uri: '/about'
        }
    ]

   $scope.listSettings = {
        items: [{ key: 1, title: 'Item1' }, { key: 2, title: 'Item2' }]
};
});