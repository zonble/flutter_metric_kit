import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

/// Represents histogrammed metrics about application hang times and
/// frequencies.
///
/// This class encapsulates histogram data about how often and for how long the
/// application becomes unresponsive (hangs). Hang time metrics are crucial for
/// understanding app responsiveness, identifying performance bottlenecks, and
/// prioritizing optimizations to improve user experience. The histogram
/// provides a frequency distribution of hang durations, helping developers
/// analyze the severity and frequency of hang events.
@immutable
class HistogrammedAppHangTime {
  /// The number of buckets used in the app hang time histogram.
  ///
  /// Represents how many discrete time intervals or measurement buckets are
  /// used to categorize and distribute the app hang time data. More buckets
  /// provide finer granularity in understanding the distribution of hang
  /// durations, while fewer buckets offer a more aggregated view.
  final int? histogramNumBuckets;

  /// The histogram values containing app hang time measurements.
  ///
  /// Contains the actual histogram data with frequency distributions of app
  /// hang durations across different time periods. This data provides detailed
  /// insights into responsiveness issues and helps identify patterns in app
  /// hang behavior.
  ///
  /// This can be null if no histogram data is available for the collection
  /// period.
  final HistogramValue? histogramValue;

  /// Creates a [HistogrammedAppHangTime] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract app hang time
  /// histogram data from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `histogramNumBuckets`: An integer representing the number of histogram
  ///   buckets
  /// - `histogramValue`: An optional map containing histogram data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze app responsiveness and identify
  /// performance issues related to hangs.
  HistogrammedAppHangTime.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  /// Converts this [HistogrammedAppHangTime] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `histogramNumBuckets`: The number of histogram buckets (if available)
  /// - `histogramValue`: Serialized histogram data (if available)
  ///
  /// This method is essential for responsiveness monitoring and optimization
  /// workflows, enabling the transmission of hang time metrics to performance
  /// monitoring services, analytics platforms, or user experience optimization
  /// tools. It's particularly valuable for tracking hang frequency trends,
  /// identifying severe responsiveness issues, and monitoring the impact of
  /// performance optimizations on app hang behavior.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
