import 'package:flutter/foundation.dart';

/// Represents network transfer metrics as reported by MetricKit.
///
/// This class provides cumulative upload and download data for both cellular
/// and Wi-Fi connections. All properties are optional and represent the total
/// bytes transferred as strings.
@immutable
class NetworkTransferMetrics {
  /// Cumulative bytes downloaded over cellular networks (as a string).
  final String? cumulativeCellularDownload;

  /// Cumulative bytes downloaded over Wi-Fi networks (as a string).
  final String? cumulativeWifiDownload;

  /// Cumulative bytes uploaded over cellular networks (as a string).
  final String? cumulativeCellularUpload;

  /// Cumulative bytes uploaded over Wi-Fi networks (as a string).
  final String? cumulativeWifiUpload;

  /// Creates an instance from a JSON map as provided by MetricKit.
  ///
  /// [map] is the decoded JSON object containing network transfer metrics data.
  NetworkTransferMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeCellularDownload = map["cumulativeCellularDownload"],
        cumulativeWifiDownload = map["cumulativeWifiDownload"],
        cumulativeCellularUpload = map["cumulativeCellularUpload"],
        cumulativeWifiUpload = map["cumulativeWifiUpload"];

  /// Converts this object to a JSON-serializable map.
  ///
  /// Returns a [Map] suitable for encoding as JSON, containing all non-null
  /// properties.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeCellularDownload'] = cumulativeCellularDownload;
    data['cumulativeWifiDownload'] = cumulativeWifiDownload;
    data['cumulativeCellularUpload'] = cumulativeCellularUpload;
    data['cumulativeWifiUpload'] = cumulativeWifiUpload;
    return data;
  }
}
