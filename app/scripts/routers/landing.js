import BaseRouter from 'scripts/routers/base';
import { props } from 'scripts/decorators';

@props({
  appRoutes: {
    '': 'index'
  }
})
export default class LandingRouter extends BaseRouter {}
