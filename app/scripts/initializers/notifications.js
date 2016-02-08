import App from 'scripts/application';
import NotificationsLayout from 'scripts/views/layouts/notifications_layout';

App.addInitializer(function() {
  App.notificationsRegion.show(new NotificationsLayout());
  console.log('module notifications started');
});
