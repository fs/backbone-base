# Skeleton for Backbone.Marionette based application

This simple application includes Backbone.js/Marionette.js frameworks and gulp/bower technologies.

## NPM Dependencies:
    "autoprefixer-stylus"
    "jeet"

## NPM Dev dependencies:
    "babelify"
    "browser-sync"
    "browserify"
    "browserify-shim"
    "casper-chai"
    "connect-history-api-fallback"
    "connect-prism"
    "del"
    "gulp"
    "gulp-cssimport"
    "gulp-install"
    "gulp-jade"
    "gulp-jshint"
    "gulp-jsonlint"
    "gulp-notify"
    "gulp-plumber"
    "gulp-rename"
    "gulp-replace-task"
    "gulp-shell"
    "gulp-stylus"
    "jadeify"
    "karma"
    "karma-browserify"
    "karma-chai"
    "karma-chrome-launcher"
    "karma-mocha"
    "karma-phantomjs-launcher"
    "karma-sinon"
    "mocha-casperjs"
    "require-dir"
    "run-sequence"
    "vinyl-transform"
    "watchify"

## Bower components:
    "jquery"
    "underscore"
    "backbone"
    "backbone-route-filter"
    "backbone.stickit"
    "backbone-validation"
    "marionette"
    "bootstrap"

## Install
### OSX

Install Node.js

    brew install node

### Ubuntu 12.04

Install Node.js and Npm

    sudo add-apt-repository ppa:richarvey/nodejs
    sudo apt-get update && sudo apt-get install nodejs npm

Configure Npm path (for avoid _sudo_ usage for installing modules)

    npm config set prefix ~/npm
    echo "PATH=\$PATH:\$HOME/npm/bin" | tee -a ~/.zshrc # for zsh shell

## Quick start

Clone application as new project with original repository named "backbone-base"

    git clone --depth 1 git@github.com:fs/backbone-base.git

**Note: we use depth parameter here in order not to copy the history of changes in base project**

Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

    git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
    git push -u origin master

Run bootstrap script

    bin/setup

Run app

    gulp

Start to use application on browser:

    localhost:8000

## Tasks

Run unit tests

    gulp karma

Run e2e tests

    gulp e2e

Run all tests

    gulp test

## Credits

Backbone Base is maintained by [Anton Gudkov](http://github.com/antongudkov).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/backbone-base/contributors).


[![Flatstack](https://avatars0.githubusercontent.com/u/15136?v=2&s=200)](http://www.flatstack.com)
