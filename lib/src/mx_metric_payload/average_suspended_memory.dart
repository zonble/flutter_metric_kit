import 'package:flutter/foundation.dart';

/// Represents statistical data about memory usage when the application is suspended.
/// 
/// This class encapsulates measurements of memory consumption while the
/// application is in a suspended state (typically when backgrounded or inactive).
/// Suspended memory metrics are crucial for understanding the app's memory
/// footprint when not actively running, which affects system performance,
/// battery life, and the likelihood of the app being terminated by the system
/// due to memory pressure. These metrics help optimize memory usage to improve
/// app retention in memory and reduce cold start frequency.
@immutable
class AverageSuspendedMemory {
  /// The average memory usage while the application was suspended.
  /// 
  /// Represents the mean amount of memory consumed by the application
  /// during suspended states, typically expressed as a string value
  /// (e.g., in MB or bytes). This metric is critical for understanding
  /// the app's memory efficiency when inactive, as high suspended memory
  /// usage increases the risk of system-initiated termination due to
  /// memory pressure, leading to more cold starts and degraded user experience.
  final String? averageValue;
  
  /// The standard deviation of suspended memory usage values.
  /// 
  /// Measures the variation in memory consumption across different
  /// suspended periods. A higher standard deviation indicates inconsistent
  /// memory usage patterns, which could suggest memory leaks, inefficient
  /// cleanup, or varying background task memory requirements. Lower
  /// variation typically indicates more predictable and stable memory behavior.
  final int? standardDeviation;
  
  /// The number of suspended memory measurements used in the calculations.
  /// 
  /// Indicates how many memory usage samples were collected during
  /// suspended states to calculate the average and standard deviation.
  /// A higher sample count provides more reliable and representative
  /// statistics about the app's suspended memory behavior. This value
  /// helps assess the statistical significance of the memory measurements.
  final int? sampleCount;

  /// Creates an [AverageSuspendedMemory] instance from a JSON map.
  /// 
  /// This constructor parses the provided [map] to extract suspended memory
  /// statistics from MetricKit metric payloads.
  /// 
  /// The [map] should contain:
  /// - `averageValue`: A string representing the average suspended memory usage
  /// - `standardDeviation`: An integer representing memory usage variation
  /// - `sampleCount`: An integer representing the number of measurements taken
  /// 
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze memory efficiency during suspended
  /// states and identify opportunities for memory optimization to reduce
  /// the likelihood of system-initiated app termination.
  AverageSuspendedMemory.fromJsonMap(Map<String, dynamic> map)
      : averageValue = map["averageValue"],
        standardDeviation = map["standardDeviation"],
        sampleCount = map["sampleCount"];

  /// Converts this [AverageSuspendedMemory] instance to a JSON map.
  /// 
  /// Returns a [Map<String, dynamic>] representation that can be serialized
  /// to JSON or used for data transmission. The returned map contains:
  /// - `averageValue`: The average suspended memory usage (if available)
  /// - `standardDeviation`: The memory usage standard deviation (if available)
  /// - `sampleCount`: The number of measurements taken (if available)
  /// 
  /// This method is essential for memory monitoring and optimization workflows,
  /// enabling the transmission of suspended memory metrics to performance
  /// monitoring services, memory profiling tools, or system optimization
  /// platforms. It's particularly valuable for tracking memory efficiency
  /// trends, identifying memory leaks in suspended states, and optimizing
  /// app memory footprint to improve retention in system memory.
  /// 
  /// Suspended memory metrics are critical for reducing cold start frequency
  /// and improving overall app performance by minimizing the likelihood of
  /// system-initiated termination due to memory pressure.

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageValue'] = averageValue;
    data['standardDeviation'] = standardDeviation;
    data['sampleCount'] = sampleCount;
    return data;
  }
}
