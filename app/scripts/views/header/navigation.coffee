define [
  'marionette'
  'helpers/routes'
  'templates'
], (Marionette, Routes) ->

  class HeaderNavigationView extends Marionette.ItemView
    tagName: 'ul'
    className: 'nav navbar-nav'
    template: JST['templates/header/navigation']

    ui:
      menuItem: 'li'

    events:
      'click li': 'onNavbarClick'

    templateHelpers:
      routes: Routes

    onNavbarClick: (event) ->
      currentItem = $(event.currentTarget)
      @resetNavigation()
      currentItem.addClass('active')

    resetNavigation: ->
      @ui.menuItem.removeClass('active')

