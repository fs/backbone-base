import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import Router from 'scripts/routers/articles';
import Routes from 'scripts/helpers/routes';
import { props } from 'scripts/decorators';

@props({
  startWithParent: true
})
class Articles extends Marionette.Module {
  onBeforeStart() {
    this.router = new Router();
    Routes.initModule(this);
  }

  onStart() {
    console.log('module articles started');
  }
}

App.module('Articles', Articles);

export default Articles;
