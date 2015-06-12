import Session from 'scripts/facades/session';
import routes from 'scripts/helpers/routes';
import template from 'templates/articles/item';

export default class ArticlesItemView extends Marionette.ItemView {
  constructor(...args) {
    this.className = 'media';
    this.template = template;

    this.events = {
      'click .close': 'onRemoveClicked'
    };

    this.templateHelpers = {
      routes: routes
    };

    super(...args);
  }

  onRemoveClicked() {
    this.model.destroy({
      success: function() {
        alert('article deleted');
      }
    });
  }
}
