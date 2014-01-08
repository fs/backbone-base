# Skeleton for Backbone.Marionette based application

This simple application includes Backbone.js/Marionette.js freamworks and grunt/bower . 

## NPM Moules:
    grunt: 0.4.2
    grunt-contrib-requirejs: 0.4.1
    grunt-contrib-watch: 0.5.3
    grunt-contrib-coffee: 0.7.0
    grunt-contrib-compass: 0.7.0
    grunt-contrib-connect: 0.5.0
    grunt-contrib-copy: 0.4.1
    grunt-contrib-clean: 0.5.0
    grunt-contrib-imagemin: 0.4.0
    grunt-contrib-jst: 0.5.1
    grunt-remove-logging: 0.2.0
    grunt-coffeelint: 0.0.8
    mocha: 1.13.0
    load-grunt-tasks: 0.2.0

## Libraries:
    jquery: 2.0.3
    marionette: 1.4.1
    requirejs: 2.1.8
    backbone: 1.1.0
    backbone-relational: 0.8.6
    sass-bootstrap: 3.0.0

## Quick start

Clone application as new project with original repository named "backbone-base"

    git clone git@github.com:fs/backbone-base.git

Create your new repo on GitHub and push master into it.
Make sure master branch is tracking origin repo.

    git remote add origin git@github.com:[MY-GITHUB-ACCOUNT]/[MY-NEW-PROJECT].git
    git push -u origin master

Run bootstrap scripts

    npm install
    bower install

Run app

    grunt
