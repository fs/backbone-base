# Skeleton for Backbone.Marionette based application

This simple application includes Backbone.js/Marionette.js frameworks and grunt/bower technologies.

## NPM Modules:
    "grunt": "~0.4.2",
    "grunt-contrib-requirejs": "~0.4.1",
    "grunt-contrib-watch": "~0.5.3",
    "grunt-contrib-coffee": "~0.7.0",
    "grunt-contrib-connect": "~0.6.0",
    "grunt-contrib-symlink": "~0.3.0",
    "grunt-contrib-clean": "~0.5.0",
    "grunt-contrib-jade": "~0.9.1",
    "grunt-contrib-stylus": "~0.12.0",
    "grunt-contrib-cssmin": "^0.8.0",
    "grunt-coffeelint": "~0.0.8",
    "grunt-connect-proxy": "~0.1.7",
    "grunt-easymock": "~0.0.4",
    "grunt-jsonlint": "~1.0.4",
    "grunt-concurrent": "~0.4.3",
    "grunt-shell": "~0.6.1",
    "grunt-notify": "~0.2.18",
    "load-grunt-config": "~0.7.1",
    "http-rewrite-middleware": "^0.1.5",
    "karma": "^0.12.0",
    "mocha": "^1.17.1",
    "karma-mocha": "^0.1.1",
    "chai": "^1.9.0",
    "karma-chai": "^0.1.0",
    "sinon": "^1.9.0",
    "karma-sinon": "^1.0.2",
    "grunt-karma": "^0.8.0",
    "karma-chrome-launcher": "^0.1.2",
    "karma-phantomjs-launcher": "^0.1.2",
    "requirejs": "^2.1.11",
    "karma-requirejs": "^0.2.1",
    "karma-coffee-preprocessor": "^0.2.0"

## Libraries:
    "jquery": "~2.0.3",
    "backbone-route-filter": "~0.1.0",
    "marionette": "~1.8.2",
    "requirejs": "~2.1.8",
    "bootstrap": "~3.1.0",
    "almond": "~0.2.9",
    "backbone.stickit": "~0.7.0",
    "backbone-validation": "~0.9.1"

## Install

Install Node.js

    brew install node

Install Grunt CLI

    npm install -g grunt-cli

Install Bower

    npm install -g bower

## Quick start

Clone application as new project with original repository named "backbone-base"

    git clone git@github.com:fs/backbone-base.git

Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

    git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
    git push -u origin master

Run bootstrap scripts

    npm install

Run app

    grunt

Start to use application on browser:

    localhost:8000

## Tasks

Build for development

    grunt development

Build for production

    grunt production

Run tests

    grunt test

## Credits

Backbone Base is maintained by [Anton Gudkov](http://github.com/antongudkov).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/backbone-base/contributors).


[![Flatstack](http://www.flatstack.com/assets/images/logo.png)](http://www.flatstack.com)
