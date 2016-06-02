import 'backbone-nested';
import _ from 'underscore';
import Backbone from 'backbone';
import App from 'application';
import AppConfig from 'config';

export default class AppModel extends Backbone.NestedModel {
  initialize() {
    this.urlRoot = `${AppConfig.apiPath}/${_.result(this, 'urlRoot')}`;
    this.listenTo(this, 'error', this.handleErrors);
  }

  handleErrors(model, response) {
    let message = 'Server error has occured';

    if (response.responseJSON) {
      const { validations, error } = response.responseJSON;

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
