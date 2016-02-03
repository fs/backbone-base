import selenium from 'selenium-webdriver';
import chai from 'chai';
import setup from '../features/helpers/setup';

const expect = chai.expect;
const browser = setup.browser();

describe('Landing page', () => {
  before(() => {
    return browser.get(setup.urlRoot);
  });

  after(() => {
    return browser.quit();
  });

  it('has tab title', (done) => {
    browser.getTitle().then((title) => {
      expect(title).to.contain('Backbone base');
      done();
    });
  });

  it('has site title', (done) => {
    const el = browser.findElement(selenium.By.css('.navbar-brand'));

    el.getText().then((text) => {
      expect(text).to.contain('Backbone-base');
      done();
    });
  });

  it('logs user in', (done) => {
    browser.findElement(selenium.By.name('email')).sendKeys('test@example.com');
    browser.findElement(selenium.By.name('password')).sendKeys('123456');
    browser.findElement(selenium.By.css('#login_form_region button')).click();

    browser.findElement(selenium.By.tagName('h2')).then((el) => {
      el.getText().then((text) => {
        expect(text).to.contain('Greeting Gavin Jayson, you have next articles');
        done();
      });
    });
  });
});
