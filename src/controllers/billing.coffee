@app.controller 'BillingCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'parentFactory', 'AuthenticationFactory',
  ($scope, $http, $window, $location, $timeout, parentFactory, AuthenticationFactory) ->
        angular.element(document).ready( () ->
            $scope.pageInit()
        )

        $scope.pageInit = () ->

        $scope.set_discount = () ->
            console.log("this is set discount")

]