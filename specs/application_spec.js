var Marionette = require('marionette');
var App = require('scripts/application');

describe('Application', function() {
  it('should start successfully', function() {
    expect(App).to.be.instanceof(Marionette.Application);
  });
});
