import AppConfig from 'scripts/config';

export default class RoutesHelper {
  static initModule(module) {
    let appRoutes = module.router.appRoutes;

    for (let pattern in appRoutes) {
      if (appRoutes.hasOwnProperty(pattern)) {
        let routeName = appRoutes[pattern];
        this.addRoute(module.moduleName, routeName, pattern);
      }
    }
  }

  static rootPath() {
    return AppConfig.rootPath;
  }

  static prependRoot(path) {
    let rootPath = this.rootPath();
    return (path.indexOf(rootPath)) ? `${rootPath}${path}` : path;
  }

  static addRoute(moduleName, routeName, pattern) {
    let keys = pattern.match(/\:\w+/g);
    let methodName = `${moduleName.toLowerCase()}${routeName.charAt(0).toUpperCase()}${routeName.substr(1).toLowerCase()}Path`;

    this[methodName] = (...params) => {
      let path = pattern;

      if (!keys) return this.prependRoot(path);

      if (keys.length !== params.length) {
        throw new Error(`incorrect params count (${params.length} for ${keys.length})`);
      }

      params.forEach((param) => {
        path = path.replace(/\:\w+/, param);
      });

      return this.prependRoot(path);
    };

    return this[methodName];
  }
}
