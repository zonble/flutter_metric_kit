import 'package:flutter/foundation.dart';

import '../payload.dart';
import 'cpu_exception_diagnostics.dart';
import 'crash_diagnostics.dart';
import 'disk_write_exception_diagnostics.dart';
import 'hang_diagnostics.dart';

/// Represents a comprehensive diagnostic payload from MetricKit.
///
/// This class serves as the main container for all types of diagnostic
/// information collected by MetricKit over a specific time period. It
/// aggregates various diagnostic events including crashes, hangs, CPU
/// exceptions, and disk write exceptions, providing a complete picture of
/// application health and performance issues.
///
/// The diagnostic payload is typically delivered periodically by the system and
/// contains all diagnostic events that occurred within the specified time
/// window, making it essential for comprehensive application monitoring and
/// debugging.
@immutable
class MXDiagnosticPayload implements Payload {
  /// A list of crash diagnostic events that occurred during the collection
  /// period.
  ///
  /// Each [CrashDiagnostics] instance represents a separate crash event with
  /// its associated call stack, metadata, and contextual information. Crashes
  /// are the most critical diagnostic events as they represent complete
  /// application failures that resulted in termination.
  ///
  /// This list can be null if no crashes occurred during the collection period.
  final List<CrashDiagnostics>? crashDiagnostics;
  
  /// The end timestamp of the diagnostic collection period.
  ///
  /// Represents the time when the diagnostic collection period ended, typically
  /// in ISO 8601 format. This timestamp, along with [timeStampBegin], defines
  /// the time window during which all diagnostic events in this payload were
  /// collected.
  final String? timeStampEnd;
  
  /// A list of hang diagnostic events that occurred during the collection
  /// period.
  ///
  /// Each [HangDiagnostics] instance represents a detected application hang
  /// where the main thread became unresponsive. Hangs are critical for
  /// understanding user experience issues as they directly impact application
  /// responsiveness and perceived performance.
  ///
  /// This list can be null if no hangs were detected during the collection
  /// period.
  final List<HangDiagnostics>? hangDiagnostics;
  
  /// A list of CPU exception diagnostic events that occurred during the collection period.
  /// 
  /// Each [CpuExceptionDiagnostics] instance represents a CPU-level exception
  /// such as segmentation faults, illegal instructions, or other low-level
  /// system errors. These exceptions often indicate serious runtime issues
  /// that may lead to crashes or undefined behavior.
  /// 
  /// This list can be null if no CPU exceptions occurred during the collection period.
  final List<CpuExceptionDiagnostics>? cpuExceptionDiagnostics;
  
  /// The beginning timestamp of the diagnostic collection period.
  ///
  /// Represents the time when the diagnostic collection period began, typically
  /// in ISO 8601 format. This timestamp, along with [timeStampEnd], defines the
  /// time window during which all diagnostic events in this payload were
  /// collected.
  final String? timeStampBegin;
  
  /// A list of disk write exception diagnostic events that occurred during the
  /// collection period.
  ///
  /// Each [DiskWriteExceptionDiagnostics] instance represents a storage-related
  /// exception that occurred during disk write operations. These exceptions can
  /// indicate storage capacity issues, file system problems, permission errors,
  /// or hardware failures affecting storage operations.
  ///
  /// This list can be null if no disk write exceptions occurred during the
  /// collection period.
  final List<DiskWriteExceptionDiagnostics>? diskWriteExceptionDiagnostics;

  /// Creates an [MXDiagnosticPayload] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract comprehensive
  /// diagnostic information from MetricKit diagnostic payloads.
  ///
  /// The [map] should contain any combination of the following fields:
  /// - `crashDiagnostics`: An optional list of crash diagnostic data
  /// - `timeStampEnd`: An optional end timestamp string
  /// - `hangDiagnostics`: An optional list of hang diagnostic data
  /// - `cpuExceptionDiagnostics`: An optional list of CPU exception data
  /// - `timeStampBegin`: An optional beginning timestamp string
  /// - `diskWriteExceptionDiagnostics`: An optional list of disk write
  ///   exception data
  ///
  /// This constructor is the primary method for deserializing diagnostic
  /// payloads received from MetricKit, enabling the processing and analysis of
  /// comprehensive application health data.
  MXDiagnosticPayload.fromJsonMap(Map<String, dynamic> map)
      : crashDiagnostics = map["crashDiagnostics"] != null
            ? List<CrashDiagnostics>.from(map["crashDiagnostics"]
                .map((it) => CrashDiagnostics.fromJsonMap(it)))
            : null,
        timeStampEnd = map["timeStampEnd"],
        hangDiagnostics = map["hangDiagnostics"] != null
            ? List<HangDiagnostics>.from(map["hangDiagnostics"]
                .map((it) => HangDiagnostics.fromJsonMap(it)))
            : null,
        cpuExceptionDiagnostics = map["cpuExceptionDiagnostics"] != null
            ? List<CpuExceptionDiagnostics>.from(map["cpuExceptionDiagnostics"]
                .map((it) => CpuExceptionDiagnostics.fromJsonMap(it)))
            : null,
        timeStampBegin = map["timeStampBegin"],
        diskWriteExceptionDiagnostics = map["diskWriteExceptionDiagnostics"] !=
                null
            ? List<DiskWriteExceptionDiagnostics>.from(
                map["diskWriteExceptionDiagnostics"]
                    .map((it) => DiskWriteExceptionDiagnostics.fromJsonMap(it)))
            : null;

  /// Converts this [MXDiagnosticPayload] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains all
  /// available diagnostic data:
  /// - `crashDiagnostics`: List of serialized crash diagnostic data (if
  ///   available)
  /// - `timeStampEnd`: End timestamp string (if available)
  /// - `hangDiagnostics`: List of serialized hang diagnostic data (if
  ///   available)
  /// - `cpuExceptionDiagnostics`: List of serialized CPU exception data (if
  ///   available)
  /// - `timeStampBegin`: Beginning timestamp string (if available)
  /// - `diskWriteExceptionDiagnostics`: List of serialized disk write exception
  ///   data (if available)
  ///
  /// This method is essential for comprehensive application monitoring
  /// workflows, enabling the transmission of complete diagnostic payloads to
  /// monitoring services, crash reporting platforms, analytics systems, or APM
  /// tools. It's also used when persisting diagnostic data locally for offline
  /// analysis, trend detection, or when building custom application health
  /// dashboards.
  ///
  /// The comprehensive nature of this payload makes it invaluable for
  /// understanding overall application health, identifying patterns across
  /// different types of diagnostic events, and prioritizing fixes based on the
  /// frequency and severity of various issues.
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['crashDiagnostics'] =
        crashDiagnostics?.map((v) => v.toJson()).toList();
    data['timeStampEnd'] = timeStampEnd;
    data['hangDiagnostics'] = hangDiagnostics?.map((v) => v.toJson()).toList();
    data['cpuExceptionDiagnostics'] =
        cpuExceptionDiagnostics?.map((v) => v.toJson()).toList();
    data['timeStampBegin'] = timeStampBegin;
    data['diskWriteExceptionDiagnostics'] =
        diskWriteExceptionDiagnostics?.map((v) => v.toJson()).toList();
    return data;
  }
}
