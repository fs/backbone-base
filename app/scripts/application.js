import AppConfig from 'scripts/config';
import LinkOverride from 'scripts/overrides/link';
import AnimatedRegion from 'scripts/regions/animated';

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
