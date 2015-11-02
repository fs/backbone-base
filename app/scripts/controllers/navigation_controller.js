import App from 'scripts/application';
import Session from 'scripts/facades/session';
import NavigationLayout from 'scripts/views/layouts/navigation_layout';

export default class NavigationController extends Marionette.Controller {
  initialize() {
    App.navigationRegion.show(new NavigationLayout());
  }

  signOut() {
    Session.destroy();
  }
}
