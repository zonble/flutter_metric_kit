
import 'package:flutter/foundation.dart';

/// Represents disk I/O performance metrics for the application.
///
/// This class encapsulates cumulative measurements of logical disk writes,
/// providing insights into storage usage, file system activity, and the impact
/// of disk operations on app performance and device longevity. Disk I/O metrics
/// are important for understanding how much data the app writes to persistent
/// storage, which can affect battery life, storage wear, and overall system
/// performance.
@immutable
class DiskIOMetrics {
  /// The cumulative number of logical disk writes performed by the application.
  ///
  /// Represents the total count of logical write operations to persistent
  /// storage (such as files, databases, or caches) performed by the app. This
  /// metric is crucial for understanding storage usage patterns, identifying
  /// write-intensive operations, and optimizing file system activity to improve
  /// battery efficiency and reduce storage wear.
  ///
  /// The value is typically expressed as a string and may be null if no disk
  /// write data is available for the collection period.
  final String? cumulativeLogicalWrites;

  /// Creates a [DiskIOMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract disk I/O metrics
  /// from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `cumulativeLogicalWrites`: A string representing the total logical
  ///   writes
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze storage usage patterns and optimize
  /// disk operations for better performance and device longevity.
  DiskIOMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeLogicalWrites = map["cumulativeLogicalWrites"];

  /// Converts this [DiskIOMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `cumulativeLogicalWrites`: Total logical writes (if available)
  ///
  /// This method is essential for disk I/O monitoring and optimization
  /// workflows, enabling the transmission of disk metrics to performance
  /// monitoring services, storage analytics platforms, or system optimization
  /// tools. It's particularly valuable for tracking storage usage trends,
  /// identifying write-intensive features, and monitoring the impact of
  /// optimizations on disk activity.
  ///
  /// Disk I/O metrics help developers balance storage usage with battery
  /// efficiency and device health, ensuring optimal performance and longevity
  /// for both the app and the device.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeLogicalWrites'] = cumulativeLogicalWrites;
    return data;
  }
}
