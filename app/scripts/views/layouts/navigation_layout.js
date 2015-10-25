import NavigationNavigationView from 'scripts/views/navigation/navigation';
import NavigationLoginView from 'scripts/views/navigation/login';
import NavigationLogoutView from 'scripts/views/navigation/logout';
import Session from 'scripts/facades/session';
import Routes from 'scripts/helpers/routes';
import template from 'templates/layouts/navigation_layout';
import { props } from 'scripts/decorators';

@props({
  className: 'container-fluid',
  template: template,

  regions: {
    navigationRegion: '#navigations_region',
    formRegion: '#login_form_region'
  },

  templateHelpers: {
    routes: Routes
  }
})
export default class NavigationLayout extends Marionette.LayoutView {
  initialize() {
    this.listenTo(Session, 'create destroy', this.render);
  }

  onRender() {
    if (Session.isLoggedIn()) {
      this.navigationRegion.show(new NavigationNavigationView());
      this.formRegion.show(new NavigationLogoutView());
    }
    else {
      this.navigationRegion.empty();
      this.formRegion.show(new NavigationLoginView());
    }
  }
}
