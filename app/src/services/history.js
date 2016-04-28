import Backbone from 'backbone';
import AppConfig from 'config';

const history = Backbone.history;

export default class History {
  static init() {
    history.start({
      pushState: true,
      root: AppConfig.rootPath
    });
  }

  static reload() {
    history.loadUrl();
  }

  static navigate(route, options = {}) {
    history.navigate(route, options);
  }

  static fragment() {
    return history.getFragment();
  }
}
