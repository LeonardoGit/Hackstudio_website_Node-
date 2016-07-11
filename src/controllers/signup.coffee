@app.controller 'SignupCtrl', ['$scope', '$window', '$location', 'UserAuthFactory', 'AuthenticationFactory',
    ($scope, $window, $location, UserAuthFactory, AuthenticationFactory) ->

        $scope.fullname = ''
        $scope.email_address = ''
        $scope.password = ''

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

        $scope.signup = () ->
            console.log('start signup..')
            UserAuthFactory.signup($scope.fullname, $scope.email_address, $scope.password);
]