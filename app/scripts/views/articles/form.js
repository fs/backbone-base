import Marionette from 'backbone.marionette';
import Article from 'scripts/models/article';
import FormBehavior from 'scripts/views/behaviors/form';
import Session from 'scripts/facades/session';
import user from 'scripts/helpers/user';
import template from 'templates/articles/form';
import { props } from 'scripts/decorators';

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
