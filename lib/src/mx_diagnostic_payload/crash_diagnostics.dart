import 'package:flutter/foundation.dart';

import 'call_stack_tree.dart';
import 'diagnostic_meta_data.dart';

@immutable
class CrashDiagnostics {
  final String? version;
  final CallStackTree? callStackTree;
  final DiagnosticMetaData? diagnosticMetaData;

  CrashDiagnostics.fromJsonMap(Map<String, dynamic> map)
      : version = map["version"],
        callStackTree = map["callStackTree"] != null
            ? CallStackTree.fromJsonMap(map["callStackTree"])
            : null,
        diagnosticMetaData = map["diagnosticMetaData"] != null
            ? DiagnosticMetaData.fromJsonMap(map["diagnosticMetaData"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['callStackTree'] = callStackTree?.toJson();
    data['diagnosticMetaData'] = diagnosticMetaData?.toJson();
    return data;
  }
}
