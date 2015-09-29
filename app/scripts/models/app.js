import AppConfig from 'scripts/config';
import Session from 'scripts/facades/session';

export default class AppModel extends Backbone.Model {
  constructor(...args) {
    this.urlRoot = `${AppConfig.apiPath}/${_.result(this, 'urlRoot')}`;

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
