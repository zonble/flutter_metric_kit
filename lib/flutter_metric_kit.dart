import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'flutter_metric_kit_platform_interface.dart';

class FlutterMetricKit {
  FlutterMetricKit._();

  static const _eventChannel = EventChannel('flutter_metric_kit.events');

  static void _handleData(data, EventSink sink) {
    final map = json.decode(data);
    sink.add(map);
  }

  static Stream<dynamic> get events => _eventChannel
      .receiveBroadcastStream()
      .transform(StreamTransformer.fromHandlers(handleData: _handleData))
      .asBroadcastStream();

  /// Starts receiving MetricKit reports.
  static Future<void> startReceivingReports() {
    return FlutterMetricKitPlatform.instance.startReceivingReports();
  }

  /// Stops receiving MetricKit reports.
  static Future<void> stopReceivingReports() {
    return FlutterMetricKitPlatform.instance.stopReceivingReports();
  }

  static Future<List<Map>> getPastPayloads() {
    return FlutterMetricKitPlatform.instance.getPastPayloads();
  }

  static Future<List<Map>> getPastDiagnosticPayloads() {
    return FlutterMetricKitPlatform.instance.getPastDiagnosticPayloads();
  }
}
