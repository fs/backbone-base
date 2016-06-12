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
      const { error, validations } = response.responseJSON;

      if (error) message = error;
      if (validations) {
        message = '';

        Object.keys(validations).forEach((key) => {
          const obj = key.charAt(0).toUpperCase() + key.slice(1);
          const error = validations[key];

          message += `${obj} ${error}\n`;
        });

        this.trigger('validation:invalid', validations);
      }
    }

    App.vent.trigger('notification:show', {
      message,
      type: 'danger'
    });
  }
}
