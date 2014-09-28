define [
  'configs/config'
], (Config) ->

  class ConfigHelper
    @getUrl: ->
      environment = Config.env()

      if environment.port isnt ''
        "#{environment.url}:#{environment.port}/#{environment.api}"
      else
        "#{environment.url}/#{environment.api}"
