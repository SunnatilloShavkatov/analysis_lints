# AGENTS.md

Guidance for AI coding agents working in this repository.

## What this repo is

`analysis_lints` is a Dart package published to pub.dev. It ships a shared
`analysis_options.yaml` (built-in lints + severities) and no Dart code.

Consumers add `analysis_lints` to `dev_dependencies` and write
`include: package:analysis_lints/analysis_options.yaml`.

## Toolchain

- Dart `>=3.13.0`, Flutter `>=3.47.0`.
- Formatter page width is 120.

## Built-in lints

Rules from the Dart linter go in `lib/analysis_options.yaml` in both
`analyzer: errors:` (severity) and `linter: rules:` (enabled), kept
alphabetical. Remove rules the SDK marks deprecated or removed.

Keep `plugins_in_inner_options: ignore` in `analyzer: errors:`.

## Releasing

1. Bump `version:` in `pubspec.yaml` and add an entry to `CHANGELOG.md`.
2. Publish from the root with `dart pub publish`.

`CLAUDE.md` and `AGENTS.md` are in `.pubignore`: they stay in git but are not
shipped to pub.dev.
