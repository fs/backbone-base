import AppConfig from 'scripts/config';
import Session from 'scripts/facades/session';

export default class AppModel extends Backbone.Model {
  constructor(...args) {
    this.urlRoot = `${AppConfig.apiPath}/${_.result(this, 'urlRoot')}`;

    super(...args);

    this.listenTo(this, 'error', this.handleErrors);
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

  handleErrors(model, error) {
    let { validations, error } = error.responseJSON;

    if (validations) {
      return this.trigger('validation:invalid', validations);
    }

    if (error) {
      App.vent.trigger('notification:show', {
        type: 'danger',
        message: error
      });
    }
  }
}
