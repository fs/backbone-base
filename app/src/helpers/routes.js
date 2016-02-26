export default class RoutesHelper {
  static init(options = { root: '/' }) {
    this.root = options.root;
  }

  static bind(routerName, router) {
    const appRoutes = router.appRoutes;

    for (const pattern in appRoutes) {
      if (appRoutes.hasOwnProperty(pattern)) {
        const routeName = appRoutes[pattern];
        this.addRoute(routerName, routeName, pattern);
      }
    }
  }

  static rootPath() {
    return this.root;
  }

  static prependRoot(path) {
    const rootPath = this.rootPath();

    return (path.indexOf(rootPath)) ? `${rootPath}${path}` : path;
  }

  static addRoute(routerName, routeName, pattern) {
    const keys = pattern.match(/\:\w+/g);
    const routerPart = routerName;
    const routePart = routeName.charAt(0).toUpperCase() + routeName.substr(1).toLowerCase();
    const methodName = `${routerPart}${routePart}Path`;

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
