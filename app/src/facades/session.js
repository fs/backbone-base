import 'babel-polyfill';
import $ from 'jquery';
import Backbone from 'backbone';
import AppConfig from 'config';
import User from 'models/user';
import Storage from 'facades/storage';

const SESSION_KEY = AppConfig.sessionKey;
const STORAGE_KEY = AppConfig.storageKey;
const EMAIL_KEY = 'email';
const currentUser = new User(Storage.get(STORAGE_KEY));

class Session {
  static currentUser() {
    return currentUser;
  }

  static create() {
    const deferred = $.Deferred();

    if (!this.isLoggedIn()) {
      this.currentUser().signIn().done(() => {
        this.currentUser().unsetPrivateFields();
        this.save();
        this.trigger('create');
        deferred.resolve();
      }).fail(deferred.reject);
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
