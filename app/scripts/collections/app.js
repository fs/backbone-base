import AppConfig from 'scripts/config';
import Session from 'scripts/facades/session';

export default class AppCollection extends Backbone.Collection {
  constructor(...args) {
    this.url = `${AppConfig.apiPath}/${_.result(this, 'url')}`;

    super(...args);
  }

  sync(method, model, options) {
    if (Session.isLoggedIn()) {
      options.headers = options.headers || {};
      Object.assign(options.headers, { 'X-Auth-Token': Session.token });
    }

    return super.sync(method, model, options);
  }
}
