import BaseRouter from 'scripts/routers/base';
import { props } from 'scripts/decorators';

@props({
  navigation: 'dashboard',

  appRoutes: {
    'dashboard': 'index'
  }
})
export default class DashboardRouter extends BaseRouter {}
