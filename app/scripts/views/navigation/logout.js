import Session from 'scripts/facades/session';
import template from 'templates/navigation/logout';

export default class NavigationLogoutView extends Marionette.ItemView {
  constructor(...args) {
    this.className = 'nav navbar-nav navbar-right';
    this.template = template;
    this.model = Session.currentUser();

    this.events = {
      'click #logout_btn': 'onLogout'
    };

    super(...args);
  }

  onLogout() {
    Session.destroy();
  }
}
