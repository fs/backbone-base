import Marionette from 'backbone.marionette';
import template from 'templates/content/landing';
import { props } from 'scripts/decorators';

@props({
  className: 'page-header',
  template: template
})
export default class ContentLandingView extends Marionette.ItemView {}
