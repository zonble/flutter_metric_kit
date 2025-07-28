import 'package:flutter/foundation.dart';

/// Represents GPU usage and performance metrics for the application.
///
/// This class encapsulates cumulative measurements of GPU time consumption,
/// providing insights into graphics processing utilization, rendering
/// efficiency, and the impact of GPU operations on app performance and battery
/// life. GPU metrics are important for understanding how much time the app
/// spends on graphics processing, which can affect smoothness, responsiveness,
/// and device power consumption.
@immutable
class GpuMetrics {
  /// The cumulative GPU time consumed by the application.
  ///
  /// Represents the total amount of GPU processing time used by the application
  /// for rendering graphics, animations, and visual effects. This metric is
  /// crucial for understanding the app's graphics workload and identifying
  /// periods of high GPU usage that may impact battery life or cause
  /// performance bottlenecks. Higher GPU time indicates more intensive graphics
  /// processing, which can affect device temperature and battery consumption.
  ///
  /// The value is typically expressed as a string and may be null if no GPU
  /// time data is available for the collection period.
  final String? cumulativeGPUTime;

  /// Creates a [GpuMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract GPU performance
  /// metrics from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `cumulativeGPUTime`: A string representing total GPU time consumed
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze GPU performance patterns, identify
  /// graphics-intensive operations, and optimize rendering efficiency for
  /// better battery life and user experience.
  GpuMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeGPUTime = map["cumulativeGPUTime"];

  /// Converts this [GpuMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `cumulativeGPUTime`: Total GPU time consumed (if available)
  ///
  /// This method is essential for GPU performance monitoring and optimization
  /// workflows, enabling the transmission of GPU metrics to performance
  /// monitoring services, profiling tools, or system optimization platforms.
  /// It's particularly valuable for tracking graphics efficiency trends,
  /// identifying rendering bottlenecks, and monitoring the impact of
  /// optimizations on GPU usage.
  ///
  /// GPU metrics are critical for balancing visual quality with battery
  /// efficiency, ensuring optimal performance while maintaining good user
  /// experience and device responsiveness.
  ///
  /// Returns: A map containing the serialized GPU performance metrics data.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeGPUTime'] = cumulativeGPUTime;
    return data;
  }
}
