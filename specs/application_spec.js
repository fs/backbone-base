import Marionette from 'marionette';
import App from 'scripts/application';

describe('Application', function() {
  it('should start successfully', function() {
    expect(App).to.be.instanceof(Marionette.Application);
  });
});
