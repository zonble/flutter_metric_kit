import 'package:flutter/foundation.dart';

import 'background_exit_data.dart';
import 'foreground_exit_data.dart';

@immutable
class ApplicationExitMetrics {
  final BackgroundExitData? backgroundExitData;
  final ForegroundExitData? foregroundExitData;

  ApplicationExitMetrics.fromJsonMap(Map<String, dynamic> map)
      : backgroundExitData = map["backgroundExitData"] != null
            ? BackgroundExitData.fromJsonMap(map["backgroundExitData"])
            : null,
        foregroundExitData = map["foregroundExitData"] != null
            ? ForegroundExitData.fromJsonMap(map["foregroundExitData"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backgroundExitData'] = backgroundExitData?.toJson();
    data['foregroundExitData'] = foregroundExitData?.toJson();
    return data;
  }
}
