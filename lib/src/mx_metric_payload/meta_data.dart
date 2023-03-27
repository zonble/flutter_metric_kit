import 'package:flutter/foundation.dart';

@immutable
class MetaData {
  final String? appBuildVersion;
  final String? osVersion;
  final String? regionFormat;
  final String? platformArchitecture;
  final String? bundleIdentifier;
  final String? deviceType;

  MetaData.fromJsonMap(Map<String, dynamic> map)
      : appBuildVersion = map["appBuildVersion"],
        osVersion = map["osVersion"],
        regionFormat = map["regionFormat"],
        platformArchitecture = map["platformArchitecture"],
        bundleIdentifier = map["bundleIdentifier"],
        deviceType = map["deviceType"];

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
