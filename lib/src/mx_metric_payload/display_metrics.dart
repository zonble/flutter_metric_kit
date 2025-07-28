import 'package:flutter/foundation.dart';

import 'average_pixel_luminance.dart';

/// Represents display-related performance metrics for the application.
///
/// This class encapsulates measurements about the display, such as average
/// pixel luminance, providing insights into screen brightness, content
/// characteristics, and their impact on battery usage and user experience.
/// Display metrics are valuable for optimizing visual content, implementing
/// adaptive brightness features, and understanding how display usage affects
/// device power consumption.
@immutable
class DisplayMetrics {
  /// The average pixel luminance measured across the display.
  ///
  /// Contains statistical data about the mean brightness level of pixels
  /// displayed on screen, including average value, standard deviation, and
  /// sample count. This metric is crucial for analyzing content brightness
  /// patterns, optimizing battery usage, and improving user experience in
  /// different lighting conditions. It can be null if no luminance data is
  /// available for the collection period.
  final AveragePixelLuminance? averagePixelLuminance;

  /// Creates a [DisplayMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract display metrics from
  /// MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `averagePixelLuminance`: An optional map containing average pixel
  ///   luminance data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze display usage patterns and optimize
  /// content for battery efficiency and visual quality.
  DisplayMetrics.fromJsonMap(Map<String, dynamic> map)
      : averagePixelLuminance = map["averagePixelLuminance"] != null
            ? AveragePixelLuminance.fromJsonMap(map["averagePixelLuminance"])
            : null;

  /// Converts this [DisplayMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `averagePixelLuminance`: Serialized average pixel luminance data (if
  ///   available)
  ///
  /// This method is essential for display analytics and optimization workflows,
  /// enabling the transmission of display metrics to analytics platforms,
  /// battery monitoring services, or content optimization tools. It's
  /// particularly valuable for tracking display usage trends, identifying
  /// battery-intensive content, and monitoring the impact of optimizations on
  /// display power consumption.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averagePixelLuminance'] = averagePixelLuminance?.toJson();
    return data;
  }
}
