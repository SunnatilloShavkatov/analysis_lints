## [1.0.8] - 2027-01-31

* chore: bump version to 1.0.8 and update SDK and dependencies

## [1.0.7] - 2027-01-31

* chore: bump version to 1.0.7 and update SDK and dependencies

## [1.0.6] - 2027-01-31

* chore: bump version to 1.0.6 and update SDK and dependencies

## [1.0.5] - 2025-01-27

### Added

- **Example Package**: Added comprehensive example demonstrating package usage
  - `example/main.dart`: Basic usage example with clear instructions
  - `example/pubspec.yaml`: Proper dependency configuration
  - `example/README.md`: Detailed usage guide and documentation
  - `example/analysis_options.yaml`: Analysis rules configuration example

### Changed

- **Package Structure**: Improved package structure to meet pub.dev standards
- **Documentation**: Enhanced documentation with practical examples

## [1.0.4] - 2025-10-13

### Added

- **Linter Rules**: Added support for two new linter rules introduced in Flutter 3.9.0:
  - `switch_on_type`: Discourages the use of `runtimeType` in switch statements, promoting pattern matching instead
  - `unnecessary_unawaited`: Flags redundant uses of the `unawaited` function on expressions already marked with `@awaitNotRequired`

### Changed

- **Severity Levels**: Set the severity level for the new linter rules to `warning`

### Removed

- **Deprecated Rules**: Removed deprecated linter rules:
  - `avoid_as`: Deprecated rule, modern Dart allows type casting when necessary
  - `avoid_catches_without_on_clauses`: Overly strict rule removed for flexibility

## 1.0.3

* TODO: avoid_catching_errors lint rule removed.

## 1.0.2

* TODO: Lints and formatting.

## 1.0.1

* TODO: Describe initial release.

## 1.0.0

* TODO: Describe initial release.
