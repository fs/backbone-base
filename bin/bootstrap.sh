#!/bin/bash

if ! which bower; then
  npm install -g bower
fi

if ! which gulp; then
  npm install -g gulp
fi

if ! which grunt-cli; then
  npm install -g grunt-cli
fi

npm install
bower install
