@app.controller 'SettingsCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'parentFactory', 'AuthenticationFactory',
  ($scope, $http, $window, $location, $timeout, parentFactory, AuthenticationFactory) ->
        angular.element(document).ready( () ->
            $scope.pageInit()
        )

        $scope.pageInit = () ->
            $scope.initStaff()
]