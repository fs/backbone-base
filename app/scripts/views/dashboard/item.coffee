define [
  'marionette'
], (Marionette) ->

  class DashboardView extends Marionette.ItemView
    tagName: 'li'
    className: 'item'
    template: JST['templates/dashboard/item']
