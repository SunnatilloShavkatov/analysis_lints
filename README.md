# Analysis Lints

Unified analysis rules set for Flutter and Dart projects

## Features

This package provides standardized lint and analysis rules for Flutter and Dart projects, allowing you to:

- Maintain consistent code style across multiple projects and modules
- Enforce code quality standards for your team
- Centrally manage and update linting rules for all your projects
- Reduce setup time for new projects by using a predefined ruleset

## Getting started

Add this package to your project's `dev_dependencies` in the `pubspec.yaml` file:

```yaml
dev_dependencies:
  analysis_lints: ^1.0.0  # Adjust the path as needed
```

## Usage

To use these lint rules in your project, add the following to your `analysis_options.yaml` file:

```yaml
include: package:analysis_lints/analysis_options.yaml
```

### Overriding rules

You can override specific rules in your project's `analysis_options.yaml` file:

```yaml
include: package:analysis_lints/analysis_options.yaml

linter:
  rules:
    # Override specific rules for this project
    always_specify_types: false
    prefer_relative_imports: true
```

## Customizing the rules

To customize the rules in this package, modify the `analysis_options.yaml` file in the package's `lib` directory.

## Updating rules

When you update the rules in this package, all projects that include it will receive the updated rules after getting the latest package version.

## Contributing

If you want to contribute to this package:

1. Propose rule changes through your team's standard process
2. After approval, update the rules in the package
3. Communicate changes to all team members for awareness