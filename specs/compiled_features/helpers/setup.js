var urlRoot = 'http://localhost:8000';

function onError() {
  casper.capture('specs/features/screenshots/error.png');
};

module.exports = function () {
  casper.start(urlRoot + '/sign_out');
  casper.thenOpen(urlRoot);
  casper.on('waitFor.timeout', onError);
  casper.on('timeout', onError);
  casper.on('error', onError);
  casper.on('remote.message', function (message) {
    this.echo('Remote message caught: ' + message);
  });
};