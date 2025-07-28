import 'package:flutter/foundation.dart';

/// Represents detailed statistics about application exits that occurred while
/// in foreground state.
///
/// This class encapsulates data about various types of foreground terminations,
/// providing insights into why and how often the application is terminated by
/// the system or user while running in the foreground. Foreground exit data is
/// crucial for understanding app stability, crash patterns, and identifying
/// areas for optimization to reduce unwanted terminations that directly impact
/// user experience and app reliability.
@immutable
class ForegroundExitData {
  /// The cumulative count of exits due to bad memory access violations.
  ///
  /// Represents terminations caused by the application attempting to access
  /// invalid memory locations while in the foreground. This indicates serious
  /// memory management issues, use-after-free errors, or buffer overflows that
  /// require immediate attention.
  final int? cumulativeBadAccessExitCount;

  /// The cumulative count of abnormal exits during foreground state.
  ///
  /// Represents unexpected terminations that don't fall into other specific
  /// categories. These exits often indicate crashes, exceptions, or other
  /// abnormal conditions that cause the application to terminate unexpectedly
  /// while in the foreground.
  final int? cumulativeAbnormalExitCount;

  /// The cumulative count of exits due to memory resource limit violations.
  ///
  /// Represents terminations caused by the application exceeding its allocated
  /// memory limits while in the foreground. This indicates memory management
  /// issues, potential memory leaks, or excessive memory usage during active
  /// operations that need optimization.
  final int? cumulativeMemoryResourceLimitExitCount;

  /// The cumulative count of normal application exits while in foreground.
  ///
  /// Represents clean, expected terminations that occurred while the application was in the foreground
  /// state. These are typically user-initiated or system-managed clean shutdowns that don't indicate
  /// problems with the application.
  final int? cumulativeNormalAppExitCount;

  /// The cumulative count of exits due to CPU resource limit violations.
  ///
  /// Represents terminations caused by the application exceeding its allocated
  /// CPU usage limits during foreground execution. High counts suggest the app
  /// is performing too much processing in the foreground, violating system
  /// resource constraints.
  final int? cumulativeCPUResourceLimitExitCount;

  /// The cumulative count of exits due to illegal instruction execution.
  ///
  /// Represents terminations caused by the application attempting to execute
  /// invalid or illegal CPU instructions while in the foreground. This
  /// typically indicates serious code issues, memory corruption, or
  /// architecture-specific problems.
  final int? cumulativeIllegalInstructionExitCount;

  /// The cumulative count of exits due to application watchdog timeouts.
  ///
  /// Represents terminations caused by the system watchdog when the app fails
  /// to respond within expected time limits during foreground operations. High
  /// counts indicate potential issues with blocking operations or inefficient
  /// processing that prevents timely responses to system events.
  final int? cumulativeAppWatchdogExitCount;

  /// Creates a [ForegroundExitData] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract foreground exit
  /// statistics from MetricKit metric payloads.
  ///
  /// The [map] should contain any combination of the following exit count
  /// fields:
  /// - `cumulativeBadAccessExitCount`: Bad memory access exit count
  /// - `cumulativeAbnormalExitCount`: Abnormal exit count
  /// - `cumulativeMemoryResourceLimitExitCount`: Memory limit exit count
  /// - `cumulativeNormalAppExitCount`: Normal exit count
  /// - `cumulativeCPUResourceLimitExitCount`: CPU resource limit exit count
  /// - `cumulativeIllegalInstructionExitCount`: Illegal instruction exit count
  /// - `cumulativeAppWatchdogExitCount`: Watchdog timeout exit count
  ///
  /// All fields are optional and will be null if not present in the map.
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze foreground termination patterns and
  /// identify stability or resource management issues.
  ForegroundExitData.fromJsonMap(Map<String, dynamic> map)
      : cumulativeBadAccessExitCount = map["cumulativeBadAccessExitCount"],
        cumulativeAbnormalExitCount = map["cumulativeAbnormalExitCount"],
        cumulativeMemoryResourceLimitExitCount =
            map["cumulativeMemoryResourceLimitExitCount"],
        cumulativeNormalAppExitCount = map["cumulativeNormalAppExitCount"],
        cumulativeCPUResourceLimitExitCount =
            map["cumulativeCPUResourceLimitExitCount"],
        cumulativeIllegalInstructionExitCount =
            map["cumulativeIllegalInstructionExitCount"],
        cumulativeAppWatchdogExitCount = map["cumulativeAppWatchdogExitCount"];

  /// Converts this [ForegroundExitData] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains all
  /// available foreground exit count fields:
  /// - `cumulativeBadAccessExitCount`: Bad memory access exit count (if
  ///   available)
  /// - `cumulativeAbnormalExitCount`: Abnormal exit count (if available)
  /// - `cumulativeMemoryResourceLimitExitCount`: Memory limit exit count (if
  ///   available)
  /// - `cumulativeNormalAppExitCount`: Normal exit count (if available)
  /// - `cumulativeCPUResourceLimitExitCount`: CPU resource limit exit count (if
  ///   available)
  /// - `cumulativeIllegalInstructionExitCount`: Illegal instruction exit count
  ///   (if available)
  /// - `cumulativeAppWatchdogExitCount`: Watchdog timeout exit count (if
  ///   available)
  ///
  /// This method is essential for application stability monitoring and
  /// foreground process optimization workflows. It enables the transmission of
  /// detailed exit statistics to crash reporting services, stability monitoring
  /// platforms, or custom analytics systems. The granular exit categorization
  /// helps developers prioritize fixes based on the most common termination
  /// causes and track improvements in foreground stability.
  ///
  /// Understanding foreground exit patterns is crucial for improving app
  /// reliability, reducing unwanted terminations, and optimizing resource usage
  /// to ensure better user experience and app stability.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeBadAccessExitCount'] = cumulativeBadAccessExitCount;
    data['cumulativeAbnormalExitCount'] = cumulativeAbnormalExitCount;
    data['cumulativeMemoryResourceLimitExitCount'] =
        cumulativeMemoryResourceLimitExitCount;
    data['cumulativeNormalAppExitCount'] = cumulativeNormalAppExitCount;
    data['cumulativeCPUResourceLimitExitCount'] =
        cumulativeCPUResourceLimitExitCount;
    data['cumulativeIllegalInstructionExitCount'] =
        cumulativeIllegalInstructionExitCount;
    data['cumulativeAppWatchdogExitCount'] = cumulativeAppWatchdogExitCount;
    return data;
  }
}
