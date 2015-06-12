import AppConfig from 'scripts/config';
import Session from 'scripts/facades/session';

export default class AppCollection extends Backbone.Collection {
  constructor(...args) {
    this.url = `${AppConfig.apiPath}/${_.result(this, 'url')}`;

    super(...args);
  }

  sync(method, model, options) {
    if (Session.isLoggedIn()) {
      options.data = _.extend({}, options.data, Session.token);
    }

    return super.sync(method, model, options);
  }
}
