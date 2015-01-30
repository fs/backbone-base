App = require('scripts/application')
AppConfig = require('scripts/config')

class RoutesHelper
  @alreadyInitialized: false

  @init: ->
    return if @alreadyInitialized

    for moduleName, module of App.submodules when module.router?
      for pattern, routeName of module.router.appRoutes
        addRoute(moduleName, routeName, pattern)

    @alreadyInitialized = true

  @rootPath: -> AppConfig.rootPath

  prependRoot = (path) =>
    rootPath = @rootPath()
    if path.indexOf(rootPath) then "#{rootPath}#{path}" else path

  addRoute = (moduleName, routeName, pattern) =>
    keys = pattern.match(/\:\w+/g)
    methodName = "#{moduleName.toLowerCase()}#{routeName.charAt(0).toUpperCase()}#{routeName.substr(1).toLowerCase()}Path"

    @[methodName] = (params...) ->
      return prependRoot(pattern) unless keys

      if keys.length isnt params.length
        throw new Error("incorrect params count (#{params.length} for #{keys.length})")

      pattern = pattern.replace(/\:\w+/, param) for param in params

      prependRoot(pattern)

module.exports = RoutesHelper
