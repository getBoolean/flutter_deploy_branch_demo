# flutter_boolean_template

An opinionated starting point for a Flutter app intended to provide the boilerplate
needed to create a large app that utilizes code generation by separating
code generation into separate packages.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/gitpod-io/template-flutter)

## Motivation

Many developers have begun to depend on packages which use code generation, and this has
resulted in large apps with code generation that can take multiple minutes. The solution is to
split the codebase into separate packages to isolate the code generation, this ensures code generation
does not run for unrelated packages. This is enabled by [melos](https://pub.dev/packages/melos) and
custom Melos scripts, however, this comes with the tradeoff that `build_runner watch` only works
for a single package at a time, it cannot be used across all packages.

I've created separate packages for [assets/](./packages/assets/), [utils/env/](./packages/utils/env/),
[features/routing/](./packages/features/routing/), [localization/](./packages/localization/)
and others to separate code generation from the main app, which speeds up code generation time.
These mentioned packages provide type-safe access to assets, `.env` variables, routes, and
localized strings.

This repository also follows [Riverpod App Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/),
I highly recommend reading the article. Each `layer` has its own folder per feature in the [packages/features/](./packages/features/) folder.

## Feature Goals

- See issue [#53](https://github.com/getBoolean/flutter_boolean_template/issues/53) for a detailed list of planned features.

## About

- Minimal OS Version:
  - iOS: 13.0
  - Android: 4.3 (SDK 18)
  - MacOS: 10.14
  - Windows 10
  - Linux: Whatever the Flutter's is

## Template: Getting Started

1. [ ] Activate [Melos](https://pub.dev/packages/melos) globally, see the [Melos](#melos)
section for setup and the configured monorepo scripts
   1. [ ] Run `melos bootstrap` to install dependencies for all packages
1. [ ] Change the package name, see [Change App/Package Name](#change-apppackage-name)
1. [ ] Change the project name using the "replace all" tool.
1. [ ] Update the description in [pubspec.yaml](pubspec.yaml) and [README.md](README.md).
1. [ ] Add needed environment variables, see the [ENVied Environment Variables](#envied-environment-variables)
section for details.
1. [ ] Change the app icon, see [Change App Icon](#change-app-icon)
1. [ ] Change the splash screen, see [Change Splash Screen](#change-the-splash-screen)
1. [ ] Setup the release build configuration, see the [Building](#building) section.
1. [ ] Setup Codecov for the repository, see the
[Codecov](https://docs.codecov.com/docs/quick-start) documentation.
1. [ ] Setup GitPod for the environment, see the
[GitPod](https://www.gitpod.io/docs/quickstart/flutter#flutter-quickstart) documentation.
1. [ ] Update contribution guidelines at the [Contributing](#contributing) section.
1. [ ] (**Important!**) Update the [LICENSE](./LICENSE.md) file. I give permission to relicense any
repository based on this template, but the licenses of the packages must still be followed.

### Change App/Package Name

1. Run the following command to change the package name, where `com.new.package.name`
is the new package name that you want for your app.

   ```bash
   flutter pub run change_app_package_name:main com.new.package.name
   ```

1. Replace all instances of `flutter_boolean_template` with your new Flutter package name.

### Change App Icon

Follow the [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) README
instructions to change the app icon.

### Change the Splash Screen

Follow the instructions in the file [flutter_native_splash.yaml](flutter_native_splash.yaml)

### Run the code generator

```bash
# Generate the code for the entire project
melos run generate

# Generate code for a specific `build_runner` package (excluding `env` and `assets`)
melos run generate:pkg
# Generate code for the `env` package
melos run env
# Generate code for the `assets` package
melos run assets

# Watch for changes in a specific package (excluding `env` and `assets`)
# Do not select "all" in the package selection prompt, it will not work
melos run watch:pkg
```

## Libraries

### Melos

This project uses [Melos](https://pub.dev/packages/melos) to manage the monorepo.

  ```bash
  flutter pub get
  # Install melos globally
  dart pub global activate melos
  # Setup local dependency overrides for packages in the monorepo
  melos bootstrap

  # Or if dart executables are not on your path
  dart pub global run melos bootstrap
  ```

The following scripts are configured:

- `melos run upgrade` - Run `pub upgrade` in all packages.
- `melos run upgrade:pkg` - Run `pub upgrade` in the selected package.
- `melos run analyze` - Run `dart analyze` in all packages.
- `melos run test` - Run all Flutter tests.
- `melos run format` - Run `dart format` in all packages.
- `melos run fix` - Run `dart fix --apply` in all packages.
- `melos run generate` - Run `build_runner build` in all packages that depend on `build_runner`.
- `melos run generate:pkg` - Run `build_runner build` for a specific package (except `envied` packages).
- `melos run watch:pkg` - Run `build_runner watch` for a specific package (except `envied` packages). It will not work if you choose "all" in the package selection prompt.
- `melos run assets` - Run `assets_gen build` in all packages that depend on `assets_gen`.
- `melos run assets:pkg` - Run `assets_gen build` for a specific package.
- `melos run env` - Run `build_runner` in all packages that depends on `envied`.
- `melos run env:pkg` - Run `build_runner` in a specific package that depends on `envied`.
- `melos run test` - Run all tests in the project.
- `melos run flutter_test` - Run all Flutter tests in the project.
- `melos run dart_test` - Run all Dart tests in the project.
- `melos run flutter_test:pkg` - Run Flutter tests for a specific package.
- `melos run dart_test:pkg` - Run Dart tests for a specific (Dart only) package.
- `melos run loc` - Run `flutter gen-l10n` in the localization package to generate
  the localized strings from the arb files.

### ENVied Environment Variables

Environment variables are setup using [ENVied](https://pub.dev/packages/envied)
in the [utils/env](packages/utils/env/) package. Environment variables need to be
defined for debug, profile, and release modes.

1. Copy the `*.env.example` files and remove the `.example` extension from them.
1. Add the values for the environment variables in the respective `.env*` file.
   - Each key must be added to each `.env*` file, unless a non null default value is added
     to the `@EnviedField` annotation.
   - It is recommended to use an empty string for the default and use `Env`'s getter to access the value.
1. Update [src/env/app_env_fields.dart](packages/utils/env/lib/src/env/app_env_fields.dart)
with the new environment variables for `AppEnvFieldsGenerated` and `AppEnvFieldsNullable`.
1. Add the new environment variables to the implementing `*Env` classes in the [src/env](packages/utils/env/src/env/) directory.
   - It must be done for *all* even if only one `.env` file is planned to be used
1. Enable `obfuscate` for API keys in the `@EnviedField` annotation. (Note: still assume it is not secure)
1. Optionally, add a `defaultValue` to the `@EnviedField` annotation for keys which are
not required in all modes.

### Mason Bricks

[Mason](https://pub.dev/packages/mason) to generate code for features
and tests using templates. To use the bricks, install the Mason VS Code extension. To create
addition bricks, use [Mason CLI](https://pub.dev/packages/mason_cli).

### Routing

AutoRoute is used, see the [routing](packages/features/routing/README.md) package README for more information.

### JSON Serialization, Unions, Sealed Classes and copyWith

- [dart_mappable](https://pub.dev/packages/dart_mappable)
  - Used for Unions, JSON serialization, and copyWith
- [modddels](https://pub.dev/packages/modddels)
  - Used for type-safe data validation, NOT serialization

### State Management

This project is preconfigured to use [Riverpod Generator](https://pub.dev/packages/riverpod_generator).
The normal riverpod syntax is still supported. See Andrea's article on
[Riverpod architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
for how to structure your code.

### Async Data Loading and Caching

This project recommends [stock](https://pub.dev/packages/stock) for loading data from both remote and
local sources. Its main goal is to prevent excessive calls to the network and disk cache. By
utilizing it, you eliminate the possibility of flooding your network with the same request
while, at the same time, adding layers of caching.

Although you can use it without a local source, the greatest benefit comes from combining Stock with a local database such as Floor, Drift, Sqflite, Realm, etc. *(excerpt from the README)*

See `stock`'s [Getting started](https://pub.dev/packages/stock#getting-started) section for usage
information.

### Leak Tracking

The package [leak_tracker](https://pub.dev/packages/leak_tracker) is used to track memory leaks.
This works automatically for instrumented Flutter classes, but requires manual instrumentation
for code outside of the Flutter framework. See the [leak_tracker README](https://pub.dev/packages/leak_tracker#instrument-your-code)
for more information.

## Testing

### Mocks

This project uses Mocktail to create mocks and fakes. Follow the instructions in the
[Mocktail README](https://pub.dev/packages/mocktail).

### Widget and Unit Tests

Tests are located in the `test` root directory and each package. To run all tests, run the following command:

```bash
melos run test
```

### Integration Tests

`patrol` provides visual feedback to the tester andtakes screenshots automatically.
These integration tests are located in the `integration_test` directory.

To run the tests, see the instructions in the [Patrol documentation](https://pub.dev/packages/patrol)

## Building

This project automatically builds for all platforms without code signing using GitHub Actions.
To build the project locally, follow the instructions in the
[Flutter docs](https://flutter.dev/docs). Only Windows, Android, and iOS build files are currently
uploaded to the CI action fragments.

Instructions for building for release are below:

### Flavors

By default, the app uses the "local" flavor. Run/build the app with `--dart-define FLAVOR=<flavorname>`
to change the flavor. The following flavors are supported:

- `local` - Local development. The text banner changes to "Debug" when in debug mode, otherwise it is "Local"
- `dev` - Development build not intended for release.
- `beta` - Beta build intended for release to testers.
- `staging` - Staging build intended for device integration testing.
- `prod` - Production build intended for release to stores.

### Build for Windows Release

1. Customize `msix_config` in [pubspec.yaml](pubspec.yaml) according to the documentation
for [msix](https://pub.dev/packages/msix) for your method of publication. The default
configuration is for CI/CD testing builds only, not releases.
1. Run the corresponding command for your method of publication

### Build for other platforms

- [Flutter Docs for Android](https://docs.flutter.dev/deployment/android).
- [Flutter Docs for iOS](https://docs.flutter.dev/deployment/ios).
- [Flutter Docs for MacOS](https://docs.flutter.dev/deployment/macos).
- [Flutter Docs for Linux](https://docs.flutter.dev/deployment/linux).
- [Flutter Docs for Web](https://docs.flutter.dev/deployment/web).

### Architecture

This project uses the [Riverpod App Architecture](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
in a feature-first manner where each feature is a separate package in the [packages/features/](./packages/features/) folder.
Each feature has its own layers, which separate the business logic from the UI.

#### Data Layer (Repositories)

The repository pattern consists of Repositories, DTOs, and Data Sources. Their jobs are the following:

1. isolate domain models (or entities) from the implementation details of the data sources in the data layer.
2. convert data transfer objects to validated entities that are understood by the domain layer
3. (optionally) perform operations such as data caching.

Repository pattern use cases:

1. talking to REST APIs
2. talking to local or remote databases (e.g. Sembast, Hive, Firestore, etc.)
3. talking to device-specific APIs (e.g. permissions, camera, location, etc.)

#### Domain Layer (Models)

Domain Models, which consist of entity and value objects. It should solve domain-related problems.

The domain models can contain logic for mutating them in an immutable manner, but they should not contain any serialization.

- Note: it is a simple data classes that doesn't have access to repositories, services, or
  other objects that belong outside the domain layer.

#### Presentation Layer (Controllers)

- holds business logic
- manage the widget state
- interact with repositories in the data layer

#### Application Layer (Service)

Implements application-specific logic by accessing the relevant repositories as needed.
The service classes are not concerned about:

- managing and updating the widget state (that's the job of the controller)
- data parsing and serialization (that's the job of the repositories)

## Contributing

1. Fork it [https://github.com/getBoolean/flutter_boolean_template/fork](https://github.com/getBoolean/flutter_boolean_template/fork)
1. Create your feature branch (git checkout -b feature/fooBar)
1. Commit your changes (git commit -am 'Add some fooBar')
1. Push to the branch (git push origin feature/fooBar)
1. Create a new Pull Request
