import 'package:flutter/foundation.dart';

import 'call_stack_tree.dart';
import 'diagnostic_meta_data.dart';

/// Represents diagnostic information for application crashes.
///
/// This class encapsulates comprehensive data captured when an application
/// crash occurs, providing essential information for crash analysis and
/// debugging. Crash diagnostics include call stack traces, metadata, and other
/// contextual information that helps developers identify and resolve issues
/// that cause application termination.
@immutable
class CrashDiagnostics {
  /// The version of the crash diagnostic data format.
  /// 
  /// This field indicates the schema version used for the crash diagnostic
  /// payload, ensuring proper parsing and compatibility across different
  /// versions of MetricKit and diagnostic collection systems.
  final String? version;
  
  /// The call stack tree captured at the time of the crash.
  ///
  /// Contains hierarchical call stack information showing the execution path
  /// that led to the application crash. This is the most critical piece of
  /// information for debugging crashes as it shows exactly where the crash
  /// occurred and the sequence of function calls that led to the failure.
  ///
  /// Can be null if call stack information could not be captured, such as in
  /// cases of severe memory corruption or system-level crashes.
  final CallStackTree? callStackTree;
  
  /// Additional metadata associated with the crash diagnostic.
  ///
  /// Contains supplementary information such as crash timestamps, process
  /// information, system state, memory usage, exception details, and other
  /// contextual data that provides valuable insights into the circumstances
  /// surrounding the crash.
  ///
  /// May be null if no additional diagnostic metadata is available.
  final DiagnosticMetaData? diagnosticMetaData;

  /// Creates a [CrashDiagnostics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract crash diagnostic
  /// information from MetricKit crash reports.
  ///
  /// The [map] should contain:
  /// - `version`: An optional string indicating the diagnostic format version
  /// - `callStackTree`: An optional map containing call stack tree data
  /// - `diagnosticMetaData`: An optional map containing crash metadata
  ///
  /// This constructor is typically used when processing crash reports received
  /// from MetricKit or when deserializing stored crash data.
  CrashDiagnostics.fromJsonMap(Map<String, dynamic> map)
      : version = map["version"],
        callStackTree = map["callStackTree"] != null
            ? CallStackTree.fromJsonMap(map["callStackTree"])
            : null,
        diagnosticMetaData = map["diagnosticMetaData"] != null
            ? DiagnosticMetaData.fromJsonMap(map["diagnosticMetaData"])
            : null;

  /// Converts this [CrashDiagnostics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `version`: The diagnostic format version (if available)
  /// - `callStackTree`: Serialized call stack tree data (if available)  
  /// - `diagnosticMetaData`: Serialized crash metadata (if available)
  ///
  /// This method is crucial for crash reporting workflows, allowing the crash
  /// diagnostic data to be transmitted to crash reporting services like
  /// Crashlytics, Sentry, or custom analytics platforms. It's also used when
  /// persisting crash data locally for offline analysis or batch processing.
  ///
  /// Returns: A map containing the serialized crash diagnostic data.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['callStackTree'] = callStackTree?.toJson();
    data['diagnosticMetaData'] = diagnosticMetaData?.toJson();
    return data;
  }
}
