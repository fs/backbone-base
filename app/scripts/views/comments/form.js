import Comment from 'scripts/models/comment';
import FormBehavior from 'scripts/views/behaviors/form';
import Session from 'scripts/facades/session';
import user from 'scripts/helpers/user';
import template from 'templates/comments/form';

export default class CommentFormView extends Marionette.ItemView {
  constructor(...args) {
    this.model = new Comment(Session.currentUser().pick('avatar', 'name'));
    this.template = template;

    this.events = {
      'submit form': 'onFormSubmit'
    };

    this.bindings = {
      '[name="text"]': {
        observe: 'text',
        updateView: false,
        setOptions: {
          validate: true
        }
      }
    };

    this.behaviors = {
      form: {
        behaviorClass: FormBehavior,
        tooltip: {
          placement: 'left',
          trigger: 'focus'
        }
      }
    };

    this.templateHelpers = {
      user: user
    };

    super(...args);

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
