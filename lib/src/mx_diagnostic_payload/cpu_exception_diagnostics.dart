import 'package:flutter/foundation.dart';

import 'call_stack_tree.dart';
import 'diagnostic_meta_data.dart';

/// Represents diagnostic information for CPU exception events.
///
/// This class encapsulates data captured when a CPU exception occurs, providing
/// detailed information about the exception context including call stack traces
/// and diagnostic metadata. CPU exceptions typically indicate serious runtime
/// issues such as segmentation faults, illegal instructions, or other low-level
/// system errors.
@immutable
class CpuExceptionDiagnostics {
  /// The version of the diagnostic data format.
  ///
  /// This field indicates the schema version used for the diagnostic payload,
  /// which is important for proper parsing and compatibility across different
  /// versions of MetricKit and the diagnostic system.
  final String? version;
  
  /// The call stack tree captured at the time of the CPU exception.
  ///
  /// Contains hierarchical call stack information showing the execution path
  /// that led to the CPU exception. This is crucial for debugging and
  /// understanding the root cause of the exception.
  ///
  /// Can be null if call stack information could not be captured or is not
  /// available for the specific exception type.
  final CallStackTree? callStackTree;
  
  /// Additional metadata associated with the CPU exception diagnostic.
  ///
  /// Contains supplementary information such as timestamps, process details,
  /// system state, and other contextual data that can help in diagnosing the
  /// cause and circumstances of the CPU exception.
  ///
  /// May be null if no additional diagnostic metadata is available.
  final DiagnosticMetaData? diagnosticMetaData;

  /// Creates a [CpuExceptionDiagnostics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract CPU exception
  /// diagnostic information from MetricKit diagnostic data.
  ///
  /// The [map] should contain:
  /// - `version`: An optional string indicating the diagnostic format version
  /// - `callStackTree`: An optional map containing call stack tree data
  /// - `diagnosticMetaData`: An optional map containing diagnostic metadata
  CpuExceptionDiagnostics.fromJsonMap(Map<String, dynamic> map)
      : version = map["version"],
        callStackTree = map["callStackTree"] != null
            ? CallStackTree.fromJsonMap(map["callStackTree"])
            : null,
        diagnosticMetaData = map["diagnosticMetaData"] != null
            ? DiagnosticMetaData.fromJsonMap(map["diagnosticMetaData"])
            : null;

  /// Converts this [CpuExceptionDiagnostics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `version`: The diagnostic format version (if available)
  /// - `callStackTree`: Serialized call stack tree data (if available)
  /// - `diagnosticMetaData`: Serialized diagnostic metadata (if available)
  ///
  /// This method is essential for transmitting CPU exception diagnostic data to
  /// crash reporting services, analytics platforms, or when persisting
  /// diagnostic information for later analysis and debugging.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['callStackTree'] = callStackTree?.toJson();
    data['diagnosticMetaData'] = diagnosticMetaData?.toJson();
    return data;
  }
}
