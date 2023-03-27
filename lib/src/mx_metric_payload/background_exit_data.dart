import 'package:flutter/foundation.dart';

@immutable
class BackgroundExitData {
  final int? cumulativeAppWatchdogExitCount;
  final int? cumulativeMemoryResourceLimitExitCount;
  final int? cumulativeBackgroundURLSessionCompletionTimeoutExitCount;
  final int? cumulativeBackgroundFetchCompletionTimeoutExitCount;
  final int? cumulativeAbnormalExitCount;
  final int? cumulativeSuspendedWithLockedFileExitCount;
  final int? cumulativeIllegalInstructionExitCount;
  final int? cumulativeMemoryPressureExitCount;
  final int? cumulativeBadAccessExitCount;
  final int? cumulativeCPUResourceLimitExitCount;
  final int? cumulativeBackgroundTaskAssertionTimeoutExitCount;
  final int? cumulativeNormalAppExitCount;

  BackgroundExitData.fromJsonMap(Map<String, dynamic> map)
      : cumulativeAppWatchdogExitCount = map["cumulativeAppWatchdogExitCount"],
        cumulativeMemoryResourceLimitExitCount =
            map["cumulativeMemoryResourceLimitExitCount"],
        cumulativeBackgroundURLSessionCompletionTimeoutExitCount =
            map["cumulativeBackgroundURLSessionCompletionTimeoutExitCount"],
        cumulativeBackgroundFetchCompletionTimeoutExitCount =
            map["cumulativeBackgroundFetchCompletionTimeoutExitCount"],
        cumulativeAbnormalExitCount = map["cumulativeAbnormalExitCount"],
        cumulativeSuspendedWithLockedFileExitCount =
            map["cumulativeSuspendedWithLockedFileExitCount"],
        cumulativeIllegalInstructionExitCount =
            map["cumulativeIllegalInstructionExitCount"],
        cumulativeMemoryPressureExitCount =
            map["cumulativeMemoryPressureExitCount"],
        cumulativeBadAccessExitCount = map["cumulativeBadAccessExitCount"],
        cumulativeCPUResourceLimitExitCount =
            map["cumulativeCPUResourceLimitExitCount"],
        cumulativeBackgroundTaskAssertionTimeoutExitCount =
            map["cumulativeBackgroundTaskAssertionTimeoutExitCount"],
        cumulativeNormalAppExitCount = map["cumulativeNormalAppExitCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeAppWatchdogExitCount'] = cumulativeAppWatchdogExitCount;
    data['cumulativeMemoryResourceLimitExitCount'] =
        cumulativeMemoryResourceLimitExitCount;
    data['cumulativeBackgroundURLSessionCompletionTimeoutExitCount'] =
        cumulativeBackgroundURLSessionCompletionTimeoutExitCount;
    data['cumulativeBackgroundFetchCompletionTimeoutExitCount'] =
        cumulativeBackgroundFetchCompletionTimeoutExitCount;
    data['cumulativeAbnormalExitCount'] = cumulativeAbnormalExitCount;
    data['cumulativeSuspendedWithLockedFileExitCount'] =
        cumulativeSuspendedWithLockedFileExitCount;
    data['cumulativeIllegalInstructionExitCount'] =
        cumulativeIllegalInstructionExitCount;
    data['cumulativeMemoryPressureExitCount'] =
        cumulativeMemoryPressureExitCount;
    data['cumulativeBadAccessExitCount'] = cumulativeBadAccessExitCount;
    data['cumulativeCPUResourceLimitExitCount'] =
        cumulativeCPUResourceLimitExitCount;
    data['cumulativeBackgroundTaskAssertionTimeoutExitCount'] =
        cumulativeBackgroundTaskAssertionTimeoutExitCount;
    data['cumulativeNormalAppExitCount'] = cumulativeNormalAppExitCount;
    return data;
  }
}
