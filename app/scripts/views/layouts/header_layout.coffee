define [
  'marionette'
  'views/header/navigation'
  'views/header/login'
  'views/header/logout'
  'models/user_session'
], (Marionette, HeaderNavigationView, HeaderLoginView, HeaderLogoutView, UserSession) ->

  class HeaderLayout extends Marionette.Layout
    className: 'container-fluid'
    template: JST['templates/layouts/header_layout']
    model: UserSession.getInstance()

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    events:
      'click .navbar-brand': 'onBrandClick'

    modelEvents:
      'change': 'render'

    initialize: ->
      @headerNavView = new HeaderNavigationView

    onRender: ->
      if @model.isLogged()
        @navigationRegion.show(@headerNavView)
        @formRegion.show(new HeaderLogoutView(model: @model))
      else
        @navigationRegion.close()
        @formRegion.show(new HeaderLoginView(model: @model))

    onBrandClick: ->
      @headerNavView.resetNavigation()
