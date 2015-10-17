import App from 'scripts/application';
import NotificationsItemView from 'scripts/views/notifications/notification';
import template from 'templates/layouts/notifications_layout';

const delaySpeed = 3000;

export default class NotificationsLayout extends Marionette.LayoutView {
  constructor(...args) {
    this.template = template;

    this.regions = {
      notificationsListRegion: '#notifications_list_region'
    };

    super(...args);

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
