import App from 'scripts/application';

export default class UserHelper {
  static avatar(avatar) {
    return (avatar) ? avatar : `${App.origin}/images/avatar.png`;
  }
}
