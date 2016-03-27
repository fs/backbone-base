import Marionette from 'backbone.marionette';
import NavigationUserView from 'views/navigation/user';
import Session from 'services/session';
import template from 'templates/navigation/logout';
import { props } from 'decorators';

@props({
  template,
  className: 'nav navbar-nav navbar-right',

  regions: {
    userRegion: '#user_logout_region'
  },

  events: {
    'click #logout_btn': 'onLogout'
  }
})
export default class NavigationLogoutView extends Marionette.LayoutView {
  onRender() {
    this.userRegion.show(new NavigationUserView());
  }

  onLogout() {
    Session.destroy();
  }
}
