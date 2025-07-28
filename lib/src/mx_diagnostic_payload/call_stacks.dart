import 'package:flutter/foundation.dart';

import 'call_stack_root_frames.dart';

/// Represents a collection of call stacks from a diagnostic event.
///
/// This class encapsulates call stack information captured during MetricKit
/// diagnostic events, providing details about the execution context and thread
/// attribution when the diagnostic occurred.
@immutable
class CallStacks {
  /// Indicates whether this call stack is attributed to a specific thread.
  ///
  /// When true, this call stack represents execution on a specific thread and
  /// can be correlated with thread-specific diagnostic information. When false
  /// or null, the call stack may represent aggregated information across
  /// multiple threads or the thread attribution is unknown.
  final bool? threadAttributed;
  
  /// A list of root frames that make up the call stack hierarchy.
  /// 
  /// Each [CallStackRootFrames] represents a top-level frame in the call stack,
  /// which may contain nested sub-frames. This provides a hierarchical view
  /// of the execution path at the time of the diagnostic event.
  /// 
  /// This can be null if no call stack frame information was available
  /// or could not be captured during the diagnostic event.
  final List<CallStackRootFrames>? callStackRootFrames;

  /// Creates a [CallStacks] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract call stack
  /// information from MetricKit diagnostic data.
  ///
  /// The [map] should contain:
  /// - `threadAttributed`: An optional boolean indicating thread attribution
  /// - `callStackRootFrames`: An optional list of root frame data

  CallStacks.fromJsonMap(Map<String, dynamic> map)
      : threadAttributed = map["threadAttributed"],
        callStackRootFrames = map["callStackRootFrames"] != null
            ? List<CallStackRootFrames>.from(map["callStackRootFrames"]
                .map((it) => CallStackRootFrames.fromJsonMap(it)))
            : null;

  /// Converts this [CallStacks] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `threadAttributed`: Boolean indicating thread attribution (if available)
  /// - `callStackRootFrames`: List of serialized root frame data (if available)
  ///
  /// This method is typically used when transmitting diagnostic data to
  /// analytics services, logging systems, or when persisting call stack
  /// information for later analysis.
  ///
  /// Returns: A map containing the serialized call stack data.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['threadAttributed'] = threadAttributed;
    data['callStackRootFrames'] =
        callStackRootFrames?.map((v) => v.toJson()).toList();
    return data;
  }
}
