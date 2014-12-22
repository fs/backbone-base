App = require('scripts/application')

AppConfig = require('scripts/config')

class RoutesHelper
  @isInited: false

  @init: ->
    return if @isInited

    @isInited = true

    for moduleName, module of App.submodules
      continue unless module.router?

      for pattern, routeName of module.router.appRoutes
        addRoute(moduleName, routeName, pattern)

  @rootPath: -> AppConfig.rootPath

  rootCheck = (path) =>
    rootPath = @rootPath()
    if path.indexOf(rootPath) then "#{rootPath}#{path}" else path

  addRoute = (moduleName, routeName, pattern) =>
    keys = pattern.match(/\:\w+/g)
    methodName = "#{moduleName.toLowerCase()}#{routeName.charAt(0).toUpperCase()}#{routeName.substr(1).toLowerCase()}Path"

    @[methodName] = (params...) ->
      return rootCheck(pattern) unless keys

      if keys.length isnt params.length
        throw new Error("incorrect params count (#{params.length} for #{keys.length})")

      pattern = pattern.replace(/\:\w+/, param) for param in params

      rootCheck(pattern)

module.exports = RoutesHelper
