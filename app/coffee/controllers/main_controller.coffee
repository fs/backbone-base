define [
  'Marionette'
  'Views/layout_view' 
  'Views/header_region_view/header_view'
  'Views/main_region_view/main_view'
  'Views/footer_region_view/footer_view'
], (Marionette, LayoutView, HeaderView, MainView, FooterView) ->
  #not good i think

  class MainController extends Backbone.Marionette.Controller
    initialize: ->
      @layout = new LayoutView()
      @layout.render()

    indexPage: ->
      console.log 'main page loaded'
      @layout.headerRegion.show(new HeaderView())
      @layout.mainRegion.show(new MainView())
      @layout.footerRegion.show(new FooterView())
      
    somePage: ->
      alert 'show some page'
