import App from 'scripts/application';
import template from 'templates/notifications/notification';

export default class NotificationView extends Marionette.ItemView {
  constructor(...args) {
    this.template = template;

    this.ui = {
      closeButton: '.close'
    };

    this.events = {
      'click @ui.closeButton': 'hideNofitication'
    };

    super(...args);
  }

  hideNofitication(event) {
    event.preventDefault();
    App.vent.trigger('notification:hide');
  }

  serializeData() {
    let { message, type } = this.options;

    return { message, type };
  }
}
