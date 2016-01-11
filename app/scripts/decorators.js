import 'babel-polyfill';

export function props(value) {
  return function decorator(target) {
    Object.assign(target.prototype, value);
  };
}
