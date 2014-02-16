define [
  'marionette'
], (Marionette) ->

  class HeaderLogoutView extends Marionette.ItemView
    className: 'nav navbar-nav navbar-right'
    template: JST['templates/header/header_logout']
