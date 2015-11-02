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
  mainRegion: '#main_region'
});

App.on('start', () => {
  App.history();
  LinkOverride.init();
  console.log('app started');
});

export default App;
