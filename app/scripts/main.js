import 'babel-polyfill';
import 'backbone-routefilter';
import 'backbone-stickit';
import 'backbone-validation';
import 'marionette';
import 'marionette-animated-region';
import 'bootstrap';
import 'bootstrap-paginator';
import 'velocity-ui';
import 'scripts/modules/sign_up';
import 'scripts/modules/landing';
import 'scripts/modules/dashboard';
import 'scripts/modules/articles';
import 'scripts/modules/navigation';
import 'scripts/modules/notifications';
import App from 'scripts/application';

$(() => { App.start(); });
