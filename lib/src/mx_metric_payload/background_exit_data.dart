import 'package:flutter/foundation.dart';

/// Represents detailed statistics about application exits that occurred while
/// in background state.
///
/// This class encapsulates comprehensive data about various types of background
/// terminations, providing insights into why and how often the application is
/// terminated by the system when running in the background. Background exit
/// data is crucial for understanding app stability, resource management
/// efficiency, and identifying areas for optimization to reduce unwanted
/// terminations that can impact user experience and app reliability.
@immutable
class BackgroundExitData {
  /// The cumulative count of exits due to application watchdog timeouts.
  ///
  /// Represents terminations caused by the system watchdog when the app fails
  /// to respond within expected time limits during background operations. High
  /// counts indicate potential issues with blocking operations or inefficient
  /// background processing that prevents timely responses to system events.
  final int? cumulativeAppWatchdogExitCount;
  
  /// The cumulative count of exits due to memory resource limit violations.
  ///
  /// Represents terminations caused by the application exceeding its allocated
  /// memory limits while in the background. This indicates memory management
  /// issues, potential memory leaks, or excessive memory usage during
  /// background operations that need optimization.
  final int? cumulativeMemoryResourceLimitExitCount;
  
  /// The cumulative count of exits due to background URL session completion
  /// timeouts.
  ///
  /// Represents terminations that occurred when background URL sessions failed
  /// to complete within allowed time limits. This suggests issues with network
  /// request management, slow network operations, or improper handling of
  /// background URL session tasks.
  final int? cumulativeBackgroundURLSessionCompletionTimeoutExitCount;
  
  /// The cumulative count of exits due to background fetch completion timeouts.
  ///
  /// Represents terminations caused by background fetch operations that failed
  /// to complete within the system-allocated time window. This indicates
  /// inefficient background fetch implementations or operations that take too
  /// long to complete.
  final int? cumulativeBackgroundFetchCompletionTimeoutExitCount;
  
  /// The cumulative count of abnormal exits during background state.
  /// 
  /// Represents unexpected terminations that don't fall into other specific
  /// categories. These exits often indicate crashes, exceptions, or other
  /// abnormal conditions that cause the application to terminate unexpectedly
  /// while in the background.
  final int? cumulativeAbnormalExitCount;
  
  /// The cumulative count of exits due to suspended state with locked file
  /// issues.
  ///
  /// Represents terminations that occurred when the application was suspended
  /// while holding file locks or having open file handles that prevented proper
  /// system resource management. This indicates improper file handling or
  /// cleanup during app suspension.
  final int? cumulativeSuspendedWithLockedFileExitCount;
  
  /// The cumulative count of exits due to illegal instruction execution.
  /// 
  /// Represents terminations caused by the application attempting to execute
  /// invalid or illegal CPU instructions while in the background. This
  /// typically indicates serious code issues, memory corruption, or
  /// architecture-specific problems.
  final int? cumulativeIllegalInstructionExitCount;
  
  /// The cumulative count of exits due to system memory pressure.
  /// 
  /// Represents terminations caused by the system reclaiming memory during
  /// low memory conditions. While somewhat normal, high counts may indicate
  /// the app is retaining too much memory in the background, making it a
  /// target for system cleanup.
  final int? cumulativeMemoryPressureExitCount;
  
  /// The cumulative count of exits due to bad memory access violations.
  /// 
  /// Represents terminations caused by the application attempting to access
  /// invalid memory locations while in the background. This indicates
  /// serious memory management issues, use-after-free errors, or buffer
  /// overflows that require immediate attention.
  final int? cumulativeBadAccessExitCount;
  
  /// The cumulative count of exits due to CPU resource limit violations.
  ///
  /// Represents terminations caused by the application exceeding its allocated
  /// CPU usage limits during background execution. High counts suggest the app
  /// is performing too much processing in the background, violating system
  /// resource constraints.
  final int? cumulativeCPUResourceLimitExitCount;
  
  /// The cumulative count of exits due to background task assertion timeouts.
  ///
  /// Represents terminations that occurred when background task assertions
  /// expired without proper completion or cleanup. This indicates improper
  /// background task management or tasks that run longer than their allocated
  /// time windows.
  final int? cumulativeBackgroundTaskAssertionTimeoutExitCount;
  
  /// The cumulative count of normal application exits while in background.
  ///
  /// Represents clean, expected terminations that occurred while the
  /// application was in the background state. These are typically
  /// user-initiated or system-managed clean shutdowns that don't indicate
  /// problems with the application.
  final int? cumulativeNormalAppExitCount;

