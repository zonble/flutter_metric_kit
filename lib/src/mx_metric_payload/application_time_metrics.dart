import 'package:flutter/foundation.dart';

/// Represents metrics about application usage time across different states and
/// modes.
///
/// This class encapsulates cumulative time measurements for various application
/// execution states, providing insights into how users interact with the app
/// and how the app utilizes system resources in different contexts. Time
/// metrics are valuable for understanding user engagement patterns, optimizing
/// battery usage, and analyzing the effectiveness of background processing
/// features.
@immutable
class ApplicationTimeMetrics {
  /// The cumulative time the application spent in the foreground state.
  ///
  /// Represents the total duration that the application was actively being used
  /// by the user with the app visible and interactive. This metric is crucial
  /// for understanding user engagement levels, session durations, and overall
  /// app usage patterns. High foreground time indicates strong user engagement,
  /// while patterns in foreground usage can inform UX optimization strategies.
  ///
  /// The value is typically expressed as a time duration string.
  final String? cumulativeForegroundTime;
  
  /// The cumulative time the application spent in the background state.
  ///
  /// Represents the total duration that the application was running in the
  /// background while not visible to the user. This includes time spent
  /// performing background tasks, maintaining network connections, or handling
  /// system events. Understanding background time is important for optimizing
  /// battery usage and ensuring efficient background processing without
  /// excessive resource consumption.
  ///
  /// The value is typically expressed as a time duration string.
  final String? cumulativeBackgroundTime;
  
  /// The cumulative time the application spent performing background audio
  /// tasks.
  ///
  /// Represents the total duration that the application was actively processing
  /// audio in the background, such as music playback, podcast streaming, or
  /// audio recording. This metric is particularly important for media
  /// applications to understand audio usage patterns and optimize battery
  /// efficiency during background audio operations.
  ///
  /// The value is typically expressed as a time duration string and may be null
  /// if the app doesn't perform background audio tasks.
  final String? cumulativeBackgroundAudioTime;
  
  /// The cumulative time the application spent using location services in the background.
  /// 
  /// Represents the total duration that the application was actively
  /// accessing location services while running in the background. This
  /// includes GPS tracking, geofencing, or location-based notifications.
  /// This metric is critical for location-aware applications to monitor
  /// battery impact and optimize location usage efficiency.
  /// 
  /// The value is typically expressed as a time duration string and may
  /// be null if the app doesn't use background location services.
  final String? cumulativeBackgroundLocationTime;

  /// Creates an [ApplicationTimeMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract application time
  /// usage metrics from MetricKit metric payloads.
  ///
  /// The [map] should contain any combination of:
  /// - `cumulativeForegroundTime`: Total foreground usage time string
  /// - `cumulativeBackgroundTime`: Total background execution time string
  /// - `cumulativeBackgroundAudioTime`: Total background audio time string
  /// - `cumulativeBackgroundLocationTime`: Total background location time
  ///   string
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze application usage patterns, user
  /// engagement levels, and resource utilization efficiency.
  ApplicationTimeMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeForegroundTime = map["cumulativeForegroundTime"],
        cumulativeBackgroundTime = map["cumulativeBackgroundTime"],
        cumulativeBackgroundAudioTime = map["cumulativeBackgroundAudioTime"],
        cumulativeBackgroundLocationTime =
            map["cumulativeBackgroundLocationTime"];

  /// Converts this [ApplicationTimeMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `cumulativeForegroundTime`: Total foreground time (if available)
  /// - `cumulativeBackgroundTime`: Total background time (if available)
  /// - `cumulativeBackgroundAudioTime`: Total background audio time (if
  ///   available)
  /// - `cumulativeBackgroundLocationTime`: Total background location time (if
  ///   available)
  ///
  /// This method is essential for usage analytics and engagement monitoring
  /// workflows, enabling the transmission of time metrics to analytics
  /// platforms, user engagement tracking services, or battery optimization
  /// tools. It's particularly valuable for understanding user behavior
  /// patterns, optimizing resource usage, and measuring feature adoption.
  ///
  /// Time metrics provide crucial insights into how users interact with the
  /// application and help identify opportunities for improving user experience,
  /// battery efficiency, and overall app performance.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cumulativeForegroundTime'] = cumulativeForegroundTime;
    data['cumulativeBackgroundTime'] = cumulativeBackgroundTime;
    data['cumulativeBackgroundAudioTime'] = cumulativeBackgroundAudioTime;
    data['cumulativeBackgroundLocationTime'] = cumulativeBackgroundLocationTime;
    return data;
  }
}
