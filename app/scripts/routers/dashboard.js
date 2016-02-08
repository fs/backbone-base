import BaseRouter from 'scripts/routers/base';
import Controller from 'scripts/controllers/dashboard_controller';
import { props } from 'scripts/decorators';

@props({
  navigation: 'dashboard',

  appRoutes: {
    'dashboard': 'index'
  },

  controller: new Controller()
})
export default class DashboardRouter extends BaseRouter {}
