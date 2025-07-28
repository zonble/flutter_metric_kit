import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

/// Represents histogrammed metrics about application resume times from
/// background.
///
/// This class encapsulates histogram data about the duration and frequency of
/// app resume events, providing insights into how quickly the app becomes
/// responsive after being brought to the foreground. Resume time metrics are
/// valuable for understanding user experience when switching back to the app,
/// identifying slow resume scenarios, and optimizing background-to-foreground
/// transitions. The histogram provides a frequency distribution of resume
/// durations, helping developers analyze performance and monitor the impact of
/// optimizations.
@immutable
class HistogrammedResumeTime {
  /// The number of buckets used in the resume time histogram.
  ///
  /// Represents how many discrete time intervals or measurement buckets are
  /// used to categorize and distribute the resume time data. More buckets
  /// provide finer granularity in understanding the distribution of resume
  /// durations, while fewer buckets offer a more aggregated view.
  final int? histogramNumBuckets;

  /// The histogram values containing resume time measurements.
  ///
  /// Contains the actual histogram data with frequency distributions of resume
  /// durations across different time periods. This data provides detailed
  /// insights into app responsiveness after backgrounding and helps identify
  /// performance bottlenecks during resume.
  ///
  /// This can be null if no histogram data is available for the collection
  /// period.
  final HistogramValue? histogramValue;

  /// Creates a [HistogrammedResumeTime] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract resume time
  /// histogram data from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `histogramNumBuckets`: An integer representing the number of histogram
  ///   buckets
  /// - `histogramValue`: An optional map containing histogram data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze app resume performance and identify
  /// slow resume scenarios.
  HistogrammedResumeTime.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  /// Converts this [HistogrammedResumeTime] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `histogramNumBuckets`: The number of histogram buckets (if available)
  /// - `histogramValue`: Serialized histogram data (if available)
  ///
  /// This method is essential for resume performance monitoring and
  /// optimization workflows, enabling the transmission of resume time metrics
  /// to performance monitoring services, analytics platforms, or user
  /// experience optimization tools. It's particularly valuable for tracking
  /// resume performance trends, identifying slow resume scenarios, and
  /// monitoring the impact of optimizations on app responsiveness.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
