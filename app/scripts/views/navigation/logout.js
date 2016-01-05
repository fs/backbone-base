import Marionette from 'backbone.marionette';
import Session from 'scripts/facades/session';
import user from 'scripts/helpers/user';
import template from 'templates/navigation/logout';
import { props } from 'scripts/decorators';

@props({
  className: 'nav navbar-nav navbar-right',
  template: template,
  model: Session.currentUser(),

  events: {
    'click #logout_btn': 'onLogout'
  },

  templateHelpers: {
    user: user
  }
})
export default class NavigationLogoutView extends Marionette.ItemView {
  onLogout() {
    Session.destroy();
  }
}
