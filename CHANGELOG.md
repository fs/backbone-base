# Changelog

## Unreleased
- Upgrade dependencies
- Upgrade Node to 5.6.0
([#116](https://github.com/fs/backbone-base/pull/116))
- Make specs more human readable
([#115](https://github.com/fs/backbone-base/pull/115))
- Use application "before:start" callbacks as initializers instead of deprecated Marionette.Module
- Rewrite application start point to Marionette.Application class
- Rewrite routes helper to work without Marionette.Module
([#114](https://github.com/fs/backbone-base/pull/114))
- Use Marionette.Object as controller instead of deprecated Marionette.Controller
([#113](https://github.com/fs/backbone-base/pull/113))
- Rewrite all tests using ES6 syntax
- Use selenium as main tool for e2e tests
([#112](https://github.com/fs/backbone-base/pull/112))

## 1.3.0 - 2016-01-22
- Upgrade Node to 5.5.0
- Separate test and build tasks and load them in appropirate environment
- Upgrade dependencies and extract devDependencies
([#111](https://github.com/fs/backbone-base/pull/111))
- Update stylesheets environment. Introduce stylelint
([#110](https://github.com/fs/backbone-base/pull/110))

## 1.2.0 - 2016-01-05
- Move global dependencies as local imports in each file and remove browserify-shim
([#109](https://github.com/fs/backbone-base/pull/109))
- Upgrade dependencies
- Upgrade Node to 5.3.0
([#108](https://github.com/fs/backbone-base/pull/108))
- Use marionette-animated-region package installed via npm
([#107](https://github.com/fs/backbone-base/pull/107))
- Add ability to determine array from response for paginated collection
([#106](https://github.com/fs/backbone-base/pull/106))

## 1.1.0 - 2015-12-07
- Upgrade Node to 5.1.1
([#105](https://github.com/fs/backbone-base/pull/105))
- Use package.json browser dependencies in karma config
- Use babel-plugin-transform-decorators-legacy to resolve decorators issue
- Add jshint as dependency for gulp-jshint
- Update all dependencies to the latest stable versions
- Upgrade Babel to 6.x.x
([#99](https://github.com/fs/backbone-base/pull/99))

## 1.0.0 - 2015-11-27
- Upgrade Node to 5.1.0
