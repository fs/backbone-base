function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _featuresHelpersSetup = require('../features/helpers/setup');

var _featuresHelpersSetup2 = _interopRequireDefault(_featuresHelpersSetup);

describe('Landing page', function () {
  before(function () {
    this.userCredentials = {
      email: 'test@example.com',
      password: '123456'
    };

    (0, _featuresHelpersSetup2['default'])();
  });

  it('has title', function () {
    casper.then(function () {
      expect('Backbone base').to.matchTitle;
    });
  });

  it('logs user in', function () {
    var userCredentials = this.userCredentials;

    casper.then(function () {
      this.waitForSelector('form.login-form', function () {
        this.fill('form.login-form', userCredentials, true);
      });

      this.waitForUrl(/dashboard/, function () {
        expect('h2').to.contain.text('Greeting M@rik');
      });
    });
  });
});