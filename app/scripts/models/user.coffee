define [
  'backbone'
], (Backbone) ->

  class User extends Backbone.Model
    url: '/api/sign_in'

    validation:
      password:
        required: true
      email:
        pattern: 'email'
        required: true
