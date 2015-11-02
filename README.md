# Skeleton for Backbone.Marionette based application

[![Build Status](https://travis-ci.org/fs/backbone-base.svg)](https://travis-ci.org/fs/backbone-base)

This simple application includes Backbone.js/Marionette.js frameworks and node/gulp technologies.

## NPM Dependencies:
    "autoprefixer"
    "babel-core"
    "babelify"
    "backbone"
    "backbone-validation"
    "backbone.marionette"
    "backbone.routefilter"
    "backbone.stickit"
    "bootstrap"
    "browserify"
    "browserify-shim"
    "casper-chai"
    "connect"
    "connect-history-api-fallback"
    "connect-prism"
    "del"
    "dotenv"
    "gulp"
    "gulp-jade"
    "gulp-jshint"
    "gulp-jsonlint"
    "gulp-notify"
    "gulp-plumber"
    "gulp-postcss"
    "gulp-rename"
    "gulp-replace-task"
    "gulp-shell"
    "jadeify"
    "jquery"
    "karma"
    "karma-browserify"
    "karma-chai"
    "karma-chrome-launcher"
    "karma-mocha"
    "karma-phantomjs-launcher"
    "karma-sinon"
    "mocha-casperjs"
    "postcss-color-function"
    "postcss-import"
    "postcss-mixins"
    "postcss-nested"
    "postcss-pxtorem"
    "postcss-simple-vars"
    "require-dir"
    "run-sequence"
    "serve-static"
    "underscore"
    "vinyl-source-stream"
    "watchify"

## Install
### OSX

Install Node.js

```bash
brew install node
```

### Ubuntu 12.04

Install Node.js and Npm

```bash
sudo add-apt-repository ppa:richarvey/nodejs
sudo apt-get update && sudo apt-get install nodejs npm
```

Configure Npm path (for avoid _sudo_ usage for installing modules)

```bash
npm config set prefix ~/npm
echo "PATH=\$PATH:\$HOME/npm/bin" | tee -a ~/.zshrc # for zsh shell
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

## Tasks

Run unit tests

```bash
gulp karma
```

Run e2e tests

```bash
gulp e2e
```

Run all tests

```bash
gulp test
```

## Credits

Backbone Base is maintained by [Anton Gudkov](http://github.com/antongudkov).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/backbone-base/contributors).


[![Flatstack](https://avatars0.githubusercontent.com/u/15136?v=2&s=200)](http://www.flatstack.com)
