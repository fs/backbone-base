import App from 'scripts/application';
import AppConfig from 'scripts/config';
import Session from 'scripts/facades/session';

export default class AppModel extends Backbone.Model {
  constructor(...args) {
    this.urlRoot = `${AppConfig.apiPath}/${_.result(this, 'urlRoot')}`;

    super(...args);

    this.listenTo(this, 'error', this.handleErrors);
  }

  handleErrors(model, error) {
    let { validations, error } = error.responseJSON;

    if (validations) {
      return this.trigger('validation:invalid', validations);
    }

    let message = (error) ? error : 'Server error has occured';

    App.vent.trigger('notification:show', {
      message,
      type: 'danger'
    });
  }
}
