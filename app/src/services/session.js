import Backbone from 'backbone';
import AppConfig from 'config';
import User from 'models/user';
import Storage from 'services/storage';

const SESSION_KEY = AppConfig.sessionKey;
const STORAGE_KEY = AppConfig.storageKey;
const EMAIL_KEY = 'email';
let currentUser = null;

class Session {
  static currentUser() {
    return currentUser || (currentUser = new User(Storage.get(STORAGE_KEY)));
  }

  static create() {
    return new Promise((resolve, reject) => {
      this.currentUser().signIn().then(() => {
        this.currentUser().unsetPrivateFields();
        this.save();
        this.trigger('create');
        resolve();
      }).catch(reject);
    });
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
