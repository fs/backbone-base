import Marionette from 'backbone.marionette';
import App from 'application';
import Session from 'services/session';
import NavigationLayout from 'views/navigation/layout';

export default class NavigationController extends Marionette.Object {
  initialize() {
    App.layout.navigationRegion.show(new NavigationLayout());
  }

  signOut() {
    Session.destroy();
  }
}
