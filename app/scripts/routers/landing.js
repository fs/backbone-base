import BaseRouter from 'scripts/routers/base';
import Controller from 'scripts/controllers/landing_controller';
import { props } from 'scripts/decorators';

@props({
  appRoutes: {
    '': 'index'
  },

  controller: new Controller()
})
export default class LandingRouter extends BaseRouter {}
