import 'package:flutter/foundation.dart';

/// Represents animation performance metrics collected by MetricKit.
///
/// This class encapsulates metrics related to animation performance,
/// particularly focusing on scroll animation quality and smoothness. Animation
/// metrics are crucial for understanding user experience quality, as poor
/// animation performance directly impacts perceived app responsiveness and user
/// satisfaction.
@immutable
class AnimationMetrics {
  /// The ratio of time spent in scroll hitches compared to total scroll time.
  ///
  /// This metric represents the percentage of scroll time that was affected by
  /// hitches or frame drops, expressed as a string value. A scroll hitch occurs
  /// when the animation frame rate drops below the target refresh rate, causing
  /// visible stuttering or jankiness during scrolling operations.
  ///
  /// Lower values indicate smoother scrolling performance, while higher values
  /// suggest performance issues that may degrade user experience. This metric
  /// is essential for identifying scroll performance problems and optimizing
  /// list views, scroll views, and other scrollable content.
  final String scrollHitchTimeRatio;

  /// Creates an [AnimationMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract animation
  /// performance metrics from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `scrollHitchTimeRatio`: A string representing the scroll hitch time
  ///   ratio
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze animation performance data.
  AnimationMetrics.fromJsonMap(Map<String, dynamic> map)
      : scrollHitchTimeRatio = map["scrollHitchTimeRatio"];

  /// Converts this [AnimationMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `scrollHitchTimeRatio`: The scroll hitch time ratio value
  ///
  /// This method is essential for animation performance monitoring workflows,
  /// allowing animation metrics to be transmitted to performance monitoring
  /// services, analytics platforms, or APM tools. It's particularly valuable
  /// for tracking scroll performance trends, identifying performance
  /// regressions, and establishing performance benchmarks.
  ///
  /// Animation metrics are crucial for maintaining smooth user experiences and
  /// can help identify when UI optimizations are needed.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scrollHitchTimeRatio'] = scrollHitchTimeRatio;
    return data;
  }
}
