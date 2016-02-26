import _ from 'underscore';
import Marionette from 'backbone.marionette';
import App from 'application';
import routes from 'helpers/routes';
import template from 'templates/navigation/links';
import { props } from 'decorators';

@props({
  template,
  tagName: 'ul',
  className: 'nav navbar-nav',

  ui: {
    menuItem: 'li'
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
