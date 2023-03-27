import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_metric_kit_platform_interface.dart';

/// An implementation of [FlutterMetricKitPlatform] that uses method channels.
class MethodChannelFlutterMetricKit extends FlutterMetricKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_metric_kit');

  @override
  Future<void> startReceivingReports() async {
    await methodChannel.invokeMethod<String>('start_receiving_reports');
  }

  @override
  Future<void> stopReceivingReports() async {
    await methodChannel.invokeMethod<String>('stop_receiving_reports');
  }
}
