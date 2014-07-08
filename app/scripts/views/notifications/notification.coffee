define [
  'marionette'
  'templates'
], (Marionette) ->

  class NotificationView extends Marionette.ItemView
    template: JST['templates/notifications/notification']

    serializeData: ->
      message: @options.message
      type: @options.type
