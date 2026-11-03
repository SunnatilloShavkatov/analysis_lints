import 'package:analyzer/dart/ast/ast.dart';

/// Whether [node] constructs one of the Flutter classes named in [classNames].
///
/// Matches by class name and requires the class to come from the `flutter`
/// package, so same-named classes from other packages are ignored.
bool isFlutterWidget(InstanceCreationExpression node, Set<String> classNames) {
  final element = node.constructorName.type.element;
  if (element == null || !classNames.contains(element.name)) return false;

  return element.library?.uri.toString().startsWith('package:flutter/') ?? false;
}
