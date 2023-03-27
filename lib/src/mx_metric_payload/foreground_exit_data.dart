import 'package:flutter/foundation.dart';

@immutable
class ForegroundExitData {
  final int? cumulativeBadAccessExitCount;
  final int? cumulativeAbnormalExitCount;
  final int? cumulativeMemoryResourceLimitExitCount;
  final int? cumulativeNormalAppExitCount;
  final int? cumulativeCPUResourceLimitExitCount;
  final int? cumulativeIllegalInstructionExitCount;
  final int? cumulativeAppWatchdogExitCount;

  ForegroundExitData.fromJsonMap(Map<String, dynamic> map)
      : cumulativeBadAccessExitCount = map["cumulativeBadAccessExitCount"],
        cumulativeAbnormalExitCount = map["cumulativeAbnormalExitCount"],
        cumulativeMemoryResourceLimitExitCount =
            map["cumulativeMemoryResourceLimitExitCount"],
        cumulativeNormalAppExitCount = map["cumulativeNormalAppExitCount"],
        cumulativeCPUResourceLimitExitCount =
            map["cumulativeCPUResourceLimitExitCount"],
        cumulativeIllegalInstructionExitCount =
            map["cumulativeIllegalInstructionExitCount"],
        cumulativeAppWatchdogExitCount = map["cumulativeAppWatchdogExitCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeBadAccessExitCount'] = cumulativeBadAccessExitCount;
    data['cumulativeAbnormalExitCount'] = cumulativeAbnormalExitCount;
    data['cumulativeMemoryResourceLimitExitCount'] =
        cumulativeMemoryResourceLimitExitCount;
    data['cumulativeNormalAppExitCount'] = cumulativeNormalAppExitCount;
    data['cumulativeCPUResourceLimitExitCount'] =
        cumulativeCPUResourceLimitExitCount;
    data['cumulativeIllegalInstructionExitCount'] =
        cumulativeIllegalInstructionExitCount;
    data['cumulativeAppWatchdogExitCount'] = cumulativeAppWatchdogExitCount;
    return data;
  }
}
