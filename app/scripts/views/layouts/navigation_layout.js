import NavigationNavigationView from 'scripts/views/navigation/navigation';
import NavigationLoginView from 'scripts/views/navigation/login';
import NavigationLogoutView from 'scripts/views/navigation/logout';
import Session from 'scripts/facades/session';
import Routes from 'scripts/helpers/routes';
import template from 'templates/layouts/navigation_layout';

export default class NavigationLayout extends Marionette.LayoutView {
  constructor(...args) {
    this.className = 'container-fluid';
    this.template = template;

    this.regions = {
      navigationRegion: '#navigations_region',
      formRegion: '#login_form_region'
    };

    this.templateHelpers = {
      routes: Routes
    };

    super(...args);

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
