import 'package:flutter/foundation.dart';

import 'histogrammed_extended_launch.dart';
import 'histogrammed_optimized_time_to_first_draw_key.dart';
import 'histogrammed_resume_time.dart';
import 'histogrammed_time_to_first_draw_key.dart';

/// Represents comprehensive metrics about application launch performance.
///
/// This class encapsulates various timing measurements related to application
/// startup and resume performance, providing detailed insights into different
/// phases of the launch process. Launch metrics are critical for understanding
/// user experience, as launch time directly impacts user perception of app
/// responsiveness and quality. These metrics help developers identify
/// bottlenecks and optimize startup performance.
@immutable
class ApplicationLaunchMetrics {
  /// Histogram data for the time from app launch to first UI draw.
  ///
  /// Measures the duration from when the application process starts until the
  /// first frame is rendered to the screen. This is one of the most important
  /// launch metrics as it represents when users first see visual feedback from
  /// the app. Optimizing this metric improves perceived app responsiveness and
  /// user satisfaction.
  ///
  /// This can be null if no time-to-first-draw data is available for the
  /// collection period.
  final HistogrammedTimeToFirstDrawKey? histogrammedTimeToFirstDrawKey;
  
  /// Histogram data for application resume time from background.
  /// 
  /// Measures how long it takes for the application to become responsive
  /// when resuming from a background state. This metric is crucial for
  /// understanding the user experience when switching back to the app,
  /// as long resume times can make the app feel sluggish and unresponsive.
  /// 
  /// This can be null if no resume time data is available for the
  /// collection period.
  final HistogrammedResumeTime? histogrammedResumeTime;
  
  /// Histogram data for optimized time to first draw measurements.
  ///
  /// Contains enhanced or optimized measurements of the time-to-first-draw
  /// metric, potentially with different measurement methodologies or
  /// optimizations applied. This provides additional granularity for analyzing
  /// launch performance under various conditions or with different optimization
  /// strategies.
  ///
  /// This can be null if no optimized time-to-first-draw data is available for
  /// the collection period.
  final HistogrammedOptimizedTimeToFirstDrawKey?
      histogrammedOptimizedTimeToFirstDrawKey;
  
  /// Histogram data for extended launch time measurements.
  ///
  /// Captures launch timing data that extends beyond the basic
  /// time-to-first-draw, potentially including additional phases of the launch
  /// process such as data loading, initialization completion, or reaching a
  /// fully interactive state. This provides a more comprehensive view of the
  /// complete launch experience.
  ///
  /// This can be null if no extended launch data is available for the
  /// collection period.
  final HistogrammedExtendedLaunch? histogrammedExtendedLaunch;

  /// Creates an [ApplicationLaunchMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract application launch
  /// performance metrics from MetricKit metric payloads.
  ///
  /// The [map] should contain any combination of:
  /// - `histogrammedTimeToFirstDrawKey`: Histogram data for time-to-first-draw
  /// - `histogrammedResumeTime`: Histogram data for app resume times
  /// - `histogrammedOptimizedTimeToFirstDrawKey`: Optimized time-to-first-draw
  ///   data
  /// - `histogrammedExtendedLaunch`: Extended launch timing data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze application launch performance and
  /// identify optimization opportunities.
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

  /// Converts this [ApplicationLaunchMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `histogrammedTimeToFirstDrawKey`: Time-to-first-draw histogram data (if
  ///   available)
  /// - `histogrammedResumeTime`: Resume time histogram data (if available)
  /// - `histogrammedOptimizedTimeToFirstDrawKey`: Optimized time-to-first-draw
  ///   data (if available)
  /// - `histogrammedExtendedLaunch`: Extended launch histogram data (if
  ///   available)
  ///
  /// This method is essential for launch performance monitoring workflows,
  /// enabling the transmission of launch metrics to performance monitoring
  /// services, analytics platforms, or APM tools. It's particularly valuable
  /// for tracking launch performance trends, identifying performance
  /// regressions, establishing performance benchmarks, and monitoring the
  /// impact of optimization efforts.
  ///
  /// Launch metrics are critical for maintaining excellent user experience, as
  /// they directly impact user perception of app quality and responsiveness.
  /// Fast launch times are essential for user retention and satisfaction.
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
