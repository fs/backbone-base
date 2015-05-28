describe 'Landing page', ->
  before ->
    @userCredentials =
      email: 'test@example.com'
      password: '123456'

    casper
      .start('http://localhost:8000')
      .thenOpen '/', -> @evaluate(window.localStorage.clear)

  it 'has title', ->
    casper.then -> expect('Backbone base').to.matchTitle

  it 'logs user in', ->
    userCredentials = @userCredentials

    casper.then ->
      @waitForSelector 'form.login-form', ->
        @fill 'form.login-form', userCredentials, true

      @waitForUrl /dashboard/, ->
        expect('h2').to.contain.text('Greeting M@rik')
