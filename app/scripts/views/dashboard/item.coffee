template = require('../../../templates/dashboard/item')

class DashboardItemView extends Marionette.ItemView
  tagName: 'li'
  className: 'item'
  template: template

module.exports = DashboardItemView