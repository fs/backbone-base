import AppConfig from 'scripts/config';
import User from 'scripts/models/user';
import Storage from 'scripts/facades/storage';

const SESSION_KEY = AppConfig.sessionKey;
const STORAGE_KEY = AppConfig.storageKey;
let currentUser = null;

class Session {
  static currentUser() {
    return currentUser || (currentUser = new User(Storage.get(STORAGE_KEY)));
  }

  static create() {
    let deferred = $.Deferred();

    if (!this.isLoggedIn()) {
      this.currentUser().save(null, {
        success: () => {
          this.save();
          this.trigger('create');
          deferred.resolve();
        },
        error() {
          deferred.reject();
        }
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
    return this.currentUser().pick(SESSION_KEY);
  }
}

_.extend(Session, Backbone.Events);

export default Session;
