import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import template from 'templates/content/landing';

@mixin({
  template,
  className: 'page-header'
})
export default class ContentLandingView extends Marionette.ItemView {}
