module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    sass:
      dist:
        files:
          'public_html/stylesheets/style.css': 'sass/style.scss'
      options:
        style: 'expanded'
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: 'js/'
          ext: '.js'
        ]
    concat:
      dist:
        src: [
          'bower_components/angular/angular.min.js',
          'bower_components/angular-animate/angular-animate.min.js',
          'bower_components/angular-ui-router/release/angular-ui-router.min.js',
          'bower_components/fastclick/lib/fastclick.js',
          'bower_components/foundation-apps/dist/js/foundation-apps.min.js',
          'bower_components/foundation-apps/dist/js/foundation-apps-templates.min.js',
          'bower_components/foundation-apps/js/angular/services/foundation.dynamicRouting.js',
          'bower_components/foundation-apps/js/angular/services/foundation.dynamicRouting.animations.js',
          'js/routes.js',
          'js/app.js',
          'js/controllers/home.js',
          'js/controllers/login.js',
          'js/controllers/signup.js',
          'js/controllers/calendar.js',
          'js/controllers/members.js',
          'js/controllers/classes.js',
          'js/controllers/staff.js',
          'js/controllers/billing.js',
          'js/controllers/report.js',
          'js/controllers/settings.js',
          'js/services/auth.js'
        ],
        dest: 'public_html/js/app.js'
    watch:
      css:
        files: ['**/*.scss'],
        tasks: ['sass']
      js:
        files: ['**/*.coffee'],
        tasks: ['coffee', 'concat']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.registerTask('default', ['sass', 'coffee', 'concat']);