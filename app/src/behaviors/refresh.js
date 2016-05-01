import Marionette from 'backbone.marionette';
import App from 'application';
import Session from 'services/session';
import { props } from 'decorators';

@props({
  modelEvents: {
    'change': 'render'
  }
})
export default class RefreshBehavior extends Marionette.Behavior {
  initialize() {
    this.listenTo(App.vent, 'data:refresh', this.fetchData);
  }

  render() {
    this.view.render();
  }

  fetchData() {
    if (this.view.collection) {
      this.view.collection.fetch();
    }

    if (this.view.model) {
      this.view.model.fetch().then(this.saveSession.bind(this));
    }
  }

  saveSession() {
    const currentModelPrototype = this.view.model.constructor.prototype;
    const sessionModelPrototype = Session.currentUser().constructor.prototype;

    if (currentModelPrototype === sessionModelPrototype) {
      Session.save();
    }
  }
}
