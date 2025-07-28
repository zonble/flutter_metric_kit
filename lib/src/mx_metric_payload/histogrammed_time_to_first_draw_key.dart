import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

/// Represents histogrammed time-to-first-draw key metrics from MetricKit.
///
/// Contains the number of buckets and the histogram value for a
/// time-to-first-draw key metric.
@immutable
class HistogrammedTimeToFirstDrawKey {
  /// The number of buckets in the histogram.
  ///
  /// This value indicates how granular the histogram is for the
  /// time-to-first-draw key metric.
  final int? histogramNumBuckets;

  /// The histogram value containing the distribution data for the
  /// time-to-first-draw key.
  final HistogramValue? histogramValue;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing time-to-first-draw key
  /// histogram data.
  HistogrammedTimeToFirstDrawKey.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
