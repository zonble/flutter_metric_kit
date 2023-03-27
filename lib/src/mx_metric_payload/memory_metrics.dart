import 'package:flutter/foundation.dart';

import 'average_suspended_memory.dart';

@immutable
class MemoryMetrics {
  final String peakMemoryUsage;
  final AverageSuspendedMemory? averageSuspendedMemory;

  MemoryMetrics.fromJsonMap(Map<String, dynamic> map)
      : peakMemoryUsage = map["peakMemoryUsage"],
        averageSuspendedMemory = map["averageSuspendedMemory"] != null
            ? AverageSuspendedMemory.fromJsonMap(map["averageSuspendedMemory"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['peakMemoryUsage'] = peakMemoryUsage;
    data['averageSuspendedMemory'] = averageSuspendedMemory?.toJson();
    return data;
  }
}
