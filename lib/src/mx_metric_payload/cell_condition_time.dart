import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

/// Represents time-based metrics for cellular network condition measurements.
/// 
/// This class encapsulates histogram data about cellular network conditions
/// over time, providing insights into network quality, connectivity patterns,
/// and cellular performance characteristics. Cell condition time metrics are
/// valuable for understanding how network conditions affect app performance,
/// optimizing network usage strategies, and identifying connectivity issues
/// that may impact user experience.
@immutable
class CellConditionTime {
  /// The number of buckets used in the cellular condition time histogram.
  /// 
  /// Represents how many discrete time intervals or measurement buckets
  /// are used to categorize and distribute the cellular network condition
  /// data. More buckets provide finer granularity in understanding the
  /// distribution of network conditions over time, while fewer buckets
  /// offer a more aggregated view of cellular performance patterns.
  final int? histogramNumBuckets;
  
  /// The histogram values containing cellular condition time measurements.
  /// 
  /// Contains the actual histogram data with frequency distributions of
  /// cellular network conditions across different time periods. This data
  /// provides detailed insights into network quality patterns, connection
  /// stability, and performance characteristics that can be used to optimize
  /// network-dependent features and improve user experience under varying
  /// cellular conditions.
  /// 
  /// This can be null if no histogram data is available for the
  /// collection period.
  final HistogramValue? histogramValue;

  /// Creates a [CellConditionTime] instance from a JSON map.
  /// 
  /// This constructor parses the provided [map] to extract cellular condition
  /// time metrics from MetricKit metric payloads.
  /// 
  /// The [map] should contain:
  /// - `histogramNumBuckets`: An integer representing the number of histogram buckets
  /// - `histogramValue`: An optional map containing histogram data
  /// 
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze cellular network performance
  /// patterns and optimize network-dependent functionality based on
  /// connectivity conditions.
  CellConditionTime.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  /// Converts this [CellConditionTime] instance to a JSON map.
  /// 
  /// Returns a [Map<String, dynamic>] representation that can be serialized
  /// to JSON or used for data transmission. The returned map contains:
  /// - `histogramNumBuckets`: The number of histogram buckets (if available)
  /// - `histogramValue`: Serialized histogram data (if available)
  /// 
  /// This method is essential for cellular network monitoring and optimization
  /// workflows, enabling the transmission of cellular condition metrics to
  /// network analytics platforms, performance monitoring services, or
  /// connectivity optimization tools. It's particularly valuable for
  /// understanding network quality patterns, identifying connectivity
  /// issues, and optimizing app behavior based on cellular conditions.
  /// 
  /// Cellular condition time metrics help developers make informed decisions
  /// about network usage strategies, implement adaptive networking features,
  /// and improve user experience under varying network conditions.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
