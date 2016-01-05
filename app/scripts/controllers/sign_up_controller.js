import Marionette from 'backbone.marionette';
import App from 'scripts/application';
import SignUpView from 'scripts/views/sign_up/sign_up';

export default class SignUpController extends Marionette.Controller {
  index() {
    App.mainRegion.show(new SignUpView());
  }
}
