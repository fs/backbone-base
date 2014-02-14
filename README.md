# Skeleton for Backbone.Marionette based application

This simple application includes Backbone.js/Marionette.js frameworks and grunt/bower technologies.

## NPM Moules:
    "grunt": "~0.4.2",
    "grunt-contrib-requirejs": "~0.4.1",
    "grunt-contrib-watch": "~0.5.3",
    "grunt-contrib-coffee": "~0.7.0",
    "grunt-contrib-connect": "~0.6.0",
    "grunt-contrib-copy": "~0.5.0",
    "grunt-contrib-symlink": "~0.3.0",
    "grunt-contrib-clean": "~0.5.0",
    "grunt-contrib-jade": "~0.9.1",
    "grunt-contrib-stylus": "~0.12.0",
    "grunt-coffeelint": "~0.0.8",
    "grunt-connect-pushstate": "~0.2.0",
    "grunt-connect-proxy": "~0.1.7",
    "grunt-easymock": "~0.0.4",
    "grunt-jsonlint": "~1.0.4",
    "grunt-mocha": "~0.4.7",
    "grunt-shell": "~0.6.1",
    "load-grunt-tasks": "~0.2.0",
    "grunt-concurrent": "~0.4.3",
    "grunt-contrib-htmlmin": "~0.2.0"

## Libraries:
    "jquery": "~2.0.3",
    "backbone-route-filter": "~0.1.0",
    "marionette": "~1.6.1",
    "requirejs": "~2.1.8",
    "bootstrap": "~3.1.0",
    "mocha": "~1.17.1",
    "chai": "~1.9.0",
    "sinon": "~1.8.1"

## Install

Install Nodejs

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
