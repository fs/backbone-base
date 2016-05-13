# Skeleton for Backbone.Marionette based application

[![Build Status](https://travis-ci.org/fs/backbone-base.svg?branch=master)](https://travis-ci.org/fs/backbone-base)
[![Dependency Status](https://david-dm.org/fs/backbone-base.svg?branch=master)](https://david-dm.org/fs/backbone-base)
[![devDependency Status](https://david-dm.org/fs/backbone-base/dev-status.svg?branch=master)](https://david-dm.org/fs/backbone-base#info=devDependencies)

This simple application includes Backbone.js/Marionette.js frameworks and ES6/Gulp/Browserify technologies.

## Dependencies

List of all dependencies is presented [here](https://github.com/fs/backbone-base/blob/master/package.json)

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
git clone git@github.com:fs/backbone-base.git --origin backbone-base [MY-NEW-PROJECT]
```

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

Run linters

```bash
gulp lint
```

Run all tests and linters

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
