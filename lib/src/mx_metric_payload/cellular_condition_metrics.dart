import 'package:flutter/foundation.dart';

import 'cell_condition_time.dart';

/// Represents comprehensive metrics about cellular network conditions and
/// performance.
///
/// This class serves as a container for cellular network condition data,
/// providing insights into network quality, connectivity stability, and
/// cellular performance patterns over time. Cellular condition metrics are
/// essential for understanding how network conditions impact app functionality,
/// optimizing network-dependent features, and ensuring robust performance
/// across varying cellular network environments. These metrics help developers
/// make informed decisions about adaptive networking strategies and improve
/// user experience in different connectivity scenarios.
@immutable
class CellularConditionMetrics {
  /// Time-based measurements of cellular network conditions.
  ///
  /// Contains detailed histogram data about cellular network quality and
  /// performance characteristics over different time periods. This includes
  /// information about signal strength variations, connection stability,
  /// network quality fluctuations, and temporal patterns in cellular
  /// connectivity. The data is crucial for understanding how network conditions
  /// change over time and their impact on app performance.
  ///
  /// This can be null if no cellular condition time data is available for the
  /// collection period, which may occur when the device is not using cellular
  /// connectivity or when cellular metrics collection is not enabled.
  final CellConditionTime? cellConditionTime;

  /// Creates a [CellularConditionMetrics] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract cellular condition
  /// metrics from MetricKit metric payloads.
  ///
  /// The [map] should contain:
  /// - `cellConditionTime`: An optional map containing cellular condition time
  ///   data
  ///
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze cellular network performance,
  /// understand connectivity patterns, and optimize network-dependent
  /// functionality for varying cellular conditions.
  CellularConditionMetrics.fromJsonMap(Map<String, dynamic> map)
      : cellConditionTime = map["cellConditionTime"] != null
            ? CellConditionTime.fromJsonMap(map["cellConditionTime"])
            : null;

  /// Converts this [CellularConditionMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `cellConditionTime`: Serialized cellular condition time data (if
  ///   available)
  ///
  /// This method is essential for cellular network analysis and optimization
  /// workflows, enabling the transmission of comprehensive cellular metrics to
  /// network monitoring services, connectivity analytics platforms, or mobile
  /// network optimization tools. It's particularly valuable for tracking
  /// cellular performance trends, identifying network quality issues, and
  /// implementing adaptive networking strategies.
  ///
  /// Cellular condition metrics provide crucial insights for optimizing app
  /// behavior based on network conditions, implementing smart retry mechanisms,
  /// and ensuring consistent user experience across different cellular network
  /// environments and signal conditions.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cellConditionTime'] = cellConditionTime?.toJson();
    return data;
  }
}
