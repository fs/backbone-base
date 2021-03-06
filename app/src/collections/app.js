import _ from 'underscore';
import Backbone from 'backbone';
import AppConfig from 'config';
import Session from 'services/session';

export default class AppCollection extends Backbone.Collection {
  initialize() {
    this.url = `${AppConfig.apiPath}/${_.result(this, 'url')}`;
  }

  sync(method, model, options) {
    if (Session.isLoggedIn()) {
      options.headers = options.headers || {};
      Object.assign(options.headers, {
        'X-User-Token': Session.token,
        'X-User-Email': Session.email
      });
    }

    return super.sync(method, model, options);
  }
}
