import 'package:analysis_lints_plugin/src/rules/avoid_for_in_flex_children.dart';
import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../flutter_stub.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(AvoidForInFlexChildrenTest);
  });
}

@reflectiveTest
class AvoidForInFlexChildrenTest extends AnalysisRuleTest {
  @override
  void setUp() {
    addFlutterStub(this);
    rule = AvoidForInFlexChildren();
    super.setUp();
  }

  void test_forInColumn() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/widgets.dart';

Widget f(List<String> xs) => Column(children: [for (final x in xs) Text(x)]);
''',
      [lint(87, 3)],
    );
  }

  void test_forInRow() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/widgets.dart';

Widget f(List<String> xs) => Row(children: [for (final x in xs) Text(x)]);
''',
      [lint(84, 3)],
    );
  }

  void test_forInsideIf() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/widgets.dart';

Widget f(List<String> xs, bool b) => Column(children: [if (b) for (final x in xs) Text(x)]);
''',
      [lint(102, 3)],
    );
  }

  void test_forInsideSpread() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/widgets.dart';

Widget f(List<String> xs) => Column(children: [...[for (final x in xs) Text(x)]]);
''',
      [lint(91, 3)],
    );
  }

  void test_nestedFor_reportsOnce() async {
    await assertDiagnostics(
      r'''
import 'package:flutter/widgets.dart';

Widget f(List<List<String>> xs) => Column(children: [for (final r in xs) for (final x in r) Text(x)]);
''',
      [lint(93, 3)],
    );
  }

  void test_buildMethod() async {
    await assertNoDiagnostics(r'''
import 'package:flutter/widgets.dart';

List<Widget> _buildItems(List<String> xs) => [for (final x in xs) Text(x)];

Widget f(List<String> xs) => Column(children: _buildItems(xs));
''');
  }

  void test_otherWidget() async {
    await assertNoDiagnostics(r'''
import 'package:flutter/widgets.dart';

Widget f(List<String> xs) => Stack(children: [for (final x in xs) Text(x)]);
''');
  }

  void test_nonFlutterColumn() async {
    await assertNoDiagnostics(r'''
class Column {
  Column({List<Object> children = const []});
}

Object f(List<String> xs) => Column(children: [for (final x in xs) x]);
''');
  }
}
