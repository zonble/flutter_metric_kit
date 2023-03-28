import 'package:flutter/foundation.dart';

@immutable
class DiagnosticMetaData {
  final String? appBuildVersion;
  final String? appVersion;
  final String? regionFormat;
  final int? exceptionType;
  final String? osVersion;
  final String? deviceType;
  final int? signal;
  final int? exceptionCode;
  final String? platformArchitecture;
  final String? terminationReason;
  final String? virtualMemoryRegionInfo;

  DiagnosticMetaData.fromJsonMap(Map<String, dynamic> map)
      : appBuildVersion = map["appBuildVersion"],
        appVersion = map["appVersion"],
        regionFormat = map["regionFormat"],
        exceptionType = map["exceptionType"],
        osVersion = map["osVersion"],
        deviceType = map["deviceType"],
        signal = map["signal"],
        exceptionCode = map["exceptionCode"],
        platformArchitecture = map["platformArchitecture"],
        terminationReason = map["terminationReason"],
        virtualMemoryRegionInfo = map["virtualMemoryRegionInfo"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appBuildVersion'] = appBuildVersion;
    data['appVersion'] = appVersion;
    data['regionFormat'] = regionFormat;
    data['exceptionType'] = exceptionType;
    data['osVersion'] = osVersion;
    data['deviceType'] = deviceType;
    data['signal'] = signal;
    data['exceptionCode'] = exceptionCode;
    data['platformArchitecture'] = platformArchitecture;
    data['terminationReason'] = terminationReason;
    data['virtualMemoryRegionInfo'] = virtualMemoryRegionInfo;
    return data;
  }
}
