import AppConfig from 'config';

export default class UserHelper {
  static avatar(avatar) {
    return (avatar) ? avatar : `${AppConfig.target}/images/avatar.png`;
  }
}
