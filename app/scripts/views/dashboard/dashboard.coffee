define [
  'marionette'
  'views/dashboard/item'
  'facades/session'
  'templates'
], (Marionette, DashboardItemView, Session) ->

  class DashboardView extends Marionette.CompositeView
    className: 'jumbotron'
    template: JST['templates/dashboard/dashboard']
    childView: DashboardItemView
    childViewContainer: '.articles-list'
    model: Session.currentUser()
