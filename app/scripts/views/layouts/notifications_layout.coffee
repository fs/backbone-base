define [
  'marionette'
  'application'
  'regions/notifications_region'
  'views/notifications/notification'
  'templates'
], (Marionette, App, NotificationsRegion, NotificationsItemView) ->

  class NotificationsLayout extends Marionette.LayoutView
    DELAY_SPEED = 3000

    template: JST['templates/layouts/notifications_layout']

    regions:
      notificationsListRegion: NotificationsRegion

    initialize: ->
      @listenTo App.vent, 'notification', @onRenderNotificationsItemView

    onRenderNotificationsItemView: (data) ->
      clearInterval(@clearNotificationsInterval)

      switch data.type
        when 'success' then typeClass = 'alert-success'
        when 'info' then typeClass = 'alert-info'
        when 'error' then typeClass = 'alert-error'
        when 'warning' then typeClass = 'alert-warning'

      @notificationsListRegion.show(new NotificationsItemView({message: data.message, type: typeClass}))
      # @clearNotificationsInterval = setTimeout((=> @notificationsListRegion.empty()), DELAY_SPEED)
