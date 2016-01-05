import _ from 'underscore';
import Backbone from 'backbone';
import App from 'scripts/application';
import AppConfig from 'scripts/config';

export default class AppModel extends Backbone.Model {
  initialize() {
    this.urlRoot = `${AppConfig.apiPath}/${_.result(this, 'urlRoot')}`;
    this.listenTo(this, 'error', this.handleErrors);
  }

  handleErrors(model, response) {
    let message = 'Server error has occured';

    if (response.responseJSON) {
      let { validations, error } = response.responseJSON;

      if (validations) {
        return this.trigger('validation:invalid', validations);
      }

      if (error) message = error;
    }

    App.vent.trigger('notification:show', {
      message,
      type: 'danger'
    });
  }
}
