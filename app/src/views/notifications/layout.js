import Marionette from 'backbone.marionette';
import AnimatedRegion from 'marionette-animated-region';
import App from 'application';
import NotificationsItemView from 'views/notifications/notification';
import template from 'templates/notifications/layout';
import { props } from 'decorators';

const DELAY_SPEED = 3000;

@props({
  template,

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
    const typeClass = `alert-${data.type}`;

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
