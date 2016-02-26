import App from 'application';
import NotificationsLayout from 'views/notifications/layout';

App.on('before:start', function() {
  App.layout.notificationsRegion.show(new NotificationsLayout());
  console.log('module notifications started');
});
