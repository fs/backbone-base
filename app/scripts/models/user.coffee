define [
  'backbone'
  'helpers/config_helper'
], (Backbone, Config) ->

  class User extends Backbone.Model
    url: '#{Config.getUrl()}/sign_in'

    validation:
      password:
        required: true
      email:
        pattern: 'email'
        required: true
