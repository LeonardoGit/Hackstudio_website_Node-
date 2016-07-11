@app.controller 'ReportCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'UserAuthFactory', 'AuthenticationFactory',
    ($scope, $http, $window, $location, $timeout, UserAuthFactory, AuthenticationFactory) ->
        angular.element(document).ready( () ->
            $scope.initPage()
        )


        $scope.initPage = () ->

]