import 'package:flutter/foundation.dart';

@immutable
class NetworkTransferMetrics {
  final String? cumulativeCellularDownload;
  final String? cumulativeWifiDownload;
  final String? cumulativeCellularUpload;
  final String? cumulativeWifiUpload;

  NetworkTransferMetrics.fromJsonMap(Map<String, dynamic> map)
      : cumulativeCellularDownload = map["cumulativeCellularDownload"],
        cumulativeWifiDownload = map["cumulativeWifiDownload"],
        cumulativeCellularUpload = map["cumulativeCellularUpload"],
        cumulativeWifiUpload = map["cumulativeWifiUpload"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cumulativeCellularDownload'] = cumulativeCellularDownload;
    data['cumulativeWifiDownload'] = cumulativeWifiDownload;
    data['cumulativeCellularUpload'] = cumulativeCellularUpload;
    data['cumulativeWifiUpload'] = cumulativeWifiUpload;
    return data;
  }
}
