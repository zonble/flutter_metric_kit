import 'package:flutter/foundation.dart';

import 'histogrammed_app_hang_time.dart';

/// Represents metrics about application responsiveness and hang behavior.
///
/// This class encapsulates data about application hangs and responsiveness
/// issues that directly impact user experience. Responsiveness metrics are
/// crucial for understanding how often and for how long the application becomes
/// unresponsive to user input. Poor responsiveness can lead to user
/// frustration, negative reviews, and app abandonment, making these metrics
/// essential for maintaining high-quality user experiences.
@immutable
class ApplicationResponsivenessMetrics {
  /// Histogram data for application hang times and frequencies.
  ///
  /// Contains detailed timing information about when the application becomes
  /// unresponsive (hangs) and for how long. This includes distribution data
  /// showing the frequency and duration of hang events, which is critical for
  /// identifying responsiveness issues and prioritizing performance
  /// optimizations.
  ///
  /// Hang times are typically measured when the main thread becomes blocked and
  /// cannot respond to user interactions within expected timeframes.
  /// Understanding hang patterns helps developers identify blocking operations,
  /// inefficient algorithms, or resource contention issues that degrade user
  /// experience.
  ///
  /// This can be null if no hang time data is available for the collection
  /// period.
  final HistogrammedAppHangTime? histogrammedAppHangTime;

  /// Creates an [ApplicationResponsivenessMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract application
  /// responsiveness metrics from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `histogrammedAppHangTime`: An optional map containing hang time
  ///   histogram data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze application responsiveness patterns and
  /// identify performance issues that impact user experience.
  ApplicationResponsivenessMetrics.fromJsonMap(Map<String, dynamic> map)
      : histogrammedAppHangTime = map["histogrammedAppHangTime"] != null
            ? HistogrammedAppHangTime.fromJsonMap(
                map["histogrammedAppHangTime"])
            : null;

  /// Converts this [ApplicationResponsivenessMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `histogrammedAppHangTime`: Hang time histogram data (if available)
  ///
  /// This method is essential for responsiveness monitoring workflows, enabling
  /// the transmission of hang metrics to performance monitoring services, user
  /// experience analytics platforms, or APM tools. It's particularly valuable
  /// for tracking responsiveness trends, identifying performance regressions,
  /// and monitoring the effectiveness of performance optimizations.
  ///
  /// Responsiveness metrics are critical for maintaining excellent user
  /// experience, as they directly measure how interactive and responsive the
  /// application feels to users. Regular monitoring of these metrics helps
  /// ensure consistent app performance and user satisfaction.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['histogrammedAppHangTime'] = histogrammedAppHangTime?.toJson();
    return data;
  }
}
