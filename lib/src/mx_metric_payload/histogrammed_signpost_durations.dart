import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

/// Represents a collection of signpost durations that are organized into a
/// histogram.
///
/// This class is typically used to store and analyze the distribution of
/// durations for specific signpost events, allowing for performance metrics and
/// insights.
///
/// Each instance contains the necessary data to describe the histogrammed
/// durations for a particular signpost category or event.
@immutable
class HistogrammedSignpostDurations {
  /// The number of buckets in the histogram, representing the granularity of
  /// the signpost duration distribution.
  final int? histogramNumBuckets;

  /// The histogram value object containing the actual distribution data for
  /// signpost durations.
  final HistogramValue? histogramValue;

  /// Creates an instance of [HistogrammedSignpostDurations] from a JSON map.
  ///
  /// [map] is expected to contain keys 'histogramNumBuckets' and optionally
  /// 'histogramValue'.
  HistogrammedSignpostDurations.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  /// Converts this [HistogrammedSignpostDurations] instance to a JSON map.
  ///
  /// Returns a [Map] suitable for serialization.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
