import Session from 'scripts/facades/session';
import FormBehavior from 'scripts/views/behaviors/form';
import template from 'templates/navigation/login';

export default class NavigationLoginView extends Marionette.ItemView {
  constructor(...args) {
    this.className = 'nav navbar-nav navbar-right';
    this.template = template;
    this.model = Session.currentUser();

    this.ui = {
      form: 'form',
      register: '.register'
    };

    this.events = {
      'submit @ui.form': 'onFormSubmit',
      'click @ui.register': 'onShowRegisterForm'
    };

    this.bindings = {
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
    };

    this.behaviors = {
      form: {
        behaviorClass: FormBehavior,
        tooltip: {
          placement: 'bottom',
          trigger: 'focus'
        }
      }
    };

    super(...args);
  }

  onFormSubmit(event) {
    event.preventDefault();

    if (this.model.isValid(true)) {
      Session.create();
    }
  }

  onShowRegisterForm() {
    // App.vent.trigger('show', router.navigation);
  }
}
