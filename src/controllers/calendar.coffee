@app.controller 'CalendarCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'UserAuthFactory', 'AuthenticationFactory',
    ($scope, $http, $window, $location, $timeout, UserAuthFactory, AuthenticationFactory) ->
        angular.element(document).ready( () ->
            $scope.initPage()
        )

        $scope.errpInfo = {}
        $scope.errpInfo.hasError = false;

        $scope.yearFee = {}
        $scope.term = {}
        $scope.termDatas = {}
        $scope.holiday = {}
        $scope.session = {}

        $scope.yearFee.start_date = "4/5/2015"
        $scope.yearFee.end_date = "4/5/2015"
        $scope.yearFee.annual_fee = "1000$"

        $scope.term.name = "FAll 2015"
        $scope.term.start_date = "4/5/2015"
        $scope.term.end_date = "4/5/2015"
        $scope.holiday.holiday = "5/5/2015"

        $scope.set_year_fee = () ->
            $scope.errpInfo.hasError = false
            console.log('start Calender set fee..')
            $http.post 'http://localhost:12008/v1/calendar/yearfee/create', {
                start_date: $scope.yearFee.start_date,
                end_date: $scope.yearFee.end_date,
                annual_fee: $scope.yearFee.annual_fee
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.create_term = () ->
            $scope.errpInfo.hasError = false
            console.log('start Calender create term...')
            $http.post 'http://localhost:12008/v1/calendar/term/create', {
                name: $scope.term.name,
                start_date: $scope.term.start_date,
                end_date: $scope.term.end_date
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
                $scope.initTerm()
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.add_holiday = () ->
            $scope.errpInfo.hasError = false
            console.log($scope.holiday)
            console.log('start Calender set holiday...')
            $http.post 'http://localhost:12008/v1/calendar/holiday/create', {
                holiday: $scope.holiday.holiday
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.add_session = () ->
            console.log('start Calender create session...')
            $http.post 'http://localhost:12008/v1/calendar/session/create', {
                id_term: $scope.session.id_term,
                name: $scope.session.name,
                start_date: $scope.session.start_date,
                end_date: $scope.session.end_date,
                id_program: $scope.session.id_program,
                start_time: $scope.session.start_time,
                end_time: $scope.session.end_time,
                slots: $scope.session.slots,
                hourly_rate: $scope.session.hourly_rate
            }
            .success (data) ->
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.initTerm = () ->
            $http.post 'http://localhost:12008/v1/calendar/term/init', { }
            .success (data) ->
                $scope.termDatas = data.data
                console.log("init term data",$scope.termDatas)
            .error (status) ->

        $scope.initPage = () ->
            $scope.initTerm()

]