Session = require('scripts/facades/session')
DashboardItemView = require('scripts/views/dashboard/item')
template = require('templates/dashboard/dashboard')

class DashboardView extends Marionette.CompositeView
  className: 'jumbotron'
  template: template
  childView: DashboardItemView
  childViewContainer: '.articles-list'
  model: Session.currentUser()

module.exports = DashboardView
