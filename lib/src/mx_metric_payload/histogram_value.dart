
import 'package:flutter/foundation.dart';

/// Represents a histogram of metric values, with each bucket containing a value
/// range and count.
///
/// This class encapsulates a set of histogram buckets, each represented by a
/// [HistogramValueItem], providing a frequency distribution of metric values
/// (such as time, memory, or network conditions). Histogram metrics are
/// valuable for understanding the distribution and spread of performance data,
/// identifying outliers, and analyzing patterns in collected metrics.
@immutable
class HistogramValue {
  /// The map of histogram buckets, keyed by a string (typically the bucket
  /// start or label).
  ///
  /// Each entry contains a [HistogramValueItem] describing the range and count
  /// for that bucket. The map provides a complete frequency distribution for
  /// the metric being measured.
  final Map<String, HistogramValueItem> values;

  /// Creates a [HistogramValue] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract histogram bucket
  /// data from MetricKit metric payloads.
  ///
  /// The [map] should contain key-value pairs where each key is a bucket label
  /// and each value is a map representing a [HistogramValueItem].
  HistogramValue.fromJsonMap(Map<String, dynamic> map)
      : values = map.map((key, value) =>
            MapEntry(key, HistogramValueItem.fromJsonMap(value)));

  /// Converts this [HistogramValue] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. Each entry contains the serialized
  /// [HistogramValueItem] for that bucket.
  ///
  /// Returns: A map containing all histogram bucket data.
  Map<String, dynamic> toJson() {
    return values.map((key, value) => MapEntry(key, value.toJson()));
  }
}


@immutable
class HistogramValueItem {
  /// The end value of the histogram bucket range (exclusive or inclusive
  /// depending on context).
  ///
  /// This string represents the upper bound of the bucket's value range.
  final String bucketEnd;

  /// The count of metric values that fall within this bucket's range.
  ///
  /// This integer represents the frequency of values in this bucket.
  final int bucketCount;

  /// The start value of the histogram bucket range (inclusive).
  ///
  /// This string represents the lower bound of the bucket's value range.
  final String bucketStart;

  /// Creates a [HistogramValueItem] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract the bucket's start,
  /// end, and count values.
  ///
  /// The [map] should contain:
  /// - `bucketStart`: The lower bound of the bucket's value range
  /// - `bucketEnd`: The upper bound of the bucket's value range
  /// - `bucketCount`: The frequency of values in this bucket
  HistogramValueItem.fromJsonMap(Map<String, dynamic> map)
      : bucketEnd = map["bucketEnd"],
        bucketCount = map["bucketCount"],
        bucketStart = map["bucketStart"];

  /// Converts this [HistogramValueItem] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The map contains the bucket's start,
  /// end, and count values.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bucketEnd'] = bucketEnd;
    data['bucketCount'] = bucketCount;
    data['bucketStart'] = bucketStart;
    return data;
  }
}
