define [
  'marionette'
  'application'
  'helpers/routes'
  'facades/session'
  'templates'
], (Marionette, App, Routes, Session) ->

  class ArticlesItemView extends Marionette.ItemView
    template: JST['templates/articles/item']

    className: 'media'

    events:
      'click .close': 'onRemoveClicked'

    templateHelpers:
      routes: Routes

    serializeData: ->
      _.extend super, Session.currentUser().pick('avatar', 'name')

    onRemoveClicked: ->
      @model.destroy
        success: ->
          App.vent.trigger('notification', {type: 'info', message: 'Article successfully deleted!'})
