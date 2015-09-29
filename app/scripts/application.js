import AppConfig from 'scripts/config';
import LinkOverride from 'scripts/overrides/link';

let App = new Marionette.Application();

App.history = function() {
  Backbone.history.start({
    pushState: true,
    root: AppConfig.rootPath
  });
};

App.origin = Backbone.history.location.origin;

App.addRegions({
  navigationRegion: '#navigation_region',
  mainRegion: '#main_region'
});

App.on('start', function() {
  App.history();
  LinkOverride.init();
  console.log('app started');
});

export default App;
