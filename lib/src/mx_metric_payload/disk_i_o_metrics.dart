import 'package:flutter/foundation.dart';

@immutable
class DiskIOMetrics {
  final String? cumulativeLogicalWrites;

  DiskIOMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeLogicalWrites = map["cumulativeLogicalWrites"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeLogicalWrites'] = cumulativeLogicalWrites;
    return data;
  }
}
