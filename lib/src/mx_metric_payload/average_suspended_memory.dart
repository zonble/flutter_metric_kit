import 'package:flutter/foundation.dart';

@immutable
class AverageSuspendedMemory {
  final String? averageValue;
  final int? standardDeviation;
  final int? sampleCount;

  AverageSuspendedMemory.fromJsonMap(Map<String, dynamic> map)
      : averageValue = map["averageValue"],
        standardDeviation = map["standardDeviation"],
        sampleCount = map["sampleCount"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageValue'] = averageValue;
    data['standardDeviation'] = standardDeviation;
    data['sampleCount'] = sampleCount;
    return data;
  }
}
