Object.defineProperty(exports, '__esModule', {
  value: true
});
var URL_ROOT = 'http://localhost:8000';

function onError() {
  casper.capture('specs/features/screenshots/error.png');
};

exports['default'] = function () {
  casper.start(URL_ROOT + '/sign_out');
  casper.thenOpen(URL_ROOT);
  casper.on('waitFor.timeout', onError);
  casper.on('timeout', onError);
  casper.on('error', onError);
  casper.on('remote.message', function (message) {
    this.echo('Remote message caught: ' + message);
  });
};

module.exports = exports['default'];