import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';

/// Adds a minimal `package:flutter/widgets.dart` stub to [test].
///
/// Must be called in `setUp`, before `super.setUp()`.
void addFlutterStub(AnalysisRuleTest test) {
  test.newPackage('flutter').addFile('lib/widgets.dart', r'''
abstract class Widget {
  const Widget();
}

class Text extends Widget {
  const Text(String data);
}

class Flex extends Widget {
  const Flex({List<Widget> children = const []});
}

class Column extends Flex {
  const Column({super.children});
}

class Row extends Flex {
  const Row({super.children});
}

class Stack extends Widget {
  const Stack({List<Widget> children = const []});
}
''');
}
