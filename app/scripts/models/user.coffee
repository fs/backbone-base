define [
  'backbone'
], (Backbone) ->

  class User extends Backbone.Model
    url: '/api/sign_in'
