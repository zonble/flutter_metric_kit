import 'package:flutter/foundation.dart';

@immutable
class CallStackRootFrames {
  final String? binaryUUID;
  final int? offsetIntoBinaryTextSegment;
  final int? sampleCount;
  final String? binaryName;
  final int? address;

  CallStackRootFrames.fromJsonMap(Map<String, dynamic> map)
      : binaryUUID = map["binaryUUID"],
        offsetIntoBinaryTextSegment = map["offsetIntoBinaryTextSegment"],
        sampleCount = map["sampleCount"],
        binaryName = map["binaryName"],
        address = map["address"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['binaryUUID'] = binaryUUID;
    data['offsetIntoBinaryTextSegment'] = offsetIntoBinaryTextSegment;
    data['sampleCount'] = sampleCount;
    data['binaryName'] = binaryName;
    data['address'] = address;
    return data;
  }
}
