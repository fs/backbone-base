describe('Landing page', function() {
  before(function() {
    this.userCredentials = {
      email: 'test@example.com',
      password: '123456'
    };

    casper
      .start('http://localhost:8000')
      .thenOpen('/', function() {
        this.evaluate(window.localStorage.clear);
      });
  });

  it('has title', function() {
    casper.then(function() {
      expect('Backbone base').to.matchTitle;
    });
  });

  it('logs user in', function() {
    var userCredentials = this.userCredentials;

    casper.then(function() {
      this.waitForSelector('form.login-form', function() {
        this.fill('form.login-form', userCredentials, true);
      });

      this.waitForUrl(/dashboard/, function() {
        expect('h2').to.contain.text('Greeting M@rik');
      });
    });
  });
});
