define [
  'Marionette'
  'Views/layout_view'
  'Views/header_region_view/header_view'
  'Views/main_region_view/main_view'
  'Views/footer_region_view/footer_view'
  'Models/app_model'
], (Marionette, LayoutView, HeaderView, MainView, FooterView, AppModel) ->

  class MainController extends Backbone.Marionette.Controller
    initialize: ->
      @layout = new LayoutView()
      @layout.render()

    indexPage: ->
      console.log 'main page loaded'
      @layout.headerRegion.show(new HeaderView())
      @layout.mainRegion.show(new MainView())
      @layout.footerRegion.show(new FooterView())
      class TestModel extends AppModel
        url: "mocks/some_data.json"
      tModel = new TestModel()
      tModel.fetch()
      
    somePage: ->
      alert 'show some page'
