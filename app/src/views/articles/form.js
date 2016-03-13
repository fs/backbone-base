import Marionette from 'backbone.marionette';
import Article from 'models/article';
import FormBehavior from 'behaviors/form';
import Session from 'services/session';
import user from 'helpers/user';
import template from 'templates/articles/form';
import { props } from 'decorators';

@props({
  template,

  events: {
    'submit form': 'onFormSubmit'
  },

  bindings: {
    '[name="text"]': {
      observe: 'text',
      updateView: false,
      setOptions: {
        validate: true
      }
    },
    '[name="title"]': {
      observe: 'title',
      updateView: false,
      setOptions: {
        validate: true
      }
    }
  },

  behaviors: {
    form: {
      behaviorClass: FormBehavior
    }
  },

  templateHelpers: { user }
})
export default class ArticlesFormView extends Marionette.ItemView {
  initialize() {
    this.model = new Article(Session.currentUser().pick('avatar', 'name'));
  }

  onFormSubmit(event) {
    event.preventDefault();

    if (this.model.isValid(true)) {
      this.collection.create(this.model, { wait: true });
    }
  }
}
