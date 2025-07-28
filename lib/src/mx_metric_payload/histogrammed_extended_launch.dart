import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

/// Represents histogrammed metrics about extended application launch times.
///
/// This class encapsulates histogram data about the duration and frequency of
/// extended launch phases, providing insights into the complete launch
/// experience beyond the initial time-to-first-draw. Extended launch metrics
/// are valuable for understanding how long it takes for the app to become fully
/// interactive, including additional initialization, data loading, or setup
/// phases. The histogram provides a frequency distribution of extended launch
/// durations, helping developers analyze launch performance and optimize the
/// user experience.
@immutable
class HistogrammedExtendedLaunch {
  /// The number of buckets used in the extended launch time histogram.
  ///
  /// Represents how many discrete time intervals or measurement buckets are
  /// used to categorize and distribute the extended launch time data. More
  /// buckets provide finer granularity in understanding the distribution of
  /// extended launch durations, while fewer buckets offer a more aggregated
  /// view.
  final int? histogramNumBuckets;

  /// The histogram values containing extended launch time measurements.
  ///
  /// Contains the actual histogram data with frequency distributions of
  /// extended launch durations across different time periods. This data
  /// provides detailed insights into the phases of app launch and helps
  /// identify performance bottlenecks during initialization.
  ///
  /// This can be null if no histogram data is available for the collection
  /// period.
  final HistogramValue? histogramValue;

  /// Creates a [HistogrammedExtendedLaunch] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract extended launch time
  /// histogram data from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `histogramNumBuckets`: An integer representing the number of histogram
  ///   buckets
  /// - `histogramValue`: An optional map containing histogram data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze the complete launch experience and
  /// identify performance issues during extended initialization phases.
  HistogrammedExtendedLaunch.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  /// Converts this [HistogrammedExtendedLaunch] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `histogramNumBuckets`: The number of histogram buckets (if available)
  /// - `histogramValue`: Serialized histogram data (if available)
  ///
  /// This method is essential for launch performance monitoring and
  /// optimization workflows, enabling the transmission of extended launch time
  /// metrics to performance monitoring services, analytics platforms, or user
  /// experience optimization tools. It's particularly valuable for tracking
  /// launch performance trends, identifying slow initialization phases, and
  /// monitoring the impact of optimizations on the complete launch experience.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
