import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_metric_kit_platform_interface.dart';
import 'mx_metric_payload/mx_metric_payload.dart';

/// An implementation of [FlutterMetricKitPlatform] that uses method channels.
class MethodChannelFlutterMetricKit extends FlutterMetricKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_metric_kit');

  @override
  Future<bool> startReceivingReports() async {
    return await methodChannel.invokeMethod<bool>('start_receiving_reports') ??
        false;
  }

  @override
  Future<bool> stopReceivingReports() async {
    return await methodChannel.invokeMethod<bool>('stop_receiving_reports') ??
        false;
  }

  @override
  Future<List<MXMetricPayload>> getPastPayloads() async {
    final string =
        await methodChannel.invokeMethod<String>('get_past_payloads');
    if (string == null) {
      throw Exception('no result');
    }
    List list = json.decode(string);
    return list
        .cast<Map<String, dynamic>>()
        .map((e) => MXMetricPayload.fromJsonMap(e))
        .toList();
  }

  @override
  Future<List<Map>> getPastDiagnosticPayloads() async {
    final string = await methodChannel
        .invokeMethod<String>('get_diagnostic_past_payloads');
    if (string == null) {
      throw Exception('no result');
    }
    final list = json.decode(string);
    return list.cast<Map>();
  }
}
