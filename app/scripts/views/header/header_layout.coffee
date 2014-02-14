define [
  'marionette'
  'views/header/header_navigation'
  'views/header/header_login_form'
  'models/user_session'
], (Marionette, HeaderNavigationView, HeaderLoginFormView, UserSession) ->

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
      else
        @navigationRegion.close()
      @formRegion.show(new HeaderLoginFormView)
