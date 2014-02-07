define [
  'marionette'
], (Marionette) ->

  class HeaderNavigationView extends Marionette.ItemView
    tagName: 'ul'
    className: 'nav navbar-nav'
    template: 'templates/header/header_navigation_template'
