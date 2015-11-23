import App from 'scripts/application';
import NotificationsItemView from 'scripts/views/notifications/notification';
import AnimatedRegion from 'scripts/regions/animated';
import template from 'templates/layouts/notifications_layout';
import { props } from 'scripts/decorators';

const DELAY_SPEED = 3000;

@props({
  template: template,

  regions: {
    notificationsListRegion: {
      selector: '#notifications_list_region',
      regionClass: AnimatedRegion,
      animation: {
        showAnimation: [
          {
            properties: 'transition.slideDownBigIn',
            options: { stagger: 300 }
          }
        ],
        hideAnimation: [
          {
            properties: 'transition.slideUpBigOut',
            options: { stagger: 300 }
          }
        ]
      }
    }
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
    this.clearNotificationsInterval = setTimeout(() => { this.clearRegion(); }, DELAY_SPEED);
  }

  destroyNotification() {
    clearInterval(this.clearNotificationsInterval);
    this.clearRegion();
  }

  clearRegion() {
    this.notificationsListRegion.empty();
  }
}
