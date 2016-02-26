import BaseRouter from 'routers/base';
import Controller from 'controllers/dashboard_controller';
import { props } from 'decorators';

@props({
  navigation: 'dashboard',

  appRoutes: {
    'dashboard': 'index'
  },

  controller: new Controller()
})
export default class DashboardRouter extends BaseRouter {}
