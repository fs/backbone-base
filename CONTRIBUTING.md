# Contributing

1. Fork the project.
2. Setup it on your machine with `bin/setup`.
3. Make sure the tests pass: `npm test`.
4. Make your change. Add tests for your change when necessary. Make the tests pass: `npm test`.
5. Mention your changes in "Unreleased" section of `CHANGELOG.md`
6. Push to your fork and [submit a pull request](https://help.github.com/articles/creating-a-pull-request/)
  (bonus points for topic branches).

## Releases

We strictly follow [Semantic Versioning](http://semver.org/)

1. Make sure that tests are green.
2. Update project version in package.json
3. Update the changelog with the new version and commit it with message "release <version>".
4. Tag the release by running `git tag v<version>`. Push the tag: `git push --tags`.
5. Verify that everything was pushed correctly on the Github: https://github.com/fs/backbone-base/releases
