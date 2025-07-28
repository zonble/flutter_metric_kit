import 'package:flutter/foundation.dart';

import 'call_stack_tree.dart';
import 'diagnostic_meta_data.dart';

/// Represents diagnostic information for application hang events.
///
/// This class encapsulates data captured when an application hang is detected,
/// providing essential information for analyzing and debugging performance
/// issues. Application hangs occur when the main thread becomes unresponsive,
/// typically due to blocking operations, deadlocks, or excessive processing on
/// the UI thread. Hang diagnostics help developers identify the root cause of
/// these responsiveness issues.
@immutable
class HangDiagnostics {
  /// The version of the hang diagnostic data format.
  ///
  /// This field indicates the schema version used for the hang diagnostic
  /// payload, ensuring proper parsing and compatibility across different
  /// versions of MetricKit and diagnostic collection systems.
  final String? version;
  
  /// The call stack tree captured during the hang event.
  ///
  /// Contains hierarchical call stack information showing what the application
  /// was doing when the hang was detected. This is crucial for identifying the
  /// specific code path or operation that caused the main thread to become
  /// unresponsive. The call stack helps pinpoint blocking operations, infinite
  /// loops, or synchronous network calls on the main thread.
  ///
  /// Can be null if call stack information could not be captured during the
  /// hang detection process.
  final CallStackTree? callStackTree;
  
  /// Additional metadata associated with the hang diagnostic.
  ///
  /// Contains supplementary information such as hang duration, timestamps,
  /// system resource usage, memory state, and other contextual data that
  /// provides insights into the system conditions during the hang event. This
  /// metadata is valuable for understanding performance patterns and
  /// environmental factors contributing to the hang.
  ///
  /// May be null if no additional diagnostic metadata is available.
  final DiagnosticMetaData? diagnosticMetaData;

  /// Creates a [HangDiagnostics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract hang diagnostic
  /// information from MetricKit hang reports.
  ///
  /// The [map] should contain:
  /// - `version`: An optional string indicating the diagnostic format version
  /// - `callStackTree`: An optional map containing call stack tree data
  /// - `diagnosticMetaData`: An optional map containing hang metadata
  ///
  /// This constructor is typically used when processing hang reports received
  /// from MetricKit or when deserializing stored hang diagnostic data for
  /// analysis and performance monitoring.
  HangDiagnostics.fromJsonMap(Map<String, dynamic> map)
      : version = map["version"],
        callStackTree = map["callStackTree"] != null
            ? CallStackTree.fromJsonMap(map["callStackTree"])
            : null,
        diagnosticMetaData = map["diagnosticMetaData"] != null
            ? DiagnosticMetaData.fromJsonMap(map["diagnosticMetaData"])
            : null;

  /// Converts this [HangDiagnostics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `version`: The diagnostic format version (if available)
  /// - `callStackTree`: Serialized call stack tree data (if available)
  /// - `diagnosticMetaData`: Serialized hang metadata (if available)
  ///
  /// This method is essential for performance monitoring workflows, allowing
  /// hang diagnostic data to be transmitted to performance monitoring services,
  /// analytics platforms, or APM (Application Performance Monitoring) tools.
  /// It's also used when persisting hang data locally for offline analysis,
  /// trend detection, or when building custom performance dashboards.
  ///
  /// Hang diagnostics are particularly valuable for identifying UI
  /// responsiveness issues and optimizing application performance.
  ///
  /// Returns: A map containing the serialized hang diagnostic data.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['callStackTree'] = callStackTree?.toJson();
    data['diagnosticMetaData'] = diagnosticMetaData?.toJson();
    return data;
  }
}
