import App from 'scripts/application';
import Routes from 'scripts/helpers/routes';
import template from 'templates/navigation/navigation';

export default class NavigationView extends Marionette.ItemView {
  constructor(...args) {
    this.tagName = 'ul';
    this.className = 'nav navbar-nav';
    this.template = template;

    this.ui = {
      menuItem: 'li'
    };

    this.templateHelpers = {
      routes: Routes
    };

    super(...args);

    this.listenTo(App.vent, 'navigation:change', this.onHighlightNavigation);
  }

  onHighlightNavigation(nav) {
    this.ui.menuItem.removeClass('active');

    if (!_.isEmpty(nav)) {
      this.$el.find(`a[data-nav=${nav}]`).parent().addClass('active');
    }
  }
}
