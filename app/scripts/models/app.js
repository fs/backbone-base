import AppConfig from 'scripts/config';
import Session from 'scripts/facades/session';

export default class AppModel extends Backbone.Model {
  constructor(...args) {
    this.urlRoot = `${AppConfig.apiPath}/${_.result(this, 'urlRoot')}`;

    super(...args);
  }

  sync(method, model, options) {
    if (Session.isLoggedIn()) {
      if (method === 'create' || method === 'update' || method === 'patch') {
        let data = _.extend(model.toJSON(), Session.token);
        options.data = JSON.stringify(data);
        options.contentType = 'application/json';
      }
      else {
        options.data = _.extend({}, options.data, Session.token);
      }
    }

    return super.sync(method, model, options);
  }
}
