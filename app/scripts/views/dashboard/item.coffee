define [
  'marionette'
], (Marionette) ->

  class DashboardItemView extends Marionette.ItemView
    tagName: 'li'
    className: 'item'
    template: JST['templates/dashboard/item']
