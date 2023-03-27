import 'package:flutter/foundation.dart';

import 'cell_condition_time.dart';

@immutable
class CellularConditionMetrics {
  final CellConditionTime? cellConditionTime;

  CellularConditionMetrics.fromJsonMap(Map<String, dynamic> map)
      : cellConditionTime = map["cellConditionTime"] != null
            ? CellConditionTime.fromJsonMap(map["cellConditionTime"])
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cellConditionTime'] = cellConditionTime?.toJson();
    return data;
  }
}
