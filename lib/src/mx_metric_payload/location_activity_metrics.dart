import 'package:flutter/foundation.dart';

@immutable
class LocationActivityMetrics {
  final String? cumulativeBestAccuracyForNavigationTime;
  final String? cumulativeBestAccuracyTime;
  final String? cumulativeHundredMetersAccuracyTime;
  final String? cumulativeNearestTenMetersAccuracyTime;
  final String? cumulativeKilometerAccuracyTime;
  final String? cumulativeThreeKilometersAccuracyTime;

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
