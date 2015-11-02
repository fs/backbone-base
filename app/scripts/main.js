import 'polyfill';
import 'backbone-routefilter';
import 'backbone-stickit';
import 'backbone-validation';
import 'marionette';
import 'bootstrap';
import 'scripts/modules/sign_up';
import 'scripts/modules/landing';
import 'scripts/modules/dashboard';
import 'scripts/modules/articles';
import 'scripts/modules/navigation';
import 'scripts/modules/notifications';
import App from 'scripts/application';

$(() => { App.start(); });
