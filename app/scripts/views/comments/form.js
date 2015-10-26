import Comment from 'scripts/models/comment';
import FormBehavior from 'scripts/views/behaviors/form';
import Session from 'scripts/facades/session';
import user from 'scripts/helpers/user';
import template from 'templates/comments/form';
import { props } from 'scripts/decorators';

@props({
  model: new Comment(Session.currentUser().pick('avatar', 'name')),
  template: template,

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
    }
  },

  behaviors: {
    form: {
      behaviorClass: FormBehavior
    }
  },

  templateHelpers: {
    user: user
  }
})
export default class CommentFormView extends Marionette.ItemView {
  initialize() {
    this.currentArticle = this.options.currentArticle;
    this.model.set('article_id', this.currentArticle.get('id'));
  }

  onFormSubmit(event) {
    event.preventDefault();

    if (this.model.isValid(true)) {
      this.currentArticle.get('comments').create(this.model, { wait: true });
    }
  }
}
