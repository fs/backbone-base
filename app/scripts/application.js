import Backbone from 'backbone';
import Marionette from 'backbone.marionette';
import AnimatedRegion from 'marionette-animated-region';
import AppConfig from 'scripts/config';
import LinkOverride from 'scripts/overrides/link';

let App = new Marionette.Application();

App.history = () => {
  Backbone.history.start({
    pushState: true,
    root: AppConfig.rootPath
  });
};

App.origin = Backbone.history.location.origin;

App.addRegions({
  notificationsRegion: '#notifications_region',
  navigationRegion: '#navigation_region',
  mainRegion: {
    selector: '#main_region',
    regionClass: AnimatedRegion,
    animation: {
      showAnimation: [
        {
          properties: 'transition.slideLeftBigIn',
          options: { stagger: 300 }
        }
      ]
    }
  }
});

App.on('start', () => {
  App.history();
  LinkOverride.init();
  console.log('app started');
});

export default App;
