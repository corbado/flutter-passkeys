<img width="1070" alt="GitHub Repo Cover" src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/.github/images/root_headline.png">

# Contribute to Passkeys

## 1. Forking & cloning the repository

- Fork `https://github.com/corbado/passkeys` into your own GitHub account. If
  you already have a fork, and are now installing a development environment on
  a new machine, make sure you've updated your fork so that you don't use stale
  configuration options from long ago.
- If you haven't configured your machine with an SSH key that's known to github, then
  follow [GitHub's directions](https://help.github.com/articles/generating-ssh-keys/)
  to generate an SSH key.
- `git clone git@github.com:<your_name_here>/flutter-passkeys.git`
- `git remote add upstream git@github.com:corbado/flutter-passkeys.git` (So that you
  fetch from the main repository, not your clone, when running `git fetch`
  et al.)

## 2. Environment Setup

passkeys uses [Melos](https://github.com/invertase/melos) to manage the project and dependencies.

To install Melos, run the following command from your SSH client:

```bash
dart pub global activate melos
```

Next, at the root of your locally cloned repository bootstrap the projects dependencies:

```bash
melos bootstrap
```

The bootstrap command locally links all dependencies within the project without having to
provide manual [`dependency_overrides`](https://dart.dev/tools/pub/pubspec). This allows all
plugins, examples and tests to build from the local clone project.

> You do not need to run `flutter pub get` once bootstrap has been completed.

> If you're using [fvm](https://fvm.app/) you might need to specify the sdk-path: `melos bs --sdk-path=/Users/user/fvm/default/`


## 4. Making Changes

### Making Changes to native code (passkeys_android, passkeys_ios)

If you're making changes to native code, you'll need to run the following command to regenerate the platform channels using [pigeon](https://github.com/flutter/packages/tree/main/packages/pigeon)

```bash
  cd packages/passkeys/passkeys_android
  dart run pigeon --input pigeons/messages.dart 
```

It works the same for passkeys_ios

```bash
  cd packages/passkeys/passkeys_ios
  dart run pigeon --input pigeons/messages.dart 
```

### Making Changes to the Web Javascript Code

If you're making changes to the web package, you'll need to run the following command to build the javascript code and import it in to the example

```bash
  melos build-passkeys-web-javascript
```

## 5. Running the Example

To run the example, we can use the following commands: 

**For web:**

```bash
  melos run example-passkeys-web
```

**For native:**

```bash
  melos run example-passkeys-native
```

Using Melos (installed in step 3), any changes made to the plugins locally will also be reflected within all
example applications code automatically.

## 6. Contributing Code

We use GitHub pull requests for contributions. Before starting, please:
- Review the [Flutter style guide](https://github.com/flutter/flutter/blob/master/docs/contributing/Style-guide-for-Flutter-repo.md).
- Check open [issues](https://github.com/corbado/flutter-passkeys/issues) and existing [pull requests](https://github.com/corbado/flutter-passkeys/pulls) to avoid duplicating work.

To start working on a patch:

1. `git fetch upstream`
2. `git checkout upstream/main -b <name_of_your_branch>`
3. Hack away!

Once you have made your changes, ensure that it passes the internal analyzer & formatting checks. The following
commands can be run locally to highlight any issues before committing your code:
    
```bash
  melos run format:check
  melos run analyze
```

Assuming all is successful, commit and push your code:

1. `git commit -a -m "<your informative commit message>"`
2. `git push origin <name_of_your_branch>`

To send us a pull request:

- `git pull-request` (if you are using [Hub](http://github.com/github/hub/)) or
  go to `https://github.com/corbado/flutter-passkeys` and click the
  "Compare & pull request" button

Please make sure all your check-ins have detailed commit messages explaining the patch.

When naming the title of your pull request, please follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.4/)
guide. For example, for a fix to the passkeys android package:

`fix(passkeys_android): fixed a bug!`

### Getting Merged

Once your PR is open:
- Ensure all checks and CI pipelines pass (GitHub Actions, etc.).
- Wait for code reviews from maintainers.
- Address any feedback, push changes, and keep your PR updated.


## 7. Release Process (For Maintainers)
This project uses Melos to handle versioning and publishing. Once changes in main are ready to release:

1. Pull the latest main branch locally.
2. For the changed packages, update the version in the `pubspec.yaml` file. The version should follow the [Semantic Versioning](https://semver.org/) guidelines.
3. Update the `CHANGELOG.md` file with the new version and a list of changes. The changes should be grouped by package and follow the format of the previous entries.
4. Dry run publish:
  ```bash
    melos publish
   ```
5. If everything looks good, publish:
  ```bash
    melos publish --no-dry-run
  ```

## 8. Contributing Documentation
If you’d like to improve or add documentation:

- Make the changes in the relevant markdown or Dart doc comments.
- Follow the same process above for creating a branch, committing, and opening a PR.
- If you have any doc-specific questions, open an issue or discussion.

---
Thank you for investing your time in contributing to Passkeys! We value all community contributions. 🚀
