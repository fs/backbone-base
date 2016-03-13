export default class UserHelper {
  static avatar(avatar) {
    return (avatar) ? avatar : `/images/avatar.png`;
  }
}
