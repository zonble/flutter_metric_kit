import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'flutter_metric_kit_platform_interface.dart';
import 'mx_metric_payload/mx_metric_payload.dart';

/// A plug-in that provides access to MetricKit.
///
/// To use the plug-in, listen to the stream of [events] and then call
/// [startReceivingReports]. The plug-in can work on only iOS 13 and above.
class FlutterMetricKit {
  FlutterMetricKit._();

  static const _eventChannel = EventChannel('flutter_metric_kit.events');

  static void _handleData(data, EventSink sink) {
    final map = json.decode(data);

    final key = map['name'];
    List payloads = map['payloads'];
    if (key == 'MXMetricPayload') {
      sink.add(payloads
          .cast<Map<String, dynamic>>()
          .map((e) => MXMetricPayload.fromJsonMap(e))
          .toList());
    } else {
      sink.add(payloads);
    }
  }

  /// The stream of the received MetricKit reports.
  static Stream<dynamic> get events => _eventChannel
      .receiveBroadcastStream()
      .transform(StreamTransformer.fromHandlers(handleData: _handleData))
      .asBroadcastStream();

  /// Starts receiving MetricKit reports.
  static Future<bool> startReceivingReports() =>
      FlutterMetricKitPlatform.instance.startReceivingReports();

  /// Stops receiving MetricKit reports.
  static Future<bool> stopReceivingReports() =>
      FlutterMetricKitPlatform.instance.stopReceivingReports();

  /// Gets past payloads.
  static Future<List<MXMetricPayload>> getPastPayloads() =>
      FlutterMetricKitPlatform.instance.getPastPayloads();

  /// Gets past payloads.
  static Future<List<Map>> getPastDiagnosticPayloads() =>
      FlutterMetricKitPlatform.instance.getPastDiagnosticPayloads();
}
