import Session from 'scripts/facades/session';
import FormBehavior from 'scripts/views/behaviors/form';
import routes from 'scripts/helpers/routes';
import template from 'templates/navigation/login';
import { props } from 'scripts/decorators';

@props({
  className: 'nav navbar-nav navbar-right',
  template: template,
  model: Session.currentUser(),

  ui: {
    form: 'form'
  },

  events: {
    'submit @ui.form': 'onFormSubmit',
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

  templateHelpers: {
    routes: routes
  }
})
export default class NavigationLoginView extends Marionette.ItemView {
  onFormSubmit(event) {
    event.preventDefault();
    Session.create();
  }
}
