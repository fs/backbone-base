import selenium from 'selenium-webdriver';

export default {
  timeout: 5000,
  urlRoot: 'http://localhost:8000',
  browser() {
    return new selenium.Builder()
      .withCapabilities({ browserName: 'phantomjs' })
      .build();
  }
};
