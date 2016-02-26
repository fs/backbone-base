import Marionette from 'backbone.marionette';
import App from 'application';
import SignUpView from 'views/sign_up/sign_up';

export default class SignUpController extends Marionette.Object {
  index() {
    App.layout.mainRegion.show(new SignUpView());
  }
}
