import 'package:flutter/foundation.dart';

import 'histogrammed_signpost_durations.dart';

@immutable
class SignpostIntervalData {
  final HistogrammedSignpostDurations? histogrammedSignpostDurations;
  final String? signpostCumulativeHitchTimeRatio;
  final String? signpostCumulativeCPUTime;
  final String? signpostAverageMemory;
  final String? signpostCumulativeLogicalWrites;

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
