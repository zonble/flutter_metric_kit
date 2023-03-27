import 'package:flutter/foundation.dart';

import 'average_pixel_luminance.dart';

@immutable
class DisplayMetrics {
  final AveragePixelLuminance? averagePixelLuminance;

  DisplayMetrics.fromJsonMap(Map<String, dynamic> map)
      : averagePixelLuminance = map["averagePixelLuminance"] != null
            ? AveragePixelLuminance.fromJsonMap(map["averagePixelLuminance"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averagePixelLuminance'] = averagePixelLuminance?.toJson();
    return data;
  }
}
