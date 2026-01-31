# Analysis Lints - Claude Code Guide

## Project Overview

This is a Dart/Flutter package that provides a unified, opinionated set of analysis rules and lint configurations for Flutter and Dart projects. It's designed to enforce consistent code quality and style across multiple projects.

**Package Name:** analysis_lints
**Current Version:** 1.0.6
**Type:** Dart package (dev dependency)
**Repository:** https://github.com/SunnatilloShavkatov/analysis_lints.git

## Purpose

This package centralizes lint rules so teams can:
- Maintain consistent code style across projects
- Enforce strict code quality standards
- Update linting rules centrally for all consuming projects
- Reduce new project setup time

## Project Structure

```
analysis_lints/
├── lib/
│   └── analysis_options.yaml    # Main lint configuration file
├── example/
│   └── main.dart                # Example usage
├── pubspec.yaml                 # Package metadata
├── README.md                    # User documentation
├── CHANGELOG.md                 # Version history
└── LICENSE                      # Apache 2.0 license
```

## Key Files

### `lib/analysis_options.yaml`
The core configuration file containing:
- **Formatter settings:** 120 character page width
- **Dart Code Metrics:** Anti-patterns, complexity metrics, and custom rules
- **Analyzer configuration:** Strict inference, error levels, excluded files
- **Linter rules:** 200+ enabled lint rules for code quality

### Important Patterns
- Excludes generated files: `*.g.dart`, `*.freezed.dart`, `*.chopper.dart`, `*.config.dart`, `*.mocks.dart`
- Enforces strict type inference and raw types
- Uses comprehensive error and warning levels

## Development Guidelines

### Making Changes to Lint Rules

When modifying `lib/analysis_options.yaml`:

1. **Consider impact:** Changes affect all consuming projects
2. **Document in CHANGELOG.md:** Follow existing format
3. **Update version:** Bump version in `pubspec.yaml` according to semver
4. **Test locally:** Verify rules work in example projects
5. **Communicate changes:** Team-wide notification may be needed

### Version Numbering

Follow semantic versioning:
- **Patch (1.0.x):** Bug fixes, clarifications
- **Minor (1.x.0):** New rules added, non-breaking changes
- **Major (x.0.0):** Breaking changes, removing rules

### Code Style Preferences

Based on the lint configuration, this project enforces:
- Single quotes for strings (`prefer_single_quotes`)
- Const constructors where possible
- Final for local variables and fields
- Expression function bodies for simple functions
- Trailing commas in collections
- Package imports over relative imports
- Comprehensive type annotations on public APIs

### Excluded Rules

Notable rules NOT enforced:
- `avoid_catching_errors` - Removed in version 1.0.4
- `always_specify_types` - Uses type inference instead

## Common Tasks

### Adding a New Lint Rule

1. Read the file: `lib/analysis_options.yaml`
2. Add rule to appropriate section (analyzer.errors or linter.rules)
3. Set severity level: `error`, `warning`, or `info`
4. Update CHANGELOG.md with description
5. Bump version in pubspec.yaml
6. Test with example code

### Publishing to pub.dev

1. Ensure all tests pass
2. Update CHANGELOG.md with release notes
3. Bump version in pubspec.yaml
4. Commit changes
5. Run `dart pub publish --dry-run`
6. Run `dart pub publish`

### Testing Changes Locally

In a consuming project:
```yaml
dev_dependencies:
  analysis_lints:
    path: ../path/to/analysis_lints
```

## Dependencies

- `lints: ^6.1.0` - Base Dart lints
- `flutter_lints: ^6.0.0` - Flutter-specific lints
- Includes flutter_lints/flutter.yaml as base

## Environment Requirements

- Dart SDK: `>=3.10.0 <4.0.0`
- Flutter: `>=3.38.0`

## Worktree Information

This is a git worktree for isolated development:
- **Worktree path:** `/Users/sunnatillo/.claude-worktrees/analysis_lints/heuristic-khorana`
- **Main repository:** `/Users/sunnatillo/Projects/packages/analysis_lints`
- **Current branch:** `heuristic-khorana`
- **Main branch:** `main`

## Git Workflow

- Use conventional commits
- Create feature branches for changes
- Commit messages should reference what changed and why
- Always include Co-Authored-By when Claude assists

## Important Notes

### Do NOT modify:
- Git configuration
- LICENSE file without explicit instruction
- Package name or homepage URLs

### Always check before committing:
- Version number is updated
- CHANGELOG.md is updated
- Changes don't break existing consuming projects
- Example code still works

### Generated Files
Never edit these patterns (they're auto-generated):
- `*.g.dart` - Built value/JSON serialization
- `*.freezed.dart` - Freezed unions/data classes
- `*.chopper.dart` - API client generation
- `*.config.dart` - Configuration generation
- `*.mocks.dart` - Mockito test mocks

## Metrics and Thresholds

Current dart_code_metrics settings:
- Max methods per class: 10
- Max parameters: 4
- Max source lines of code: 50
- Max nesting level: 5
- Cyclomatic complexity: 20
- Maintainability index: 50

## Support and Contributions

This is a team package. Changes should follow the team's review process before being published. Communicate updates to all consuming projects.

## Additional Context

The package is published and ready for use at pub.dev. Version 1.0.6 is the latest stable release with updated SDK and dependencies.
