import Marionette from 'backbone.marionette';
import App from 'scripts/application';

describe('Application', () => {
  it('starts successfully', () => {
    expect(App).to.be.instanceof(Marionette.Application);
  });
});
