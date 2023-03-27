import 'package:flutter/foundation.dart';

@immutable
class HistogramValue {
  final Map<String, HistogramValueItem> values;

  HistogramValue.fromJsonMap(Map<String, dynamic> map)
      : values = map.map((key, value) =>
            MapEntry(key, HistogramValueItem.fromJsonMap(value)));

  Map<String, dynamic> toJson() {
    return values.map((key, value) => MapEntry(key, value.toJson()));
  }
}

@immutable
class HistogramValueItem {
  final String bucketEnd;
  final int bucketCount;
  final String bucketStart;

  HistogramValueItem.fromJsonMap(Map<String, dynamic> map)
      : bucketEnd = map["bucketEnd"],
        bucketCount = map["bucketCount"],
        bucketStart = map["bucketStart"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bucketEnd'] = bucketEnd;
    data['bucketCount'] = bucketCount;
    data['bucketStart'] = bucketStart;
    return data;
  }
}
