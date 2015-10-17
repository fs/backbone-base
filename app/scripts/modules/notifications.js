import App from 'scripts/application';
import NotificationsLayout from 'scripts/views/layouts/notifications_layout';

class Notifications extends Marionette.Module {
  constructor(...args) {
    this.startWithParent = true;

    super(...args);
  }

  onBeforeStart() {
    App.notificationsRegion.show(new NotificationsLayout);
  }

  onStart() {
    console.log('module notifications started');
  }
}

App.module('Notifications', Notifications);

export default Notifications;
