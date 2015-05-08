App = require('scripts/application')
template = require('templates/notifications/notification')

class NotificationView extends Marionette.ItemView
  template: template

  ui:
    closeButton: '.close'

  events:
    'click @ui.closeButton': 'onHideNofitication'

  onHideNofitication: (event) ->
    event.preventDefault()
    App.vent.trigger('notification:hide')

  serializeData: ->
    message: @options.message
    type: @options.type

module.exports = NotificationView
