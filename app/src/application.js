import Marionette from 'backbone.marionette';
import History from 'services/history';
import LinkOverride from 'overrides/link';
import RootLayout from 'views/root/layout';

class App extends Marionette.Application {
  onBeforeStart() {
    this.layout = new RootLayout();
  }

  onStart() {
    History.init();
    LinkOverride.init();
    console.log('app started');
  }
}

export default new App();
