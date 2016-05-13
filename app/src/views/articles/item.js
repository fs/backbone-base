import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import App from 'application';
import Session from 'services/session';
import routes from 'helpers/routes';
import user from 'helpers/user';
import template from 'templates/articles/item';

@mixin({
  template,
  tagName: 'article',
  className: 'articles-item',

  events: {
    'click .close': 'articleRemove'
  },

  templateHelpers: {
    routes,
    user
  }
})
export default class ArticlesItemView extends Marionette.ItemView {
  serializeData() {
    const props = { page: this.options.page };
    Object.assign(props, this.model.toJSON());

    return props;
  }

  articleRemove() {
    this.model.destroy({ wait: true });
  }
}
