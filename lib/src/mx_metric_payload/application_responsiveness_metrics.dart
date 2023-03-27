import 'package:flutter/foundation.dart';

import 'histogrammed_app_hang_time.dart';

@immutable
class ApplicationResponsivenessMetrics {
  final HistogrammedAppHangTime? histogrammedAppHangTime;

  ApplicationResponsivenessMetrics.fromJsonMap(Map<String, dynamic> map)
      : histogrammedAppHangTime = map["histogrammedAppHangTime"] != null
            ? HistogrammedAppHangTime.fromJsonMap(
                map["histogrammedAppHangTime"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogrammedAppHangTime'] = histogrammedAppHangTime?.toJson();
    return data;
  }
}
