import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_metric_kit/src/flutter_metric_kit.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockFlutterMetricKitPlatform
//     with MockPlatformInterfaceMixin
//     implements FlutterMetricKitPlatform {
//
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }
//
// void main() {
//   final FlutterMetricKitPlatform initialPlatform = FlutterMetricKitPlatform.instance;
//
//   test('$MethodChannelFlutterMetricKit is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFlutterMetricKit>());
//   });
//
//   test('getPlatformVersion', () async {
//     FlutterMetricKit flutterMetricKitPlugin = FlutterMetricKit();
//     MockFlutterMetricKitPlatform fakePlatform = MockFlutterMetricKitPlatform();
//     FlutterMetricKitPlatform.instance = fakePlatform;
//
//     expect(await flutterMetricKitPlugin.getPlatformVersion(), '42');
//   });
// }
