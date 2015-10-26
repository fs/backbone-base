import App from 'scripts/application';
import NotificationsItemView from 'scripts/views/notifications/notification';
import template from 'templates/layouts/notifications_layout';
import { props } from 'scripts/decorators';

const delaySpeed = 3000;

@props({
  template: template,

  regions: {
    notificationsListRegion: '#notifications_list_region'
  }
})
export default class NotificationsLayout extends Marionette.LayoutView {
  initialize() {
    this.listenTo(App.vent, 'notification:show', this.renderNotification);
    this.listenTo(App.vent, 'notification:hide', this.destroyNotification);
  }

  renderNotification(data) {
    let typeClass = `alert-${data.type}`;

    if (this.clearNotificationsInterval) {
      clearInterval(this.clearNotificationsInterval);
    }

    this.notificationsListRegion.show(new NotificationsItemView({
      message: data.message,
      type: typeClass
    }));
    this.clearNotificationsInterval = setTimeout(() => { this.clearRegion(); }, delaySpeed);
  }

  destroyNotification() {
    clearInterval(this.clearNotificationsInterval);
    this.clearRegion();
  }

  clearRegion() {
    this.notificationsListRegion.empty();
  }
}
