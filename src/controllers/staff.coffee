@app.controller 'StaffCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'parentFactory', 'AuthenticationFactory',
  ($scope, $http, $window, $location, $timeout, parentFactory, AuthenticationFactory) ->
        angular.element(document).ready( () ->
            $scope.pageInit()
        )

        $scope.staffInfo = {}

        $scope.edit_staff_info = () ->
            console.log('start edit Staff signup..')
            console.log($scope.staffInfo)
            $http.post 'http://localhost:12008/v1/staff/info/create', {
                name: $scope.staffInfo.name,
                dob: $scope.staffInfo.dob,
                addy1: $scope.staffInfo.addy1,
                addy2: $scope.staffInfo.addy2,
                city: $scope.staffInfo.city,
                state: $scope.staffInfo.state,
                zip: $scope.staffInfo.zip,
                phone: $scope.staffInfo.phone,
                email_address: $scope.staffInfo.email_address,
                twitter: $scope.staffInfo.twitter,
                facebook: $scope.staffInfo.facebook,
                emergency_name: $scope.staffInfo.emergency_name,
                emergency_phone: $scope.staffInfo.emergency_phone,
                other_info: $scope.staffInfo.other_info
            }
            .success (data) ->
                $scope.initStaff()
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.pageInit = () ->
            $scope.initStaff()

        $scope.initStaff = () ->
            console.log("this is init staff")
            $http.post 'http://localhost:12008/v1/staff/info/init', {  }
            .success (data) ->
                $scope.staffInfo = data.data;
                console.log($scope.staffInfo)
            .error (status) ->
                console.log("page init error")
]