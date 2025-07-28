import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

/// Represents histogrammed metrics about optimized time to first draw
/// measurements.
///
/// This class encapsulates histogram data about the duration and frequency of
/// optimized time-to-first-draw events, providing insights into the
/// effectiveness of launch optimizations and the distribution of startup
/// performance. Optimized time-to-first-draw metrics are valuable for
/// understanding how quickly the app becomes visually responsive under various
/// optimization strategies. The histogram provides a frequency distribution of
/// optimized launch durations, helping developers analyze the impact of
/// performance improvements and identify remaining bottlenecks.
@immutable
class HistogrammedOptimizedTimeToFirstDrawKey {
  /// The number of buckets used in the optimized time-to-first-draw histogram.
  ///
  /// Represents how many discrete time intervals or measurement buckets are
  /// used to categorize and distribute the optimized time-to-first-draw data.
  /// More buckets provide finer granularity in understanding the distribution
  /// of optimized launch durations, while fewer buckets offer a more aggregated
  /// view.
  final int? histogramNumBuckets;

  /// The histogram values containing optimized time-to-first-draw measurements.
  ///
  /// Contains the actual histogram data with frequency distributions of
  /// optimized launch durations across different time periods. This data
  /// provides detailed insights into the effectiveness of launch optimizations
  /// and helps identify performance bottlenecks during startup.
  ///
  /// This can be null if no histogram data is available for the collection
  /// period.
  final HistogramValue? histogramValue;

  /// Creates a [HistogrammedOptimizedTimeToFirstDrawKey] instance from a JSON
  /// map.
  ///
  /// This constructor parses the provided [map] to extract optimized
  /// time-to-first-draw histogram data from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `histogramNumBuckets`: An integer representing the number of histogram
  ///   buckets
  /// - `histogramValue`: An optional map containing histogram data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze the impact of launch optimizations and
  /// identify remaining performance issues during startup.
  HistogrammedOptimizedTimeToFirstDrawKey.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  /// Converts this [HistogrammedOptimizedTimeToFirstDrawKey] instance to a JSON
  /// map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `histogramNumBuckets`: The number of histogram buckets (if available)
  /// - `histogramValue`: Serialized histogram data (if available)
  ///
  /// This method is essential for launch performance monitoring and
  /// optimization workflows, enabling the transmission of optimized
  /// time-to-first-draw metrics to performance monitoring services, analytics
  /// platforms, or user experience optimization tools. It's particularly
  /// valuable for tracking the impact of launch optimizations, identifying slow
  /// startup scenarios, and monitoring the effectiveness of performance
  /// improvements over time.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
