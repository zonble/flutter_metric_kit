import 'package:flutter/foundation.dart';

import 'histogram_value.dart';

@immutable
class HistogrammedSignpostDurations {
  final int? histogramNumBuckets;
  final HistogramValue? histogramValue;

  HistogrammedSignpostDurations.fromJsonMap(Map<String, dynamic> map)
      : histogramNumBuckets = map["histogramNumBuckets"],
        histogramValue = map["histogramValue"] != null
            ? HistogramValue.fromJsonMap(map["histogramValue"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogramNumBuckets'] = histogramNumBuckets;
    data['histogramValue'] = histogramValue?.toJson();
    return data;
  }
}
