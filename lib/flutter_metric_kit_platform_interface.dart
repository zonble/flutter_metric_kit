import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_metric_kit_method_channel.dart';

abstract class FlutterMetricKitPlatform extends PlatformInterface {
  /// Constructs a FlutterMetricKitPlatform.
  FlutterMetricKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMetricKitPlatform _instance = MethodChannelFlutterMetricKit();

  /// The default instance of [FlutterMetricKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterMetricKit].
  static FlutterMetricKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterMetricKitPlatform] when
  /// they register themselves.
  static set instance(FlutterMetricKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> startReceivingReports() {
    return _instance.startReceivingReports();
  }

  Future<bool> stopReceivingReports() {
    return _instance.stopReceivingReports();
  }

  Future<List<Map>> getPastPayloads() {
    return _instance.getPastPayloads();
  }

  Future<List<Map>> getPastDiagnosticPayloads() {
    return _instance.getPastDiagnosticPayloads();
  }
}
