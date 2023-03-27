import 'package:flutter/services.dart';

import 'flutter_metric_kit_platform_interface.dart';

class FlutterMetricKit {
  FlutterMetricKit._();

  static const _eventChannel = EventChannel('flutter_metric_kit.events');

  static Stream<dynamic> get events =>
      _eventChannel.receiveBroadcastStream().asBroadcastStream();

  /// Starts receiving MetricKit reports.
  static Future<void> startReceivingReports() {
    return FlutterMetricKitPlatform.instance.startReceivingReports();
  }

  /// Stops receiving MetricKit reports.
  static Future<void> stopReceivingReports() {
    return FlutterMetricKitPlatform.instance.stopReceivingReports();
  }
}
