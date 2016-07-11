
@app.controller 'HomeCtrl', ['$scope','$http', '$window', '$location', 'UserAuthFactory', 'AuthenticationFactory',
    ($scope, $http, $window, $location, UserAuthFactory, AuthenticationFactory) ->
        $scope.email_address = 'a@gmail.com'
        $scope.password = 'a'

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