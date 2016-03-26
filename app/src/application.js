import 'babel-polyfill';
import 'backbone-es6-promise';
import Marionette from 'backbone.marionette';
import History from 'services/history';
import LinkOverride from 'overrides/link';
import RootLayout from 'views/root/layout';

class App extends Marionette.Application {
  onBeforeStart() {
    LinkOverride.init();
    this.layout = new RootLayout();
  }

  onStart() {
    History.init();
    console.log('app started');
  }
}

export default new App();
