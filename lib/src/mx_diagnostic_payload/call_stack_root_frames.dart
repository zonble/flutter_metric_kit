import 'package:flutter/foundation.dart';

@immutable
/// Represents the root frames of a call stack.
///
/// This class encapsulates information about the root frames in a call stack,
/// which can be useful for diagnostic purposes to understand the origin of an
/// error or exception.
///
/// Root frames typically represent the most significant parts of a stack trace
/// that led to a particular execution point.
class CallStackRootFrames {
  /// The UUID of the binary associated with the call stack root frames.
  ///
  /// This represents a unique identifier for a binary module that is part of
  /// the call stack. Can be null if no binary UUID is associated with these
  /// frames.
  final String? binaryUUID;
  /// The offset (in bytes) of this frame in the binary's __TEXT segment.
  ///
  /// This value is optional and might be null if the offset information is not
  /// available.
  final int? offsetIntoBinaryTextSegment;
  /// Number of samples (stackshots) collected for this task.
  ///
  /// This value represents the count of stack trace snapshots gathered for
  /// profiling or diagnostic purposes. A null value indicates that no samples
  /// were collected or the count is unavailable.
  final int? sampleCount;
  /// The name of the binary associated with the call stack root frames.
  ///
  /// This property represents the name of the binary (executable) file that
  /// contains the code where the call stack frames originated from.
  ///
  /// It can be null if the binary name is not available.
  final String? binaryName;
  /// The address of the call stack root frame.
  ///
  /// The address is nullable and represents the memory location of the root
  /// frame in the call stack.
  final int? address;

  /// Creates a [CallStackRootFrames] instance from a JSON map.
  ///
  /// The [map] parameter is a JSON map representation of the call stack root
  /// frames.
  CallStackRootFrames.fromJsonMap(Map<String, dynamic> map)
      : binaryUUID = map["binaryUUID"],
        offsetIntoBinaryTextSegment = map["offsetIntoBinaryTextSegment"],
        sampleCount = map["sampleCount"],
        binaryName = map["binaryName"],
        address = map["address"];

  /// Converts this instance to a JSON representation.
  ///
  /// Returns a map with string keys and dynamic values that represents this
  /// instance in a format suitable for JSON serialization.
  ///
  /// This method is used when encoding instances of this class to JSON format,
  /// especially when interacting with the MetricKit framework APIs or storing
  /// diagnostics data.
  ///
  /// @return A map containing the object's properties as key-value pairs.
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
