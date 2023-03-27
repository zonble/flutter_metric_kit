import 'package:flutter/foundation.dart';

import 'histogrammed_extended_launch.dart';
import 'histogrammed_optimized_time_to_first_draw_key.dart';
import 'histogrammed_resume_time.dart';
import 'histogrammed_time_to_first_draw_key.dart';

@immutable
class ApplicationLaunchMetrics {
  final HistogrammedTimeToFirstDrawKey? histogrammedTimeToFirstDrawKey;
  final HistogrammedResumeTime? histogrammedResumeTime;
  final HistogrammedOptimizedTimeToFirstDrawKey?
      histogrammedOptimizedTimeToFirstDrawKey;
  final HistogrammedExtendedLaunch? histogrammedExtendedLaunch;

  ApplicationLaunchMetrics.fromJsonMap(Map<String, dynamic> map)
      : histogrammedTimeToFirstDrawKey =
            map["histogrammedTimeToFirstDrawKey"] != null
                ? HistogrammedTimeToFirstDrawKey.fromJsonMap(
                    map["histogrammedTimeToFirstDrawKey"])
                : null,
        histogrammedResumeTime = map["histogrammedResumeTime"] != null
            ? HistogrammedResumeTime.fromJsonMap(map["histogrammedResumeTime"])
            : null,
        histogrammedOptimizedTimeToFirstDrawKey =
            map["histogrammedOptimizedTimeToFirstDrawKey"] != null
                ? HistogrammedOptimizedTimeToFirstDrawKey.fromJsonMap(
                    map["histogrammedOptimizedTimeToFirstDrawKey"])
                : null,
        histogrammedExtendedLaunch = map["histogrammedExtendedLaunch"] != null
            ? HistogrammedExtendedLaunch.fromJsonMap(
                map["histogrammedExtendedLaunch"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogrammedTimeToFirstDrawKey'] =
        histogrammedTimeToFirstDrawKey?.toJson();
    data['histogrammedResumeTime'] = histogrammedResumeTime?.toJson();
    data['histogrammedOptimizedTimeToFirstDrawKey'] =
        histogrammedOptimizedTimeToFirstDrawKey?.toJson();
    data['histogrammedExtendedLaunch'] = histogrammedExtendedLaunch?.toJson();
    return data;
  }
}
