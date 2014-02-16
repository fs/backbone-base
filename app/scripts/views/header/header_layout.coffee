define [
  'marionette'
  'events'
  'views/header/header_navigation'
  'views/header/header_login'
  'views/header/header_logout'
  'models/user_session'
], (Marionette, Vent, HeaderNavigationView, HeaderLoginView, HeaderLogoutView, UserSession) ->

  class HeaderLayoutView extends Marionette.Layout
    className: 'container-fluid'
    template: JST['templates/header/header_layout']
    model: UserSession.getInstance()

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    modelEvents:
      'change': 'render'

    initialize: ->
      Vent.on 'login', @render

    onRender: ->
      if @model.isLogged()
        @navigationRegion.show(new HeaderNavigationView)
        @formRegion.show(new HeaderLogoutView)
      else
        @navigationRegion.close()
        @formRegion.show(new HeaderLoginView(model: @model))
