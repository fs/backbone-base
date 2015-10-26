import AppConfig from 'scripts/config';
import User from 'scripts/models/user';
import Storage from 'scripts/facades/storage';

const SESSION_KEY = AppConfig.sessionKey;
const STORAGE_KEY = AppConfig.storageKey;
const EMAIL_KEY = 'email';
let currentUser = null;

class Session {
  static currentUser() {
    return currentUser || (currentUser = new User(Storage.get(STORAGE_KEY)));
  }

  static create() {
    let deferred = $.Deferred();

    if (!this.isLoggedIn()) {
      this.currentUser().signIn().done(() => {
        this.save();
        this.trigger('create');
        deferred.resolve();
      }).fail(() => {
        deferred.reject();
      });
    }

    return deferred.promise();
  }

  static destroy() {
    Storage.remove(STORAGE_KEY);
    this.currentUser().clear();
    this.trigger('destroy');
  }

  static save() {
    Storage.set(STORAGE_KEY, this.currentUser().toJSON());
  }

  static isLoggedIn() {
    return !this.currentUser().isNew();
  }

  static get token() {
    return this.currentUser().get(SESSION_KEY);
  }

  static get email() {
    return this.currentUser().get(EMAIL_KEY);
  }
}

Object.assign(Session, Backbone.Events);

export default Session;
