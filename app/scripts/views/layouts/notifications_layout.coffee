App = require('scripts/application')
AnimatedRegion = require('scripts/regions/animated_region')
NotificationsItemView = require('scripts/views/notifications/notification')
template = require('templates/layouts/notifications_layout')

class NotificationsLayout extends Marionette.LayoutView
  DELAY_SPEED = 5000

  template: template

  regions:
    notificationsListRegion:
      selector: '#notifications_list_region'
      regionClass: AnimatedRegion
      animation:
        showAnimation: [
          {
            p: 'transition.slideDownBigIn'
            o: {stagger: 300}
          }
        ]
        hideAnimation: [
          {
            p: 'transition.slideUpBigOut'
            o: {stagger: 300}
          }
        ]

  initialize: ->
    @listenTo App.vent, 'notification:show', @onRenderNotification
    @listenTo App.vent, 'notification:hide', @onDestroyNotification

  onRenderNotification: (data) ->
    clearInterval(@clearNotificationsInterval) if @clearNotificationsInterval
    typeClass = "alert-#{data.type}"
    @notificationsListRegion.show(new NotificationsItemView(message: data.message, type: typeClass))
    @clearNotificationsInterval = setTimeout((=> @clearRegion()), DELAY_SPEED)

  onDestroyNotification: ->
    clearInterval(@clearNotificationsInterval)
    @clearRegion()

  clearRegion: ->
    @notificationsListRegion.empty()

module.exports = NotificationsLayout
