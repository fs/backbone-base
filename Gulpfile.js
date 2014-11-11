var coffeeScript = require('coffee-script');
var requireDir = require('require-dir');
var prism = require('connect-prism');

prism.create({
  name: 'serve',
  mode: 'mock',
  context: '/api',
  host: 'localhost',
  port: 8001,
  delay: 0,
  rewrite: {}
});

requireDir('./gulp/tasks', { recurse: true });
