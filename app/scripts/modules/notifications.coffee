define [
  'application'
  'views/layouts/notifications_layout'
], (App, NotificationsLayout) ->

  Notifications = App.module('Notifications')

  Notifications.addInitializer ->
    App.notificationsRegion.show(new NotificationsLayout)

  Notifications.on 'start', ->
    console.log 'module notifications started'

  Notifications
