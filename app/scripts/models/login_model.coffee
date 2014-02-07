define [
  'backbone'
  'models/user_session_model'
], (Backbone, UserSession) ->

  class LoginModel extends Backbone.Model
    url: "/users"
