import 'package:flutter/foundation.dart';

import 'call_stack_tree.dart';
import 'diagnostic_meta_data.dart';

/// Represents diagnostic information for disk write exception events.
///
/// This class encapsulates data captured when a disk write exception occurs,
/// providing essential information for analyzing and debugging storage-related
/// issues. Disk write exceptions typically happen due to insufficient storage
/// space, file system permissions, corrupted file systems, hardware failures,
/// or attempts to write to protected locations. These diagnostics help
/// developers identify and resolve storage-related problems in their
/// applications.
@immutable
class DiskWriteExceptionDiagnostics {
  /// The version of the disk write exception diagnostic data format.
  ///
  /// This field indicates the schema version used for the diagnostic payload,
  /// ensuring proper parsing and compatibility across different versions of
  /// MetricKit and diagnostic collection systems.
  final String? version;
  
  /// The call stack tree captured when the disk write exception occurred.
  ///
  /// Contains hierarchical call stack information showing the execution path
  /// that led to the disk write exception. This is crucial for identifying the
  /// specific code location and sequence of operations that attempted the
  /// problematic disk write operation. The call stack helps pinpoint file I/O
  /// operations, database writes, cache operations, or other storage-related
  /// code that triggered the exception.
  ///
  /// Can be null if call stack information could not be captured during the
  /// exception event.
  final CallStackTree? callStackTree;
  
  /// Additional metadata associated with the disk write exception diagnostic.
  ///
  /// Contains supplementary information such as exception details, file paths,
  /// storage capacity information, file system state, error codes, and other
  /// contextual data that provides insights into the storage conditions and
  /// system state when the disk write exception occurred. This metadata is
  /// valuable for understanding storage usage patterns and diagnosing
  /// storage-related issues.
  ///
  /// May be null if no additional diagnostic metadata is available.
  final DiagnosticMetaData? diagnosticMetaData;

  /// Creates a [DiskWriteExceptionDiagnostics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract disk write exception
  /// diagnostic information from MetricKit diagnostic reports.
  ///
  /// The [map] should contain:
  /// - `version`: An optional string indicating the diagnostic format version
  /// - `callStackTree`: An optional map containing call stack tree data
  /// - `diagnosticMetaData`: An optional map containing exception metadata
  ///
  /// This constructor is typically used when processing disk write exception
  /// reports received from MetricKit or when deserializing stored diagnostic
  /// data for analysis of storage-related issues.
  DiskWriteExceptionDiagnostics.fromJsonMap(Map<String, dynamic> map)
      : version = map["version"],
        callStackTree = map["callStackTree"] != null
            ? CallStackTree.fromJsonMap(map["callStackTree"])
            : null,
        diagnosticMetaData = map["diagnosticMetaData"] != null
            ? DiagnosticMetaData.fromJsonMap(map["diagnosticMetaData"])
            : null;

  /// Converts this [DiskWriteExceptionDiagnostics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `version`: The diagnostic format version (if available)
  /// - `callStackTree`: Serialized call stack tree data (if available)
  /// - `diagnosticMetaData`: Serialized exception metadata (if available)
  ///
  /// This method is essential for storage monitoring workflows, allowing disk
  /// write exception diagnostic data to be transmitted to error tracking
  /// services, storage monitoring platforms, or infrastructure monitoring
  /// tools. It's also used when persisting exception data locally for offline
  /// analysis, storage capacity planning, or when building custom storage
  /// health dashboards.
  ///
  /// Disk write exception diagnostics are particularly valuable for identifying
  /// storage-related issues, capacity problems, and optimizing application
  /// storage usage patterns.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['callStackTree'] = callStackTree?.toJson();
    data['diagnosticMetaData'] = diagnosticMetaData?.toJson();
    return data;
  }
}
