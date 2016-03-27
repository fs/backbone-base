import Marionette from 'backbone.marionette';
import App from 'application';
import User from 'models/user';
import Session from 'services/session';
import FormBehavior from 'behaviors/form';
import template from 'templates/sign_up/sign_up';
import { props } from 'decorators';

@props({
  template,
  model: new User(),

  ui: {
    form: 'form'
  },

  events: {
    'submit @ui.form': 'signUpNewUser'
  },

  bindings: {
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
    }
  },

  behaviors: {
    form: {
      behaviorClass: FormBehavior,
      tooltip: {
        placement: 'bottom'
      }
    }
  }
})
export default class SignUpView extends Marionette.ItemView {
  signUpNewUser(event) {
    event.preventDefault();
    this.model.signUp().then(this.signInNewUser.bind(this));
  }

  signInNewUser() {
    Session.currentUser().set({
      email: this.model.get('email'),
      password: this.model.get('password')
    });
    Session.create().then(() => {
      App.vent.trigger('notification:show', {
        type: 'success',
        message: 'Your account successfully created!'
      });
    });
  }
}
