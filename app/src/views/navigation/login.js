import Marionette from 'backbone.marionette';
import Session from 'services/session';
import FormBehavior from 'behaviors/form';
import routes from 'helpers/routes';
import template from 'templates/navigation/login';
import { props } from 'decorators';

@props({
  template,
  className: 'nav navbar-nav navbar-right',
  model: Session.currentUser(),

  ui: {
    form: 'form'
  },

  events: {
    'submit @ui.form': 'onFormSubmit'
  },

  bindings: {
    '[name="email"]': {
      observe: 'email',
      updateView: false,
      setOptions: {
        validate: true
      }
    },
    '[name="password"]': {
      observe: 'password',
      updateView: false,
      setOptions: {
        validate: true
      }
    }
  },

  behaviors: {
    form: {
      behaviorClass: FormBehavior
    }
  },

  templateHelpers: { routes }
})
export default class NavigationLoginView extends Marionette.ItemView {
  onFormSubmit(event) {
    event.preventDefault();
    Session.create();
  }
}
