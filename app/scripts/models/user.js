import AppConfig from 'scripts/config';

export default class User extends Backbone.Model {
  constructor(...args) {
    this.url = `${AppConfig.apiPath}/sign_in`;

    this.validation = {
      password: {
        required: true
      },
      email: {
        pattern: 'email',
        required: true
      }
    };

    super(...args);
  }
}
