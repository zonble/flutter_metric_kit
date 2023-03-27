import 'package:flutter/foundation.dart';

@immutable
class GpuMetrics {
  final String? cumulativeGPUTime;

  GpuMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeGPUTime = map["cumulativeGPUTime"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeGPUTime'] = cumulativeGPUTime;
    return data;
  }
}
