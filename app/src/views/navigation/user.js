import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import Session from 'services/session';
import user from 'helpers/user';
import template from 'templates/navigation/user';

@mixin({
  template,
  className: 'navbar-user',
  model: Session.currentUser(),

  templateHelpers: { user }
})
export default class NavigationUserView extends Marionette.ItemView {}
