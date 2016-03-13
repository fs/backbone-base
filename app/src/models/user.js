import $ from 'jquery';
import AppModel from 'models/app';
import AppConfig from 'config';
import { props } from 'decorators';

@props({
  urlRoot: 'users',
  isSignup: false,

  validation: {
    name: {
      required() { return this.isSignup; }
    },
    password: {
      required: true
    },
    password_confirmation: {
      equalTo: 'password',
      required() { return this.isSignup; }
    },
    email: {
      pattern: 'email',
      required: true
    }
  }
})
export default class User extends AppModel {
  signIn() {
    this.isSignup = false;
    return this.send(`${this.url()}/sign_in`);
  }

  signUp() {
    this.isSignup = true;
    return this.send(`${this.url()}/sign_up`);
  }

  send(url) {
    const deferred = $.Deferred();

    if (this.isValid(true)) {
      this.save(null, { url })
        .done(deferred.resolve)
        .fail(deferred.reject);
    }
    else {
      deferred.reject();
    }

    return deferred.promise();
  }

  unsetPrivateFields() {
    this.unset('password');
  }
}
