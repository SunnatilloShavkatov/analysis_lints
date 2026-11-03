import 'package:analysis_lints_plugin/src/utils/flutter.dart';
import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart';

/// Reports a `for` collection element used directly in the `children` of a
/// Flutter `Column`, `Row` or `Flex`.
///
/// BAD:
/// ```dart
/// Column(children: [for (final item in items) ItemTile(item)]);
/// ```
///
/// GOOD:
/// ```dart
/// Column(children: _buildItems());
/// ```
class AvoidForInFlexChildren extends AnalysisRule {
  static const LintCode code = LintCode(
    'avoid_for_in_flex_children',
    "Don't use a 'for' element directly inside the children of a Column, Row or Flex.",
    correctionMessage: "Try moving the items into a '_build...()' method or a separate widget.",
  );

  AvoidForInFlexChildren()
    : super(
        name: 'avoid_for_in_flex_children',
        description: "Avoid 'for' elements directly inside Column/Row/Flex children.",
      );

  @override
  LintCode get diagnosticCode => code;

  @override
  void registerNodeProcessors(RuleVisitorRegistry registry, RuleContext context) {
    registry.addForElement(this, _Visitor(this));
  }
}

class _Visitor extends SimpleAstVisitor<void> {
  _Visitor(this.rule);

  final AnalysisRule rule;

  static const _flexWidgets = {'Column', 'Row', 'Flex'};

  @override
  void visitForElement(ForElement node) {
    final children = _enclosingChildrenArgument(node);
    if (children == null) return;

    final creation = children.parent?.parent;
    if (creation is! InstanceCreationExpression) return;
    if (!isFlutterWidget(creation, _flexWidgets)) return;

    rule.reportAtToken(node.forKeyword);
  }

  /// Walks up from [node] through `if` elements and spreads to the `children:`
  /// argument it belongs to, or returns `null` if it isn't inside one.
  ///
  /// Stops at an enclosing `for` element, so nested loops report only once.
  NamedArgument? _enclosingChildrenArgument(ForElement node) {
    AstNode? current = node.parent;
    while (current != null) {
      switch (current) {
        case NamedArgument(:final name) when name.lexeme == 'children':
          return current;
        case IfElement() || SpreadElement() || ListLiteral():
          current = current.parent;
        default:
          return null;
      }
    }
    return null;
  }
}
