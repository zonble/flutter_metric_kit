import 'package:flutter/foundation.dart';

import 'signpost_interval_data.dart';

@immutable
class SignpostMetrics {
  final SignpostIntervalData? signpostIntervalData;
  final String? signpostCategory;
  final String? signpostName;
  final int? totalSignpostCount;

  SignpostMetrics.fromJsonMap(Map<String, dynamic> map)
      : signpostIntervalData = map["signpostIntervalData"] != null
            ? SignpostIntervalData.fromJsonMap(map["signpostIntervalData"])
            : null,
        signpostCategory = map["signpostCategory"],
        signpostName = map["signpostName"],
        totalSignpostCount = map["totalSignpostCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['signpostIntervalData'] = signpostIntervalData?.toJson();
    data['signpostCategory'] = signpostCategory;
    data['signpostName'] = signpostName;
    data['totalSignpostCount'] = totalSignpostCount;
    return data;
  }
}
