App = require('../../application.coffee')
Routes = require('../../helpers/routes.coffee')
template = require('../../../templates/navigation/navigation.jade')

class NavigationView extends Marionette.ItemView
  tagName: 'ul'
  className: 'nav navbar-nav'
  template: template

  ui:
    menuItem: 'li'

  templateHelpers:
    routes: Routes

  initialize: ->
    @listenTo App.vent, 'navigation:change', @highlightNavigation

  highlightNavigation: (nav) ->
    @ui.menuItem.removeClass('active')

    unless _.isEmpty(nav)
      @$el.find("a[data-nav='#{nav}']").parent().addClass('active')

module.exports = NavigationView
