import $ from 'jquery';
import 'scripts/initializers/sign_up';
import 'scripts/initializers/landing';
import 'scripts/initializers/dashboard';
import 'scripts/initializers/articles';
import 'scripts/initializers/navigation';
import 'scripts/initializers/notifications';
import App from 'scripts/application';

$(() => App.start());
