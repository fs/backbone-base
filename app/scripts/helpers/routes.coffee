AppConfig = require('scripts/config')

class RoutesHelper
  @initModule: (module) ->
    for pattern, routeName of module.router.appRoutes
      addRoute(module.moduleName, routeName, pattern)

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

      for param in params
        pattern = pattern.replace(/\:\w+/, param)

      prependRoot(pattern)

module.exports = RoutesHelper
