define [
  'marionette'
  'views/header/header_navigation'
  'views/header/header_login'
  'views/header/header_login_logout'
  'models/user_session'
], (Marionette, HeaderNavigationView, HeaderLoginView, HeaderLogoutView, UserSession) ->

  class HeaderLayoutView extends Marionette.Layout
    className: 'container-fluid'
    template: JST['templates/header/header_layout']
    model: UserSession.getInstance()

    regions:
      navigationRegion: '#navigation_region'
      formRegion: '#login_form_region'

    modelEvents:
      'change': 'render'

    onRender: ->
      if @model.isLogged()
        @navigationRegion.show(new HeaderNavigationView)
        @formRegion.show(new HeaderLoginView)
      else
        @navigationRegion.close()
        @formRegion.show(new HeaderLogoutView)

      # @formRegion.show(new HeaderLoginFormView)
