import Marionette from 'backbone.marionette';
import template from 'templates/content/landing';
import { props } from 'scripts/decorators';

@props({
  template,
  className: 'page-header'
})
export default class ContentLandingView extends Marionette.ItemView {}
