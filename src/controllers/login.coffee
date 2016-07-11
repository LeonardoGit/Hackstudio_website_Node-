
@app.directive 'ngEnter', () ->
    (scope, element, attrs) ->
        element.bind "keydown keypress", (event) ->
            if event.which == 13
                scope.$apply () ->
                    scope.$eval(attrs.ngEnter)
                event.preventDefault

@app.controller 'LoginCtrl', ['$scope','$http', '$window', '$location', 'UserAuthFactory', 'AuthenticationFactory',
    ($scope, $http, $window, $location, UserAuthFactory, AuthenticationFactory) ->
        $scope.email_address = ''
        $scope.password = ''

        console.log("how many login called")

        $scope.success_message = null
        $scope.error_message = null

        $scope.forgot = () ->
            $scope.success_message = null
            $scope.error_message = null

            UserAuthFactory.forgot { email_address: $scope.user.email_address }
                .success (data) ->
                    $scope.success_message = 'Your password was successfully reset and emailed to you.'
                .error (status) ->
                    $scope.error_message = status.message

        $scope.login = () ->
            console.log($scope.password)
            console.log('start login..')
            UserAuthFactory.login($scope.email_address, $scope.password);
]