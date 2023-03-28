import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_metric_kit_method_channel.dart';
import 'mx_diagnostic_payload/mx_diagnostic_payload.dart';
import 'mx_metric_payload/mx_metric_payload.dart';

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

  /// Starts receiving MetricKit reports.
  Future<bool> startReceivingReports() => _instance.startReceivingReports();

  /// Stops receiving MetricKit reports.
  Future<bool> stopReceivingReports() => _instance.stopReceivingReports();

  /// Gets past payloads.
  Future<List<MXMetricPayload>> getPastPayloads() =>
      _instance.getPastPayloads();

  /// Gets past payloads.
  Future<List<MXDiagnosticPayload>> getPastDiagnosticPayloads() =>
      _instance.getPastDiagnosticPayloads();
}
