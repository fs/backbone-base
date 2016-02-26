import Marionette from 'backbone.marionette';
import App from 'application';

describe('Application', () => {
  it('starts successfully', () => {
    expect(App).to.be.instanceof(Marionette.Application);
  });
});
