@app = angular.module 'application', [
	# Angular libraries
	'ui.router',
	'ngAnimate',
	# Foundation UI components
	'foundation',
	# Routing with front matter
	# 'foundation.dynamicRouting'
	# Transitioning between views
	# 'foundation.dynamicRouting.animations'
	]

@app.config ['$stateProvider', '$urlRouterProvider', '$locationProvider', ($stateProvider, $urlProvider, $locationProvider) ->
	$stateProvider
	.state '/home', {
		url: '/home'
		templateUrl: '/templates/home.html'
		controller: 'HomeCtrl'
	}
	.state '/login', {
        url: '/login'
        templateUrl: '/templates/login.html'
        controller: 'LoginCtrl'
    }
	.state '/signup', {
		url: '/signup'
		templateUrl: '/templates/signup.html'
		controller: 'SignupCtrl'
	}
	.state '/admin/billing', {
		url: '/admin/billing'
		templateUrl: '/templates/billing.html'
		controller: 'BillingCtrl'
	}
	.state '/admin/report', {
		url: '/admin/report'
		templateUrl: '/templates/report.html'
		controller: 'ReportCtrl'
	}
	.state '/admin/settings', {
		url: '/admin/settings'
		templateUrl: '/templates/settings.html'
		controller: 'SettingsCtrl'
	}
	.state '/admin/enrollment', {
		url: '/admin/enrollment'
		templateUrl: '/templates/enrollment.html'
		controller: 'EnrollmentCtrl'
	}
	.state '/admin/calendar', {
		url: '/admin/calendar'
		templateUrl: '/templates/calendar.html'
		controller: 'CalendarCtrl'
	}
	.state '/admin/classes', {
		url: '/admin/classes'
		templateUrl: '/templates/classes.html'
		controller: 'ClassesCtrl'
	}
	.state '/admin/staff', {
		url: '/admin/staff'
		templateUrl: '/templates/staff.html'
		controller: 'StaffCtrl'
	}
	.state '/admin/members/', {
		url: '/admin/members'
		templateUrl: '/templates/families.html'
		controller: 'MembersCtrl'
	}
	# Default to the index view if the URL loaded is not found
	$urlProvider.otherwise('home');
	# Use this to enable HTML5 mode
	$locationProvider.html5Mode {
		enabled: false,
		requireBase: false
	}
	# Use this to set the prefix for hash-bangs
	# Example: example.com/#!/page
	$locationProvider.hashPrefix '!'
]
# run () ->
# 	# Enable FastClick to remove the 300ms click delay on touch devices
# 	FastClick.attach document.body
