# Changelog

## Unreleased
- Ignore sourcemaps in browsersync
([#140](https://github.com/fs/backbone-base/pull/140))
- Lock Backbone version to avoid dependencies errors
- Upgrade dependencies
- Fix css hot synchronization in browser
([#139](https://github.com/fs/backbone-base/pull/139))
- Add sourcemaps
([#138](https://github.com/fs/backbone-base/pull/138))

## 1.6.0 - 2016-03-27
- Upgrade Node to 5.9.1
([#137](https://github.com/fs/backbone-base/pull/137))
- Refactor css code & make responsive nav
([#135](https://github.com/fs/backbone-base/pull/135))
- Use ES6 Promises for Backbone sync, models, collections
([#133](https://github.com/fs/backbone-base/pull/133))
- Upgrade dependencies
([#136](https://github.com/fs/backbone-base/pull/136))
- Update jsonlint task to detect environment json file errors
([#134](https://github.com/fs/backbone-base/pull/134))
- Use ES6 syntax for all configuration files
([#131](https://github.com/fs/backbone-base/pull/131))
- Add postcss sorting
([#130](https://github.com/fs/backbone-base/pull/130))
- Use relative paths in inline assets
- Move browser history logic to history service
([#129](https://github.com/fs/backbone-base/pull/129))
- Upgrade Node to 5.8.0
([#128](https://github.com/fs/backbone-base/pull/128))
- Rename facades to services
([#127](https://github.com/fs/backbone-base/pull/127))
- Remove private fields from session before saving
([#126](https://github.com/fs/backbone-base/pull/126))
- Add all linters gulp task
- Fix broken eslint and stylelint after upgrade dependencies
- Use tilde in package.json to avoid control versioning issues
([#125](https://github.com/fs/backbone-base/pull/125))

## 1.5.0 - 2016-03-02
- Upgrade Node to 5.7.0
- Upgrade dependencies
([#124](https://github.com/fs/backbone-base/pull/124))
- Use routes helper via marionette-routes-helper npm package
([#123](https://github.com/fs/backbone-base/pull/123))
- Add config dynamic method to define current environment
- Use minifyify to minify javascript code on production
([#122](https://github.com/fs/backbone-base/pull/122))
- Rename javascript and destination folders and configure application with them
- Use relative to the "scripts" folder paths for script files
([#121](https://github.com/fs/backbone-base/pull/121))
- Make minor changes in navigate logic
([#120](https://github.com/fs/backbone-base/pull/120))
- Watching images folder on updates
([#119](https://github.com/fs/backbone-base/pull/119))
- Move behaviors directory out from views
- Remove layouts directory and use components structure
([#118](https://github.com/fs/backbone-base/pull/118))
- Use Browser-sync as dev server
([#117](https://github.com/fs/backbone-base/pull/117))

## 1.4.0 - 2016-02-15
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
