import Marionette from 'backbone.marionette';
import Session from 'facades/session';
import user from 'helpers/user';
import template from 'templates/navigation/logout';
import { props } from 'decorators';

@props({
  template,
  className: 'nav navbar-nav navbar-right',
  model: Session.currentUser(),

  events: {
    'click #logout_btn': 'onLogout'
  },

  templateHelpers: { user }
})
export default class NavigationLogoutView extends Marionette.ItemView {
  onLogout() {
    Session.destroy();
  }
}
