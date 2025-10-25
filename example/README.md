# Analysis Lints Example

This example demonstrates how to use the `analysis_lints` package in your Flutter/Dart project.

## Overview

The `analysis_lints` package provides unified analysis rules for Flutter and Dart projects, ensuring consistent code quality and style across your codebase.

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dev_dependencies:
  analysis_lints:
    path: ../  # For local development
    # or
    # analysis_lints: ^1.0.4  # For published version
```

## Usage

### 1. Copy analysis rules

Copy the analysis rules to your project root:

```bash
cp ../lib/analysis_options.yaml ./analysis_options.yaml
```

### 2. Run analysis

Check your code quality:

```bash
dart analyze
```

## Features

- **Unified Rules**: Consistent analysis rules for Flutter and Dart projects
- **Code Quality**: Maintains high code quality standards
- **Easy Integration**: Simple setup process
- **Comprehensive Coverage**: Covers various aspects of code analysis

## Example Output

When you run this example, you'll see:

```
Analysis Lints Package Example
==============================

This package provides unified analysis rules for Flutter and Dart projects.
It includes comprehensive linting rules to maintain code quality and consistency.

To use this package in your project:
1. Add it to your pubspec.yaml dependencies
2. Copy the analysis_options.yaml file to your project root
3. Run "dart analyze" to check your code

Example completed successfully!
```

## Running the Example

To run this example:

```bash
cd example
flutter pub get
dart run main.dart
```

## License

This package is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.

## Contributing

Feel free to contribute to this package by submitting issues or pull requests on [GitHub](https://github.com/SunnatilloShavkatov/analysis_lints.git).
