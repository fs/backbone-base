import BaseRouter from 'routers/base';
import Controller from 'controllers/landing_controller';
import { props } from 'decorators';

@props({
  appRoutes: {
    '': 'index'
  },

  controller: new Controller()
})
export default class LandingRouter extends BaseRouter {}
