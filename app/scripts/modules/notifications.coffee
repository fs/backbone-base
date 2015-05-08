App = require('scripts/application')
NotificationsLayout = require('scripts/views/layouts/notifications_layout')

Notifications = App.module('Notifications')

Notifications.addInitializer ->
  App.notificationsRegion.show(new NotificationsLayout)

Notifications.on 'start', ->
  console.log 'module notifications started'

module.exports = Notifications
