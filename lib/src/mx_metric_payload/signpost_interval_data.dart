import 'package:flutter/foundation.dart';

import 'histogrammed_signpost_durations.dart';

/// Represents signpost interval data as reported by MetricKit.
///
/// This class provides detailed metrics for a signpost interval, including
/// duration histograms, cumulative hitch time ratio, CPU time, average memory,
/// and logical writes. All properties are optional and may be null if the
/// corresponding data was not reported in the payload.
@immutable
class SignpostIntervalData {
  /// Histogrammed durations for the signpost interval.
  final HistogrammedSignpostDurations? histogrammedSignpostDurations;

  /// The cumulative hitch time ratio for the signpost interval (as a string).
  final String? signpostCumulativeHitchTimeRatio;

  /// The cumulative CPU time for the signpost interval (as a string).
  final String? signpostCumulativeCPUTime;

  /// The average memory usage during the signpost interval (as a string).
  final String? signpostAverageMemory;

  /// The cumulative logical writes during the signpost interval (as a string).
  final String? signpostCumulativeLogicalWrites;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing signpost interval data.
  SignpostIntervalData.fromJsonMap(Map<String, dynamic> map)
      : histogrammedSignpostDurations =
            map["histogrammedSignpostDurations"] != null
                ? HistogrammedSignpostDurations.fromJsonMap(
                    map["histogrammedSignpostDurations"])
                : null,
        signpostCumulativeHitchTimeRatio =
            map["signpostCumulativeHitchTimeRatio"],
        signpostCumulativeCPUTime = map["signpostCumulativeCPUTime"],
        signpostAverageMemory = map["signpostAverageMemory"],
        signpostCumulativeLogicalWrites =
            map["signpostCumulativeLogicalWrites"];

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogrammedSignpostDurations'] =
        histogrammedSignpostDurations?.toJson();
    data['signpostCumulativeHitchTimeRatio'] = signpostCumulativeHitchTimeRatio;
    data['signpostCumulativeCPUTime'] = signpostCumulativeCPUTime;
    data['signpostAverageMemory'] = signpostAverageMemory;
    data['signpostCumulativeLogicalWrites'] = signpostCumulativeLogicalWrites;
    return data;
  }
}