  /// Creates a [BackgroundExitData] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract background exit
  /// statistics from MetricKit metric payloads.
  ///
  /// The [map] should contain any combination of the following exit count
  /// fields:
  /// - `cumulativeAppWatchdogExitCount`: Watchdog timeout exits
  /// - `cumulativeMemoryResourceLimitExitCount`: Memory limit violation exits
  /// - `cumulativeBackgroundURLSessionCompletionTimeoutExitCount`: URL session
  ///   timeout exits
  /// - `cumulativeBackgroundFetchCompletionTimeoutExitCount`: Background fetch
  ///   timeout exits
  /// - `cumulativeAbnormalExitCount`: Abnormal termination exits
  /// - `cumulativeSuspendedWithLockedFileExitCount`: Suspended with locked file
  ///   exits
  /// - `cumulativeIllegalInstructionExitCount`: Illegal instruction exits
  /// - `cumulativeMemoryPressureExitCount`: Memory pressure exits
  /// - `cumulativeBadAccessExitCount`: Bad memory access exits
  /// - `cumulativeCPUResourceLimitExitCount`: CPU resource limit exits
  /// - `cumulativeBackgroundTaskAssertionTimeoutExitCount`: Background task
  ///   timeout exits
  /// - `cumulativeNormalAppExitCount`: Normal application exits
  ///
  /// All fields are optional and will be null if not present in the map.
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze background termination patterns and
  /// identify stability or resource management issues.
  BackgroundExitData.fromJsonMap(Map<String, dynamic> map)
      : cumulativeAppWatchdogExitCount = map["cumulativeAppWatchdogExitCount"],
        cumulativeMemoryResourceLimitExitCount =
            map["cumulativeMemoryResourceLimitExitCount"],
        cumulativeBackgroundURLSessionCompletionTimeoutExitCount =
            map["cumulativeBackgroundURLSessionCompletionTimeoutExitCount"],
        cumulativeBackgroundFetchCompletionTimeoutExitCount =
            map["cumulativeBackgroundFetchCompletionTimeoutExitCount"],
        cumulativeAbnormalExitCount = map["cumulativeAbnormalExitCount"],
        cumulativeSuspendedWithLockedFileExitCount =
            map["cumulativeSuspendedWithLockedFileExitCount"],
        cumulativeIllegalInstructionExitCount =
            map["cumulativeIllegalInstructionExitCount"],
        cumulativeMemoryPressureExitCount =
            map["cumulativeMemoryPressureExitCount"],
        cumulativeBadAccessExitCount = map["cumulativeBadAccessExitCount"],
        cumulativeCPUResourceLimitExitCount =
            map["cumulativeCPUResourceLimitExitCount"],
        cumulativeBackgroundTaskAssertionTimeoutExitCount =
            map["cumulativeBackgroundTaskAssertionTimeoutExitCount"],
        cumulativeNormalAppExitCount = map["cumulativeNormalAppExitCount"];

  /// Converts this [BackgroundExitData] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains all
  /// available background exit count fields:
  /// - `cumulativeAppWatchdogExitCount`: Watchdog timeout exit count (if
  ///   available)
  /// - `cumulativeMemoryResourceLimitExitCount`: Memory limit exit count (if
  ///   available)
  /// - `cumulativeBackgroundURLSessionCompletionTimeoutExitCount`: URL session
  ///   timeout count (if available)
  /// - `cumulativeBackgroundFetchCompletionTimeoutExitCount`: Background fetch
  ///   timeout count (if available)
  /// - `cumulativeAbnormalExitCount`: Abnormal exit count (if available)
  /// - `cumulativeSuspendedWithLockedFileExitCount`: Suspended with locked file
  ///   count (if available)
  /// - `cumulativeIllegalInstructionExitCount`: Illegal instruction exit count
  ///   (if available)
  /// - `cumulativeMemoryPressureExitCount`: Memory pressure exit count (if
  ///   available)
  /// - `cumulativeBadAccessExitCount`: Bad access exit count (if available)
  /// - `cumulativeCPUResourceLimitExitCount`: CPU resource limit exit count (if
  ///   available)
  /// - `cumulativeBackgroundTaskAssertionTimeoutExitCount`: Background task
  ///   timeout count (if available)
  /// - `cumulativeNormalAppExitCount`: Normal exit count (if available)
  ///
  /// This method is essential for application stability monitoring and
  /// background process optimization workflows. It enables the transmission of
  /// detailed exit statistics to crash reporting services, stability monitoring
  /// platforms, or custom analytics systems. The granular exit categorization
  /// helps developers prioritize fixes based on the most common termination
  /// causes and track improvements in background stability.
  ///
  /// Understanding background exit patterns is crucial for improving app
  /// reliability, reducing unwanted terminations, and optimizing resource usage
  /// to ensure better app retention in system memory.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeAppWatchdogExitCount'] = cumulativeAppWatchdogExitCount;
    data['cumulativeMemoryResourceLimitExitCount'] =
        cumulativeMemoryResourceLimitExitCount;
    data['cumulativeBackgroundURLSessionCompletionTimeoutExitCount'] =
        cumulativeBackgroundURLSessionCompletionTimeoutExitCount;
    data['cumulativeBackgroundFetchCompletionTimeoutExitCount'] =
        cumulativeBackgroundFetchCompletionTimeoutExitCount;
    data['cumulativeAbnormalExitCount'] = cumulativeAbnormalExitCount;
    data['cumulativeSuspendedWithLockedFileExitCount'] =
        cumulativeSuspendedWithLockedFileExitCount;
    data['cumulativeIllegalInstructionExitCount'] =
        cumulativeIllegalInstructionExitCount;
    data['cumulativeMemoryPressureExitCount'] =
        cumulativeMemoryPressureExitCount;
    data['cumulativeBadAccessExitCount'] = cumulativeBadAccessExitCount;
    data['cumulativeCPUResourceLimitExitCount'] =
        cumulativeCPUResourceLimitExitCount;
    data['cumulativeBackgroundTaskAssertionTimeoutExitCount'] =
        cumulativeBackgroundTaskAssertionTimeoutExitCount;
    data['cumulativeNormalAppExitCount'] = cumulativeNormalAppExitCount;
    return data;
  }
}
