import 'package:analysis_lints_plugin/src/rules/avoid_for_in_flex_children.dart';
import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';

/// Entry point the Dart Analysis Server looks up when loading this plugin.
final plugin = AnalysisLintsPlugin();

class AnalysisLintsPlugin extends Plugin {
  @override
  String get name => 'analysis_lints_plugin';

  @override
  void register(PluginRegistry registry) {
    registry.registerLintRule(AvoidForInFlexChildren());
  }
}
