module.exports = {
  'parser': 'babel-eslint',

  'ecmaFeatures': {
    'modules': true,
    'experimentalObjectRestSpread': true
  },

  'env': {
    'browser': false,
    'es6': true,
  },

  'rules': {
    'array-bracket-spacing': 2,
    'camelcase': [2, { 'properties': 'never' }],
    'comma-dangle': [1, 'never'],
    'comma-spacing': [2, { 'before': false, 'after': true }],
    'comma-style': [2, 'last'],
    'constructor-super': 2,
    'eol-last': 2,
    'indent': [2, 2],
    'key-spacing': [2, { 'beforeColon': false, 'afterColon': true }],
    'max-depth': [2, 4],
    'max-len': [2, 120, 4],
    'max-params': [2, 4],
    'max-statements': [2, 10],
    'no-confusing-arrow': 2,
    'no-bitwise': 2,
    'no-class-assign': 2,
    'no-const-assign': 2,
    'no-dupe-class-members': 2,
    'no-mixed-spaces-and-tabs': 2,
    'no-multiple-empty-lines': [2, { 'max': 2, 'maxEOF': 1 }],
    'no-nested-ternary': 2,
    'no-new-object': 2,
    'no-this-before-super': 2,
    'no-trailing-spaces': 2,
    'object-shorthand': [2, 'always'],
    'prefer-const': 2,
    'semi': [2, 'always']
  }
}
