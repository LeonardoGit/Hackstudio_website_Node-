@app.service 'parentFactory', ($window, $location, $http) ->
    pInfo = {}

    initParent : () ->
        console.log("this is init parent")
        $http.post 'http://localhost:12008/v1/member/parent/init', {  }
        .success (data) ->
            console.log("parent factory calling")
            pInfo = data.data;
            console.log(pInfo)
        .error (status) ->
            console.log("page init error")
    getData: ->
        pInfo
    setData: (val) ->
        pInfo = val
    data: pInfo

@app.controller 'MembersCtrl', ['$scope','$http', '$window', '$location', '$timeout', 'parentFactory', 'AuthenticationFactory',
    ($scope, $http, $window, $location, $timeout, parentFactory, AuthenticationFactory) ->

        angular.element(document).ready( () ->
            $scope.pageInit()
        )

        $scope.pInfo = {}
        $scope.studentInfo = {}
        $scope.scholarshipInfo = {}
        $scope.errpInfo = {}
        $scope.errpInfo.hasError = false;

        $scope.edit_parent_info = () ->
            $http.post 'http://localhost:12008/v1/member/parent/create', {
                first_name: $scope.pInfo.first_name,
                last_name: $scope.pInfo.last_name,
                addy1: $scope.pInfo.addy1,
                addy2: $scope.pInfo.addy2,
                city: $scope.pInfo.city,
                state: $scope.pInfo.state,
                zip: $scope.pInfo.zip,
                phone_number1: $scope.pInfo.phone_number1,
                phone_number2: $scope.pInfo.phone_number2,
                email_address: $scope.pInfo.email_address,
                twitter: $scope.pInfo.twitter,
                facebook: $scope.pInfo.facebook,
                referal_type: $scope.pInfo.referal_type,
                physician_name: $scope.pInfo.physician_name,
                physician_phone: $scope.pInfo.physician_phone,
                emergency_contact1: $scope.pInfo.emergency_contact1,
                emergency_contact2: $scope.pInfo.emergeycy_contact2,
                emergency_phone1: $scope.pInfo.emergency_phone1,
                emergency_phone2: $scope.pInfo.emergency_phone2,
                other_info: $scope.pInfo.other_info
            }
            .success (data) ->
                $scope.initParent()
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.edit_student_info = ()->
            $http.post 'http://localhost:12008/v1/member/student/create', {
                first_name: $scope.studentInfo.first_name,
                last_name: $scope.studentInfo.last_name,
                dom: $scope.studentInfo.dom,
                age: $scope.studentInfo.age,
                gender: $scope.studentInfo.gender,
                grade: $scope.studentInfo.grade,
                school: $scope.studentInfo.school,
                hack_universary: $scope.studentInfo.hack_universary,
                addy1: $scope.studentInfo.addy1,
                addy2: $scope.studentInfo.addy2,
                city: $scope.studentInfo.city,
                state: $scope.studentInfo.state,
                zip: $scope.studentInfo.zip,
                phone1: $scope.studentInfo.phone1,
                phone2: $scope.studentInfo.phone2,
                email_address: $scope.studentInfo.email_address,
                allergies: $scope.studentInfo.allergies,
                medication: $scope.studentInfo.medication,
                reason_medication: $scope.studentInfo.reason_medication,
                other_info: $scope.studentInfo.other_info
            }
            .success (data) ->
                console.log("test if pageInit is called by")
                $scope.initStudent()
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.add_scholarship = () ->
            $http.post 'http://localhost:12008/v1/member/scholarship/create', {
                name: $scope.scholarshipInfo.name,
                contact_info: $scope.scholarshipInfo.contact_info,
                addy1: $scope.scholarshipInfo.addy1,
                addy2: $scope.scholarshipInfo.addy2,
                city: $scope.scholarshipInfo.city,
                state: $scope.scholarshipInfo.state,
                zip: $scope.scholarshipInfo.zip,
                phone1: $scope.scholarshipInfo.phone1,
                phone2: $scope.scholarshipInfo.phone2,
                email_address: $scope.scholarshipInfo.email_address,
                twitter: $scope.scholarshipInfo.twitter,
                facebook: $scope.scholarshipInfo.facebook,
                notes: $scope.scholarshipInfo.notes
            }
            .success (data) ->
                $scope.initScholarship()
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Saved Successfully!"
                $scope.errpInfo.type = "success"
            .error (status) ->
                console.log(status);
                $scope.errpInfo.hasError = true
                $scope.errpInfo.message = "Failed!"
                $scope.errpInfo.type = "warning"

        $scope.pageInit = () ->
            $scope.initParent()
            $scope.initScholarship()
            $scope.initStudent()

        $scope.initParent = () ->
            console.log("this is init parent")
            $http.post 'http://localhost:12008/v1/member/parent/init', {  }
            .success (data) ->
                $scope.pInfo = data.data;
                console.log($scope.pInfo)
            .error (status) ->
                console.log("page init error")

        $scope.initScholarship = () ->
            console.log("this is init scholarship")
            $http.post 'http://localhost:12008/v1/member/scholarship/init', {  }
            .success (data) ->
                console.log("scholarship data")
                $scope.scholarshipInfo = data.data;
                console.log($scope.scholarshipInfo)
                $timeout(() ->
                    $scope.$apply();
                );
            .error (status) ->
                console.log("page init error")

        $scope.initStudent = () ->
            console.log("this is init student")
            $http.post 'http://localhost:12008/v1/member/student/init', {  }
            .success (data) ->
                $scope.studentInfo = data.data;
                console.log("student info")
                console.log($scope.studentInfo)
                $timeout(() ->
                    $scope.$apply();
                );
            .error (status) ->
                console.log("page init error")



]
