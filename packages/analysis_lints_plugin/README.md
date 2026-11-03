# analysis_lints_plugin

Custom code style rules for [analysis_lints](https://pub.dev/packages/analysis_lints),
delivered as a native Dart analyzer plugin. Diagnostics show up in `dart analyze`,
`flutter analyze` and the IDE like built-in lints.

## Usage

You normally don't depend on this package directly. Including the shared options
enables it:

```yaml
# analysis_options.yaml
include: package:analysis_lints/analysis_options.yaml
```

The Dart Analysis Server downloads the plugin on its own; it is not added to
your `pubspec.yaml`. Restart the analysis server after changing analysis options.

### Changing severity or disabling a rule

Restate the plugin entry in your own `analysis_options.yaml`. Your entry
replaces the included one, so list every rule you want enabled:

```yaml
include: package:analysis_lints/analysis_options.yaml

plugins:
  analysis_lints_plugin:
    version: ^1.0.0
    diagnostics:
      avoid_for_in_flex_children: warning # or false to disable
```

### Ignoring a diagnostic

```dart
// ignore: analysis_lints_plugin/avoid_for_in_flex_children
```

## Rules

### `avoid_for_in_flex_children`

Don't put a `for` element directly in the `children` of `Column`, `Row` or `Flex`.
Move the items into a `_build...()` method or a separate widget. A `for` inside
an `if` element or a spread in `children` is reported too.

```dart
// BAD
Column(children: [for (final item in items) ItemTile(item)]);

// GOOD
Column(children: _buildItems());

List<Widget> _buildItems() => [for (final item in items) ItemTile(item)];
```
