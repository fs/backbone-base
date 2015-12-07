var Setup = require('../features/helpers/setup');

describe('Landing page', function() {
  before(function() {
    this.userCredentials = {
      email: 'test@example.com',
      password: '123456'
    };

    Setup();
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
        expect('h2').to.contain.text('Greeting Gavin Jayson, you have next articles');
      });
    });
  });
});
