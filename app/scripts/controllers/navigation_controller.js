import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Session from 'scripts/facades/session';
import NavigationLayout from 'scripts/views/navigation/layout';

export default class NavigationController extends Marionette.Object {
  initialize() {
    App.layout.navigationRegion.show(new NavigationLayout());
  }

  signOut() {
    Session.destroy();
  }
}
