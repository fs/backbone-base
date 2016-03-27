import Marionette from 'backbone.marionette';
import Session from 'services/session';
import user from 'helpers/user';
import template from 'templates/navigation/user';
import { props } from 'decorators';

@props({
  template,
  className: 'navbar-user',
  model: Session.currentUser(),

  templateHelpers: { user }
})
export default class NavigationUserView extends Marionette.ItemView {}
