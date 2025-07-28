import 'package:flutter/foundation.dart';

/// Represents metadata information as reported by MetricKit.
///
/// This class provides contextual information about the app and device
/// environment for each metrics payload. All properties are optional and
/// represent details such as app version, OS version, device type, and more.
@immutable
class MetaData {
  /// The build version of the app as reported by MetricKit.
  final String? appBuildVersion;

  /// The operating system version of the device.
  final String? osVersion;

  /// The region format (locale) of the device.
  final String? regionFormat;

  /// The platform architecture (e.g., arm64, x86_64) of the device.
  final String? platformArchitecture;

  /// The bundle identifier of the app.
  final String? bundleIdentifier;

  /// The type of device (e.g., iPhone, iPad).
  final String? deviceType;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing metadata information.
  MetaData.fromJsonMap(Map<String, dynamic> map)
      : appBuildVersion = map["appBuildVersion"],
        osVersion = map["osVersion"],
        regionFormat = map["regionFormat"],
        platformArchitecture = map["platformArchitecture"],
        bundleIdentifier = map["bundleIdentifier"],
        deviceType = map["deviceType"];

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appBuildVersion'] = appBuildVersion;
    data['osVersion'] = osVersion;
    data['regionFormat'] = regionFormat;
    data['platformArchitecture'] = platformArchitecture;
    data['bundleIdentifier'] = bundleIdentifier;
    data['deviceType'] = deviceType;
    return data;
  }
}
