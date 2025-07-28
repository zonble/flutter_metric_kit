import 'package:flutter/foundation.dart';

import 'average_suspended_memory.dart';

/// Represents memory usage metrics as reported by MetricKit.
///
/// This class provides information about peak memory usage and average
/// suspended memory, useful for analyzing an app's memory consumption patterns.
/// Instances are typically constructed from JSON payloads received from
/// MetricKit.
@immutable
class MemoryMetrics {
  /// The peak memory usage (in bytes) recorded during the reporting interval.
  final String peakMemoryUsage;

  /// The average memory usage while the app was suspended, if available.
  final AverageSuspendedMemory? averageSuspendedMemory;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing memory metrics data.
  MemoryMetrics.fromJsonMap(Map<String, dynamic> map)
      : peakMemoryUsage = map["peakMemoryUsage"],
        averageSuspendedMemory = map["averageSuspendedMemory"] != null
            ? AverageSuspendedMemory.fromJsonMap(map["averageSuspendedMemory"])
            : null;

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['peakMemoryUsage'] = peakMemoryUsage;
    data['averageSuspendedMemory'] = averageSuspendedMemory?.toJson();
    return data;
  }
}
