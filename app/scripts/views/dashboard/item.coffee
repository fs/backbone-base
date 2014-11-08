template = require('../../../templates/dashboard/item.jade')

class DashboardItemView extends Marionette.ItemView
  tagName: 'li'
  className: 'item'
  template: template
