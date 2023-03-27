import 'package:flutter/foundation.dart';

@immutable
class CpuMetrics {
  final String? cumulativeCPUTime;
  final String? cumulativeCPUInstructions;

  CpuMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeCPUTime = map["cumulativeCPUTime"],
        cumulativeCPUInstructions = map["cumulativeCPUInstructions"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeCPUTime'] = cumulativeCPUTime;
    data['cumulativeCPUInstructions'] = cumulativeCPUInstructions;
    return data;
  }
}
