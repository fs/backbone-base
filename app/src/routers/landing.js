import { mixin } from 'core-decorators';
import BaseRouter from 'routers/base';
import Controller from 'controllers/landing_controller';

@mixin({
  appRoutes: {
    '': 'index'
  },

  controller: new Controller()
})
export default class LandingRouter extends BaseRouter {}
