import 'package:flutter/foundation.dart';

import 'signpost_interval_data.dart';

/// Represents signpost metrics as reported by MetricKit.
///
/// This class provides information about a specific signpost, including its
/// interval data, category, name, and the total number of signpost events. All
/// properties are optional and may be null if the corresponding data was not
/// reported in the payload.
@immutable
class SignpostMetrics {
  /// The interval data for this signpost, including duration histograms and
  /// resource usage.
  final SignpostIntervalData? signpostIntervalData;

  /// The category of the signpost (e.g., subsystem or feature name).
  final String? signpostCategory;

  /// The name of the signpost event.
  final String? signpostName;

  /// The total number of signpost events recorded.
  final int? totalSignpostCount;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing signpost metrics data.
  SignpostMetrics.fromJsonMap(Map<String, dynamic> map)
      : signpostIntervalData = map["signpostIntervalData"] != null
            ? SignpostIntervalData.fromJsonMap(map["signpostIntervalData"])
            : null,
        signpostCategory = map["signpostCategory"],
        signpostName = map["signpostName"],
        totalSignpostCount = map["totalSignpostCount"];

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['signpostIntervalData'] = signpostIntervalData?.toJson();
    data['signpostCategory'] = signpostCategory;
    data['signpostName'] = signpostName;
    data['totalSignpostCount'] = totalSignpostCount;
    return data;
  }
}
