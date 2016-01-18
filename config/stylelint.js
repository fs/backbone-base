module.exports = {
  plugins: [
    'stylelint-statement-max-nesting-depth'
  ],
  "rules": {
    "block-no-empty": true,
    "color-hex-case": "lower",
    "color-no-invalid-hex": true,
    "declaration-colon-space-after": "always",
    "declaration-colon-space-before": "never",
    "declaration-no-important": true,
    "function-comma-space-after": "always",
    "function-url-quotes": "double",
    "media-feature-colon-space-after": "always",
    "media-feature-colon-space-before": "never",
    "media-feature-name-no-vendor-prefix": true,
    "number-leading-zero": "never",
    "number-no-trailing-zeros": true,
    "property-no-vendor-prefix": true,
    "rule-no-duplicate-properties": true,
    "rule-trailing-semicolon": "always",
    "selector-list-comma-newline-after": "always-multi-line",
    "selector-no-id": true,
    "statement-max-nesting-depth": [3, { countAtRules: false }],
    "string-quotes": "double",
    "value-no-vendor-prefix": true
  }
}
