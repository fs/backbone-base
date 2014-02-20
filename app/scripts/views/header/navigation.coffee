define [
  'marionette'
  'templates'
], (Marionette) ->

  class HeaderNavigationView extends Marionette.ItemView
    tagName: 'ul'
    className: 'nav navbar-nav'
    template: JST['templates/header/navigation']

    ui:
      menuItem: 'li'

    events:
      'click li': 'onNavbarClick'

    onNavbarClick: (event) ->
      currentItem = $(event.currentTarget)
      @resetNavigation()
      currentItem.addClass('active')

    resetNavigation: ->
      @ui.menuItem.removeClass('active')

