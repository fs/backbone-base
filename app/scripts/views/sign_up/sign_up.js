import App from 'scripts/application';
import User from 'scripts/models/user';
import Routes from 'scripts/helpers/routes';
import FormBehavior from 'scripts/views/behaviors/form';
import template from 'templates/sign_up/sign_up';

export default class SignUpView extends Marionette.ItemView {
  constructor(...args) {
    this.template = template;
    this.model = new User();

    this.ui = {
      form: 'form'
    };

    this.events = {
      'submit @ui.form': 'onFormSubmit',
    };

    this.bindings = {
      '[name="name"]': {
        observe: 'name',
        updateView: false,
        setOptions: {
          validate: true
        }
      },
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
      },
      '[name="password_confirmation"]': {
        observe: 'password_confirmation',
        updateView: false,
        setOptions: {
          validate: true
        }
      },
      '[name="avatar"]': {
        observe: 'avatar',
        updateView: false
      },
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

    this.model.signUp().done(() => {
      App.vent.trigger('navigation:root');
      alert('Your account successfully created. Now you can login with your credentials.');
    });
  }
}
