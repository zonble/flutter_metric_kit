import 'package:flutter/foundation.dart';

/// Represents CPU usage and performance metrics for the application.
///
/// This class encapsulates cumulative measurements of CPU consumption,
/// providing insights into processor utilization, computational efficiency, and
/// performance characteristics. CPU metrics are fundamental for understanding
/// app performance, identifying resource-intensive operations, optimizing
/// algorithms, and ensuring efficient processor usage. These metrics help
/// developers balance functionality with battery life and system
/// responsiveness.
@immutable
class CpuMetrics {
  /// The cumulative CPU time consumed by the application.
  ///
  /// Represents the total amount of processor time that the application has
  /// used across all threads and processes, typically expressed as a time
  /// duration string. This metric is crucial for understanding the app's
  /// overall computational load and identifying periods of high CPU usage that
  /// may impact battery life or system performance. Higher CPU time indicates
  /// more intensive processing, which can affect device temperature and battery
  /// consumption.
  final String? cumulativeCPUTime;
  
  /// The cumulative number of CPU instructions executed by the application.
  /// 
  /// Represents the total count of CPU instructions that have been
  /// processed during the application's execution, typically expressed
  /// as a string value. This metric provides insights into the
  /// computational complexity and efficiency of the app's algorithms.
  /// A high instruction count may indicate areas where code optimization
  /// could improve performance and reduce resource consumption.
  final String? cumulativeCPUInstructions;

  /// Creates a [CpuMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract CPU performance
  /// metrics from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `cumulativeCPUTime`: A string representing total CPU time consumed
  /// - `cumulativeCPUInstructions`: A string representing total CPU
  ///   instructions executed
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze CPU performance patterns, identify
  /// resource-intensive operations, and optimize computational efficiency for
  /// better battery life and user experience.
  CpuMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeCPUTime = map["cumulativeCPUTime"],
        cumulativeCPUInstructions = map["cumulativeCPUInstructions"];

  /// Converts this [CpuMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `cumulativeCPUTime`: Total CPU time consumed (if available)
  /// - `cumulativeCPUInstructions`: Total CPU instructions executed (if
  ///   available)
  ///
  /// This method is essential for CPU performance monitoring and optimization
  /// workflows, enabling the transmission of CPU metrics to performance
  /// monitoring services, profiling tools, or system optimization platforms.
  /// It's particularly valuable for tracking computational efficiency trends,
  /// identifying performance bottlenecks, and monitoring the impact of code
  /// optimizations on CPU usage.
  ///
  /// CPU metrics are critical for balancing app functionality with battery
  /// efficiency, ensuring optimal performance while maintaining good user
  /// experience and device responsiveness.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeCPUTime'] = cumulativeCPUTime;
    data['cumulativeCPUInstructions'] = cumulativeCPUInstructions;
    return data;
  }
}
