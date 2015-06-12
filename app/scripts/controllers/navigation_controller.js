import App from 'scripts/application';
import NavigationLayout from 'scripts/views/layouts/navigation_layout';

export default class NavigationController extends Marionette.Controller {
  constructor(...args) {
    App.navigationRegion.show(new NavigationLayout());

    super(...args);
  }
}
