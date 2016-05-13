import _ from 'underscore';
import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import App from 'application';
import routes from 'helpers/routes';
import template from 'templates/navigation/links';

@mixin({
  template,
  tagName: 'ul',
  className: 'nav navbar-nav',

  ui: {
    menuItem: '.navbar-item'
  },

  templateHelpers: { routes }
})
export default class NavigationLinksView extends Marionette.ItemView {
  initialize() {
    this.listenTo(App.vent, 'navigation:change', this.onHighlightNavigation);
  }

  serializeData() {
    return { defaultPage: 1 };
  }

  onHighlightNavigation(nav) {
    this.ui.menuItem.removeClass('active');

    if (!_.isEmpty(nav)) {
      this.$el.find(`a[data-nav=${nav}]`).parent().addClass('active');
    }
  }
}
