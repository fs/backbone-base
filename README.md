# Skeleton for Backbone.Marionette based application

This simple application includes Backbone.js/Marionette.js frameworks and gulp/bower technologies.

## NPM Modules:
    "autoprefixer-stylus"
    "browser-sync"
    "browserify"
    "browserify-shim"
    "coffee-script"
    "coffeeify"
    "connect-history-api-fallback"
    "connect-prism"
    "del"
    "gulp"
    "gulp-coffeelint"
    "gulp-concat"
    "gulp-cssimport"
    "gulp-ignore"
    "gulp-install"
    "gulp-jade"
    "gulp-jsonlint"
    "gulp-notify"
    "gulp-plumber"
    "gulp-replace-task"
    "gulp-stylus"
    "jadeify"
    "jeet"
    "karma"
    "karma-browserify"
    "karma-chai"
    "karma-chrome-launcher"
    "karma-coffee-preprocessor"
    "karma-mocha"
    "karma-phantomjs-launcher"
    "karma-sinon"
    "remapify"
    "require-dir"
    "run-sequence"
    "vinyl-source-stream"
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

    git clone git@github.com:fs/backbone-base.git

Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

    git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
    git push -u origin master

Run bootstrap script

    sh bin/bootstrap

Run app

    gulp

Start to use application on browser:

    localhost:8000

## Tasks

Run tests

    gulp test

## Credits

Backbone Base is maintained by [Anton Gudkov](http://github.com/antongudkov).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/backbone-base/contributors).


[![Flatstack](https://avatars0.githubusercontent.com/u/15136?v=2&s=200)](http://www.flatstack.com)
