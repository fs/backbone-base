define [
  'marionette'
  'views/dashboard/item'
  'models/user_session'
], (Marionette, DashboardItemView, UserSession) ->

  class DashboardView extends Marionette.CompositeView
    className: 'jumbotron'
    template: JST['templates/dashboard/dashboard']
    itemView: DashboardItemView
    itemViewContainer: '.articles-list'
    model: UserSession.getInstance()
