var AppConfig, RoutesHelper,
  slice = [].slice;

import AppConfig from 'scripts/config';

RoutesHelper = (function() {
  var addRoute, prependRoot;

  function RoutesHelper() {}

  RoutesHelper.initModule = function(module) {
    var pattern, ref, results, routeName;
    ref = module.router.appRoutes;
    results = [];
    for (pattern in ref) {
      routeName = ref[pattern];
      results.push(addRoute(module.moduleName, routeName, pattern));
    }
    return results;
  };

  RoutesHelper.rootPath = function() {
    return AppConfig.rootPath;
  };

  prependRoot = function(path) {
    var rootPath;
    rootPath = RoutesHelper.rootPath();
    if (path.indexOf(rootPath)) {
      return "" + rootPath + path;
    } else {
      return path;
    }
  };

  addRoute = function(moduleName, routeName, pattern) {
    var keys, methodName;
    keys = pattern.match(/\:\w+/g);
    methodName = "" + (moduleName.toLowerCase()) + (routeName.charAt(0).toUpperCase()) + (routeName.substr(1).toLowerCase()) + "Path";
    return RoutesHelper[methodName] = function() {
      var i, len, param, params;
      params = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      if (!keys) {
        return prependRoot(pattern);
      }
      if (keys.length !== params.length) {
        throw new Error("incorrect params count (" + params.length + " for " + keys.length + ")");
      }
      for (i = 0, len = params.length; i < len; i++) {
        param = params[i];
        pattern = pattern.replace(/\:\w+/, param);
      }
      return prependRoot(pattern);
    };
  };

  return RoutesHelper;

})();

export default RoutesHelper
