var coffeeScript = require('coffee-script/register');
var requireDir = require('require-dir');

requireDir('./gulp/tasks', { recurse: true });
