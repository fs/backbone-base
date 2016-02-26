import Marionette from 'backbone.marionette';
import App from 'application';
import ContentLandingView from 'views/content/landing';

export default class LandingController extends Marionette.Object {
  index() {
    App.layout.mainRegion.show(new ContentLandingView());
  }
}
