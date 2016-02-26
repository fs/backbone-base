import Backbone from 'backbone';
import Marionette from 'backbone.marionette';
import AppConfig from 'config';
import LinkOverride from 'overrides/link';
import RootLayout from 'views/root/layout';
import routes from 'helpers/routes';

class App extends Marionette.Application {
  initialize() {
    this.history = Backbone.history;
  }

  onBeforeStart() {
    this.layout = new RootLayout();
    routes.init({ root: AppConfig.rootPath });
  }

  onStart() {
    this.history.start({
      pushState: true,
      root: AppConfig.rootPath
    });
    LinkOverride.init();
    console.log('app started');
  }

  navigate(route, options = {}) {
    return this.history.navigate(route, options);
  }
}

export default new App();
