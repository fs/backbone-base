define [
  'Marionette'
  'Models/user_session_model'
], (Marionette, UserSession) ->

  class LoginModel extends Backbone.Model
    url: "mocks/users.json"
