define [
  'Marionette'
], (Marionette) ->

  class HeaderNavigationView extends Backbone.Marionette.ItemView
    tagName: 'ul'
    className: 'nav navbar-nav'
    template: JST["templates/header/header_navigation_template"]
