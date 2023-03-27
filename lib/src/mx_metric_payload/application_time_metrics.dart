import 'package:flutter/foundation.dart';

@immutable
class ApplicationTimeMetrics {
  final String? cumulativeForegroundTime;
  final String? cumulativeBackgroundTime;
  final String? cumulativeBackgroundAudioTime;
  final String? cumulativeBackgroundLocationTime;

  ApplicationTimeMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeForegroundTime = map["cumulativeForegroundTime"],
        cumulativeBackgroundTime = map["cumulativeBackgroundTime"],
        cumulativeBackgroundAudioTime = map["cumulativeBackgroundAudioTime"],
        cumulativeBackgroundLocationTime =
            map["cumulativeBackgroundLocationTime"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cumulativeForegroundTime'] = cumulativeForegroundTime;
    data['cumulativeBackgroundTime'] = cumulativeBackgroundTime;
    data['cumulativeBackgroundAudioTime'] = cumulativeBackgroundAudioTime;
    data['cumulativeBackgroundLocationTime'] = cumulativeBackgroundLocationTime;
    return data;
  }
}
