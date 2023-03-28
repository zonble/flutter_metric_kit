import 'package:flutter/foundation.dart';

import '../payload.dart';
import 'animation_metrics.dart';
import 'application_exit_metrics.dart';
import 'application_launch_metrics.dart';
import 'application_responsiveness_metrics.dart';
import 'application_time_metrics.dart';
import 'cellular_condition_metrics.dart';
import 'cpu_metrics.dart';
import 'disk_i_o_metrics.dart';
import 'display_metrics.dart';
import 'gpu_metrics.dart';
import 'location_activity_metrics.dart';
import 'memory_metrics.dart';
import 'meta_data.dart';
import 'network_transfer_metrics.dart';
import 'signpost_metrics.dart';

@immutable
class MXMetricPayload implements Payload {
  final LocationActivityMetrics? locationActivityMetrics;
  final CellularConditionMetrics? cellularConditionMetrics;
  final MetaData? metaData;
  final GpuMetrics? gpuMetrics;
  final MemoryMetrics? memoryMetrics;
  final ApplicationExitMetrics? applicationExitMetrics;
  final DisplayMetrics? displayMetrics;
  final List<SignpostMetrics>? signpostMetrics;
  final CpuMetrics? cpuMetrics;
  final NetworkTransferMetrics? networkTransferMetrics;
  final DiskIOMetrics? diskIOMetrics;
  final ApplicationLaunchMetrics? applicationLaunchMetrics;
  final ApplicationTimeMetrics? applicationTimeMetrics;
  final String? timeStampEnd;
  final AnimationMetrics? animationMetrics;
  final ApplicationResponsivenessMetrics? applicationResponsivenessMetrics;
  final String? appVersion;
  final String? timeStampBegin;

  MXMetricPayload.fromJsonMap(Map<String, dynamic> map)
      : locationActivityMetrics = map["locationActivityMetrics"] != null
            ? LocationActivityMetrics.fromJsonMap(
                map["locationActivityMetrics"])
            : null,
        cellularConditionMetrics = map["cellularConditionMetrics"] != null
            ? CellularConditionMetrics.fromJsonMap(
                map["cellularConditionMetrics"])
            : null,
        metaData = map["metaData"] != null
            ? MetaData.fromJsonMap(map["metaData"])
            : null,
        gpuMetrics = map["gpuMetrics"] != null
            ? GpuMetrics.fromJsonMap(map["gpuMetrics"])
            : null,
        memoryMetrics = map["memoryMetrics"] != null
            ? MemoryMetrics.fromJsonMap(map["memoryMetrics"])
            : null,
        applicationExitMetrics = map["applicationExitMetrics"] != null
            ? ApplicationExitMetrics.fromJsonMap(map["applicationExitMetrics"])
            : null,
        displayMetrics = map["displayMetrics"] != null
            ? DisplayMetrics.fromJsonMap(map["displayMetrics"])
            : null,
        signpostMetrics = map["signpostMetrics"] != null
            ? List<SignpostMetrics>.from(map["signpostMetrics"]
                .map((it) => SignpostMetrics.fromJsonMap(it)))
            : null,
        cpuMetrics = map["cpuMetrics"] != null
            ? CpuMetrics.fromJsonMap(map["cpuMetrics"])
            : null,
        networkTransferMetrics = map["networkTransferMetrics"] != null
            ? NetworkTransferMetrics.fromJsonMap(map["networkTransferMetrics"])
            : null,
        diskIOMetrics = map["diskIOMetrics"] != null
            ? DiskIOMetrics.fromJsonMap(map["diskIOMetrics"])
            : null,
        applicationLaunchMetrics = map["applicationLaunchMetrics"] != null
            ? ApplicationLaunchMetrics.fromJsonMap(
                map["applicationLaunchMetrics"])
            : null,
        applicationTimeMetrics = map["applicationTimeMetrics"] != null
            ? ApplicationTimeMetrics.fromJsonMap(map["applicationTimeMetrics"])
            : null,
        timeStampEnd = map["timeStampEnd"],
        animationMetrics = map["animationMetrics"] != null
            ? AnimationMetrics.fromJsonMap(map["animationMetrics"])
            : null,
        applicationResponsivenessMetrics =
            map["applicationResponsivenessMetrics"] != null
                ? ApplicationResponsivenessMetrics.fromJsonMap(
                    map["applicationResponsivenessMetrics"])
                : null,
        appVersion = map["appVersion"],
        timeStampBegin = map["timeStampBegin"];

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locationActivityMetrics'] = locationActivityMetrics?.toJson();
    data['cellularConditionMetrics'] = cellularConditionMetrics?.toJson();
    data['metaData'] = metaData?.toJson();
    data['gpuMetrics'] = memoryMetrics?.toJson();
    data['applicationExitMetrics'] = applicationExitMetrics?.toJson();
    data['displayMetrics'] = displayMetrics?.toJson();
    data['signpostMetrics'] = signpostMetrics?.map((v) => v.toJson()).toList();
    data['cpuMetrics'] = cpuMetrics?.toJson();
    data['networkTransferMetrics'] = networkTransferMetrics?.toJson();
    data['diskIOMetrics'] = diskIOMetrics?.toJson();
    data['applicationLaunchMetrics'] = applicationLaunchMetrics?.toJson();
    data['applicationTimeMetrics'] = applicationTimeMetrics?.toJson();
    data['timeStampEnd'] = timeStampEnd;
    data['animationMetrics'] = animationMetrics?.toJson();
    data['applicationResponsivenessMetrics'] =
        applicationResponsivenessMetrics?.toJson();
    data['appVersion'] = appVersion;
    data['timeStampBegin'] = timeStampBegin;
    return data;
  }
}
