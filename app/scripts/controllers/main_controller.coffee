define [
  'controllers/base_controller'
  'views/content/landing'
], (BaseController, ContentLandingView) ->

  class MainController extends BaseController
    initialize: ->
      super
      @layout.render()

    index: ->
      @layout.mainRegion.show(new ContentLandingView)
