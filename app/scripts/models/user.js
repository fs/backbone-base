import AppModel from 'scripts/models/app';
import AppConfig from 'scripts/config';

export default class User extends AppModel {
  constructor(...args) {
    this.urlRoot = 'users';

    this.validation = {
      name: {
        required: () => { return this.isSignup; }
      },
      password: {
        required: true
      },
      password_confirmation: {
        equalTo: 'password',
        required: () => { return this.isSignup; }
      },
      email: {
        pattern: 'email',
        required: true
      }
    };

    super(...args);
  }

  signIn() {
    this.isSignup = false;
    return this.send(`${this.url()}/sign_in`);
  }

  signUp() {
    this.isSignup = true;
    return this.send(`${this.url()}/sign_up`);
  }

  send(url) {
    let deferred = $.Deferred();

    if (this.isValid(true)) {
      this.save(null, {
        url,
        success(data) {
          deferred.resolve(data);
        },
        error(data) {
          deferred.reject(data);
        }
      });
    }
    else {
      deferred.reject();
    }

    return deferred.promise();
  }
}
