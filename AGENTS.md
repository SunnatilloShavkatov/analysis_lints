# AGENTS.md

Guidance for AI coding agents working in this repository.

## What this repo is

Two packages published to pub.dev from one repo:

| Package                 | Path                              | Purpose                                                                     |
|-------------------------|-----------------------------------|-----------------------------------------------------------------------------|
| `analysis_lints`        | `/`                               | Shared `analysis_options.yaml` (built-in lints + severities). No Dart code. |
| `analysis_lints_plugin` | `packages/analysis_lints_plugin/` | Custom code style rules as a native Dart analyzer plugin.                   |

Consumers only add `analysis_lints` to `dev_dependencies` and write
`include: package:analysis_lints/analysis_options.yaml`. The `plugins:` section
in `lib/analysis_options.yaml` makes the Dart Analysis Server download and run
`analysis_lints_plugin` in its own isolated workspace.

**Never add `analyzer` or `analysis_server_plugin` to the root `pubspec.yaml`.**
They would land in every consumer's dependency graph and clash with code
generators (`freezed`, `json_serializable`, ...). Plugin dependencies belong in
`packages/analysis_lints_plugin/pubspec.yaml` only.

## Toolchain

- Dart `>=3.13.0`, Flutter `>=3.47.0`.
- `analyzer` / `analysis_server_plugin` move in lockstep with the Dart SDK. When
  raising the SDK floor, bump them together (`analysis_server_plugin` pins an
  exact `analyzer` version; check its pubspec on pub.dev).
- Formatter page width is 120.

## Adding a custom rule

1. Create `packages/analysis_lints_plugin/lib/src/rules/<rule_name>.dart`,
   following `avoid_for_in_flex_children.dart`:
   - `class ... extends AnalysisRule` with a `static const LintCode code`
     (must be `static const`, otherwise `// ignore:` comments stop working).
   - A `_Visitor extends SimpleAstVisitor<void>`, registered in
     `registerNodeProcessors` with `registry.add<Node>(this, visitor)`.
   - Messages must say what is wrong and what to do instead: agents read them
     to fix the code.
   - Use `isFlutterWidget` from `lib/src/utils/flutter.dart` for widget checks,
     so classes with the same name from other packages are not reported.
2. Register it in `lib/main.dart` with `registry.registerLintRule(...)`.
   Lint rules are off by default.
3. Enable it in `lib/analysis_options.yaml` under
   `plugins: analysis_lints_plugin: diagnostics:` with a severity
   (`error`, `warning`, `info`, `true`/`false`).
4. Add `packages/analysis_lints_plugin/test/rules/<rule_name>_test.dart`
   (`AnalysisRuleTest` + `test_reflective_loader`). Extend
   `test/flutter_stub.dart` when the rule needs more Flutter classes.
   Cover both the reported and the allowed cases.
5. Document the rule in `packages/analysis_lints_plugin/README.md` and add
   entries to both CHANGELOGs.

`print` doesn't work inside a running plugin; test through unit tests or
`dart analyze` in `example/`.

## Verifying

```bash
cd packages/analysis_lints_plugin && dart pub get && dart analyze && dart test
cd example && flutter pub get && dart analyze
```

`example/analysis_options.yaml` points the plugin at the local path through
`plugins: dependency_overrides:`, so the example always uses the working copy.
After changing plugin code, restart the analysis server in the IDE.

## Built-in lints

Rules from the Dart linter go in `lib/analysis_options.yaml` in both
`analyzer: errors:` (severity) and `linter: rules:` (enabled), kept
alphabetical. Remove rules the SDK marks deprecated or removed.

Keep `plugins_in_inner_options: ignore` in `analyzer: errors:`. Without it,
analyzing this repo warns about the `plugins:` section, because
`lib/analysis_options.yaml` is not at the package root. Consumers are not
affected: they include the file from their own root.

## Releasing

1. Publish `analysis_lints_plugin` first (`cd packages/analysis_lints_plugin && dart pub publish`).
2. Make sure the `version:` constraint in `lib/analysis_options.yaml` accepts it.
3. Then publish `analysis_lints` from the root.

Publishing `analysis_lints` before the plugin version it references exists on
pub.dev breaks analysis for every consumer.

`CLAUDE.md` and `AGENTS.md` are in `.pubignore`: they stay in git but are not
shipped to pub.dev.

Don't add `packages/` to the root `.pubignore`. Pub applies every ignore file
from the git root down, so it would also hide the plugin's own files when
publishing `analysis_lints_plugin`. The plugin sources do end up inside the
`analysis_lints` archive; that is harmless (pub.dev only analyzes `lib/` and
`bin/`).
