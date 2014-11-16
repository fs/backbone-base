define [
  'marionette'
  'helpers/routes_helper'
  'facades/session'
  'templates'
], (Marionette, Routes, Session) ->

  class ArticlesItemView extends Marionette.ItemView
    className: 'media'
    template: JST['templates/articles/item']

    events:
      'click .close': 'onRemoveClicked'

    templateHelpers:
      routes: Routes

    serializeData: ->
      _.extend super, Session.currentUser().pick('avatar', 'name')

    onRemoveClicked: ->
      @model.destroy
        success: ->
          alert 'article deleted'
