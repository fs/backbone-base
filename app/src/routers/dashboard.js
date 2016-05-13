import { mixin } from 'core-decorators';
import BaseRouter from 'routers/base';
import Controller from 'controllers/dashboard_controller';

@mixin({
  navigation: 'dashboard',

  appRoutes: {
    'dashboard': 'index'
  },

  controller: new Controller()
})
export default class DashboardRouter extends BaseRouter {}
