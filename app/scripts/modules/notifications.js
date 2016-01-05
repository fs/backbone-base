import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import NotificationsLayout from 'scripts/views/layouts/notifications_layout';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class Notifications extends Marionette.Module {
  onBeforeStart() {
    App.notificationsRegion.show(new NotificationsLayout());
  }

  onStart() {
    console.log('module notifications started');
  }
}

App.module('Notifications', Notifications);

export default Notifications;
