Session = require('../../facades/session.coffee')
DashboardItemView = require('../../views/dashboard/item.coffee')
template = require('../../../templates/dashboard/dashboard.jade')

class DashboardView extends Marionette.CompositeView
  className: 'jumbotron'
  template: template
  childView: DashboardItemView
  childViewContainer: '.articles-list'
  model: Session.currentUser()

module.exports = DashboardView
