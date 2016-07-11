@app.factory 'AuthenticationFactory', ($window) ->
  auth =
    isLogged: false
    email_address: null
    userId: null
    tags: null
    check: () ->
      if $window.sessionStorage.token && $window.sessionStorage.email_address
        this.isLogged = true
        this.email_address = $window.sessionStorage.email_address
        this.userId = $window.sessionStorage.userId
        this.tags = JSON.parse $window.sessionStorage.tags
      else
        this.isLogged = false
        delete this.email_address
        delete this.userId

@app.factory 'UserAuthFactory', ($window, $location, $http, AuthenticationFactory) ->
  {
    login: (email_address, password) ->
      $http.post 'http://localhost:12008/v1/auth/signin', {
        email_address: email_address
        password: password
      }
      .success (data) ->
        console.log(data)
        window.location = '/#!/admin/members'
      .error (status) ->
        console.log('failed!')

    signup: (fullname, email_address, password) ->
      $http.post 'http://localhost:12008/v1/auth/signup', {
        fullname: fullname
        email_address: email_address
        password: password
      }
      .success (data) ->
        console.log('signup successfully!')
        window.location = '/#!/admin/members'
      .error (status) ->
        console.log(status);
        console.log('failed!')

    forgot: (data) ->
      $http.post '/forgot', data

    logout: () ->

      if AuthenticationFactory.isLogged
        AuthenticationFactory.isLogged = false
        delete AuthenticationFactory.email_address
        delete AuthenticationFactory.userId
        delete AuthenticationFactory.tags
        
        delete $window.sessionStorage.token
        delete $window.sessionStorage.email_address
        delete $window.sessionStorage.userId
        delete $window.sessionStorage.tags

        $window.location.href = '/#/login'
  }

@app.factory 'TokenInterceptor', ($q, $window) ->
  {
      request: (config) ->
        config.headers = config.headers || {}
        if $window.sessionStorage.token
          config.headers['X-Access-Token'] = $window.sessionStorage.token
          config.headers['X-Key'] = $window.sessionStorage.email_address
          config.headers['Content-Type'] = "application/json"
        return config || $q.when config
      
      response: (response) ->
        return response || $q.when response
  }
