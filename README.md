# Skeleton for Backbone.Marionette based application

[![Build Status](https://travis-ci.org/fs/backbone-base.svg?branch=master)](https://travis-ci.org/fs/backbone-base)
[![Dependency Status](https://david-dm.org/fs/backbone-base.svg?branch=master)](https://david-dm.org/fs/backbone-base)
[![devDependency Status](https://david-dm.org/fs/backbone-base/dev-status.svg?branch=master)](https://david-dm.org/fs/backbone-base#info=devDependencies)

This simple application includes Backbone.js/Marionette.js frameworks and node/gulp/browserify technologies.

## Dependencies:
    "autoprefixer"
    "babel-core"
    "babel-plugin-transform-decorators-legacy"
    "babel-polyfill"
    "babel-preset-es2015"
    "babelify"
    "backbone"
    "backbone-route-filter"
    "backbone-validation"
    "backbone.marionette"
    "backbone.stickit"
    "bootstrap"
    "bootstrap-paginator"
    "browser-sync"
    "browserify"
    "connect"
    "connect-history-api-fallback"
    "connect-prism"
    "del"
    "dotenv"
    "grunt"
    "gulp"
    "gulp-jade"
    "gulp-notify"
    "gulp-plumber"
    "gulp-postcss"
    "gulp-rename"
    "gulp-replace-task"
    "jadeify"
    "jquery"
    "marionette-animated-region"
    "marionette-routes-helper"
    "minifyify"
    "postcss-color-function"
    "postcss-import"
    "postcss-inline-comment"
    "postcss-mixins"
    "postcss-nested"
    "postcss-pxtorem"
    "postcss-reporter"
    "postcss-simple-vars"
    "require-dir"
    "run-sequence"
    "serve-static"
    "underscore"
    "velocity-animate"
    "vinyl-source-stream"
    "watchify"

## Dev Dependencies:
    "babel-eslint"
    "chai"
    "gulp-eslint"
    "gulp-jsonlint"
    "gulp-mocha"
    "karma"
    "karma-browserify"
    "karma-chai"
    "karma-mocha"
    "karma-phantomjs-launcher"
    "karma-sinon"
    "mocha"
    "phantomjs-prebuilt"
    "selenium-webdriver"
    "sinon"
    "stylelint"
    "stylelint-statement-max-nesting-depth"

## Install
### OSX

Install Node.js

Via brew:
```bash
brew install node
```

Via nvm:
```bash
brew install nvm
nvm install node
nvm alias default node
```

## Quick start

Clone application as new project with original repository named "backbone-base"

```bash
git clone --depth 1 git@github.com:fs/backbone-base.git
```

**Note: we use depth parameter here in order not to copy the history of changes in base project**

Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

```bash
git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
git push -u origin master
```

Run bootstrap script

```bash
bin/setup
```

## Run application

Run app (by default environment is 'development', mode is 'mock', port is 8000)

```bash
gulp
```

Run app with options

```bash
[<options>] gulp
```

```bash
NODE_ENV=development # build app with development environment
NODE_ENV=production # build app with production environment
NODE_ENV=test # build app with test environment
MODE=mock # run app with mock server
MODE=api # run app with remote API server
PORT=8000 # run server on 8000 port
```

Start to use application on browser:

```bash
localhost:8000
```

## Code linting tasks

Run javascript linter
```bash
gulp eslint
```

Run json linter
```bash
gulp jsonlint
```

Run stylesheets linter
```bash
gulp stylelint
```

## Test tasks
Run unit tests

```bash
gulp karma
```

Run e2e tests

```bash
gulp e2e
```

Run all tests and linting tools

```bash
gulp test
```

## Integrate with Rails API

Application easy integrates with [Rails base API](https://github.com/fs/rails-base-api).

**Note: you should switch off the Active Model Serializer adapter in your Rails application to avoid problems with root element**

## Credits

Backbone Base is maintained by [Marat Fakhreev](http://github.com/maratfakhreev).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/backbone-base/contributors).

[<img src="http://www.flatstack.com/logo.svg" width="100"/>](http://www.flatstack.com)
