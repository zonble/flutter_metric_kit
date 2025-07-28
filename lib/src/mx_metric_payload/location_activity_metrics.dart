import 'package:flutter/foundation.dart';

/// Represents location activity metrics as reported by MetricKit.
///
/// This class provides cumulative time spent at various location accuracy
/// levels, useful for analyzing how long an app has used different location
/// accuracy modes. All properties are optional and represent durations as
/// strings, typically in seconds.
@immutable
class LocationActivityMetrics {
  /// Cumulative time (in seconds) the app spent using best accuracy for
  /// navigation.
  final String? cumulativeBestAccuracyForNavigationTime;

  /// Cumulative time (in seconds) the app spent using best accuracy.
  final String? cumulativeBestAccuracyTime;

  /// Cumulative time (in seconds) the app spent using hundred meters accuracy.
  final String? cumulativeHundredMetersAccuracyTime;

  /// Cumulative time (in seconds) the app spent using nearest ten meters
  /// accuracy.
  final String? cumulativeNearestTenMetersAccuracyTime;

  /// Cumulative time (in seconds) the app spent using kilometer accuracy.
  final String? cumulativeKilometerAccuracyTime;

  /// Cumulative time (in seconds) the app spent using three kilometers accuracy.
  final String? cumulativeThreeKilometersAccuracyTime;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing location activity metrics
  /// data.
  LocationActivityMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeBestAccuracyForNavigationTime =
            map["cumulativeBestAccuracyForNavigationTime"],
        cumulativeBestAccuracyTime = map["cumulativeBestAccuracyTime"],
        cumulativeHundredMetersAccuracyTime =
            map["cumulativeHundredMetersAccuracyTime"],
        cumulativeNearestTenMetersAccuracyTime =
            map["cumulativeNearestTenMetersAccuracyTime"],
        cumulativeKilometerAccuracyTime =
            map["cumulativeKilometerAccuracyTime"],
        cumulativeThreeKilometersAccuracyTime =
            map["cumulativeThreeKilometersAccuracyTime"];

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeBestAccuracyForNavigationTime'] =
        cumulativeBestAccuracyForNavigationTime;
    data['cumulativeBestAccuracyTime'] = cumulativeBestAccuracyTime;
    data['cumulativeHundredMetersAccuracyTime'] =
        cumulativeHundredMetersAccuracyTime;
    data['cumulativeNearestTenMetersAccuracyTime'] =
        cumulativeNearestTenMetersAccuracyTime;
    data['cumulativeKilometerAccuracyTime'] = cumulativeKilometerAccuracyTime;
    data['cumulativeThreeKilometersAccuracyTime'] =
        cumulativeThreeKilometersAccuracyTime;
    return data;
  }
}
