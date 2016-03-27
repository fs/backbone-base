import selenium from 'selenium-webdriver';

export default {
  timeout: 5000,
  urlRoot: 'http://localhost:8000',
  browser() {
    const driver = new selenium.Builder()
      .withCapabilities({ browserName: 'phantomjs' })
      .build();

    driver.manage().window().maximize();

    return driver;
  }
};
