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

/// Represents the top-level MetricKit metrics payload.
///
/// This class aggregates all available metrics and metadata reported by
/// MetricKit for a given interval. Each property corresponds to a specific
/// metrics category or contextual information. All properties are optional and
/// may be null if the corresponding data was not reported in the payload.
@immutable
class MXMetricPayload implements Payload {
  /// Location activity metrics, including cumulative time spent at various
  /// location accuracy levels.
  final LocationActivityMetrics? locationActivityMetrics;

  /// Cellular condition metrics, such as signal strength and time spent in
  /// different cellular conditions.
  final CellularConditionMetrics? cellularConditionMetrics;

  /// Metadata about the app and device environment for this payload.
  final MetaData? metaData;

  /// GPU usage metrics.
  final GpuMetrics? gpuMetrics;

  /// Memory usage metrics, including peak and average suspended memory.
  final MemoryMetrics? memoryMetrics;

  /// Application exit metrics, such as termination reasons and exit codes.
  final ApplicationExitMetrics? applicationExitMetrics;

  /// Display metrics, such as screen brightness and display refresh rate.
  final DisplayMetrics? displayMetrics;

  /// List of signpost metrics, representing custom performance events.
  final List<SignpostMetrics>? signpostMetrics;

  /// CPU usage metrics.
  final CpuMetrics? cpuMetrics;

  /// Network transfer metrics, such as bytes sent and received.
  final NetworkTransferMetrics? networkTransferMetrics;

  /// Disk I/O metrics, such as read/write operations and throughput.
  final DiskIOMetrics? diskIOMetrics;

  /// Application launch metrics, including launch duration and cold/warm launch
  /// counts.
  final ApplicationLaunchMetrics? applicationLaunchMetrics;

  /// Application time metrics, such as foreground/background time.
  final ApplicationTimeMetrics? applicationTimeMetrics;

  /// The end timestamp for the reporting interval (ISO 8601 format).
  final String? timeStampEnd;

  /// Animation performance metrics.
  final AnimationMetrics? animationMetrics;

  /// Application responsiveness metrics, such as hitches and main thread
  /// stalls.
  final ApplicationResponsivenessMetrics? applicationResponsivenessMetrics;

  /// The app version associated with this metrics payload.
  final String? appVersion;

  /// The start timestamp for the reporting interval (ISO 8601 format).
  final String? timeStampBegin;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing the full metrics payload.
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

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
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
