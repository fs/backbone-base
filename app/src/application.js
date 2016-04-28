import 'babel-polyfill';
import 'backbone-es6-promise';
import Marionette from 'backbone.marionette';
import History from 'services/history';
import LinkOverride from 'overrides/link';
import SyncOverride from 'overrides/sync';
import RootLayout from 'views/root/layout';

class App extends Marionette.Application {
  initialize() {
    this.history = History;
  }

  onBeforeStart() {
    LinkOverride.init();
    SyncOverride.init();
    this.layout = new RootLayout();
  }

  onStart() {
    this.history.init();
    console.log('app started');
  }
}

export default new App();
