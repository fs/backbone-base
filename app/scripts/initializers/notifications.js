import App from 'scripts/application';
import NotificationsLayout from 'scripts/views/notifications/layout';

App.on('before:start', function() {
  App.layout.notificationsRegion.show(new NotificationsLayout());
  console.log('module notifications started');
});
