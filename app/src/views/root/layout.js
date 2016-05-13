import Marionette from 'backbone.marionette';
import { mixin } from 'core-decorators';
import AnimatedRegion from 'marionette-animated-region';

@mixin({
  el: 'body',

  regions: {
    notificationsRegion: '#notifications_region',
    navigationRegion: '#navigation_region',
    mainRegion: {
      selector: '#main_region',
      regionClass: AnimatedRegion,
      animation: {
        showAnimation: [
          {
            properties: 'transition.slideLeftBigIn',
            options: { stagger: 300 }
          }
        ]
      }
    }
  }
})
export default class RootLayout extends Marionette.LayoutView {}
