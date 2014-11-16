define ->

  class Config
    environments =
      development:
        port: 8000
        url: 'http://localhost'
        api: 'api'
      production:
        port: ''
        url: 'http://localhost'
        api: 'api'

    @env: ->
      environments['@@environment']
