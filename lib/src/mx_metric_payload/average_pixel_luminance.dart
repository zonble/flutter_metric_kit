import 'package:flutter/foundation.dart';

/// Represents statistical data about pixel luminance across the display.
///
/// This class encapsulates measurements of screen brightness and luminance
/// variations, providing insights into display usage patterns and visual
/// content characteristics. Pixel luminance metrics are valuable for
/// understanding battery impact from display usage, analyzing content
/// brightness patterns, and optimizing display-related performance. These
/// metrics can help identify opportunities for battery optimization and improve
/// user experience in different lighting conditions.
@immutable
class AveragePixelLuminance {
  /// The average luminance value across measured pixels.
  ///
  /// Represents the mean brightness level of pixels displayed on screen,
  /// typically expressed as a string value. This metric provides insight into
  /// the overall brightness characteristics of the content being displayed,
  /// which directly impacts battery consumption and user experience. Higher
  /// average luminance generally correlates with increased power consumption
  /// from the display.
  final String? averageValue;
  
  /// The standard deviation of pixel luminance values.
  ///
  /// Measures the variation or spread in brightness levels across the displayed
  /// content. A higher standard deviation indicates more contrast and variation
  /// in brightness, while a lower value suggests more uniform brightness
  /// levels. This metric helps understand the visual complexity and contrast
  /// characteristics of the displayed content.
  final int? standardDeviation;
  
  /// The number of pixel samples used in the luminance calculations.
  ///
  /// Indicates how many pixel measurements were taken to calculate the average
  /// luminance and standard deviation values. A higher sample count generally
  /// provides more accurate and representative luminance statistics. This value
  /// helps assess the reliability and coverage of the luminance measurements.
  final int? sampleCount;

  /// Creates an [AveragePixelLuminance] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract pixel luminance
  /// statistics from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `averageValue`: A string representing the average luminance value
  /// - `standardDeviation`: An integer representing luminance variation
  /// - `sampleCount`: An integer representing the number of samples measured
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze display usage patterns and optimize
  /// battery consumption related to screen brightness.
  AveragePixelLuminance.fromJsonMap(Map<String, dynamic> map)
      : averageValue = map["averageValue"],
        standardDeviation = map["standardDeviation"],
        sampleCount = map["sampleCount"];

  /// Converts this [AveragePixelLuminance] instance to a JSON map.
  /// 
  /// Returns a [Map<String, dynamic>] representation that can be serialized
  /// to JSON or used for data transmission. The returned map contains:
  /// - `averageValue`: The average luminance value (if available)
  /// - `standardDeviation`: The luminance standard deviation (if available)
  /// - `sampleCount`: The number of samples measured (if available)
  /// 
  /// This method is essential for display analytics and battery optimization
  /// workflows, enabling the transmission of luminance metrics to analytics
  /// platforms, battery monitoring services, or display optimization tools.
  /// It's particularly valuable for understanding content brightness patterns,
  /// identifying battery-intensive display usage, and optimizing visual
  /// content for better power efficiency.
  /// 
  /// Luminance metrics help developers make informed decisions about
  /// UI design, dark mode implementations, and content optimization
  /// strategies that can improve battery life and user experience.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageValue'] = averageValue;
    data['standardDeviation'] = standardDeviation;
    data['sampleCount'] = sampleCount;
    return data;
  }
}
