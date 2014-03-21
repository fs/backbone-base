define [
  'marionette'
  'application'
  'facades/session'
  'helpers/routes'
  'templates'
], (Marionette, App, Session, Routes) ->

  class HeaderNavigationView extends Marionette.ItemView
    tagName: 'ul'
    className: 'nav navbar-nav'
    template: JST['templates/header/navigation']

    ui:
      menuItem: 'li'

    templateHelpers:
      routes: Routes

    initialize: ->
      @listenTo App.vent, 'navigation:page_loaded', @highlightNavigation

    highlightNavigation: (nav) =>
      @ui.menuItem.removeClass('active')

      unless _.isEmpty(nav)
        @$el.find("a[data-nav='#{nav}']").parent().addClass('active')
