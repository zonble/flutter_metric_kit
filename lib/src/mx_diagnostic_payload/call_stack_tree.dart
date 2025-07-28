import 'package:flutter/foundation.dart';

import 'call_stacks.dart';

/// Represents a call stack tree structure containing diagnostic information
/// about application execution flow.
/// 
/// This class is used to encapsulate call stack data from MetricKit diagnostics,
/// providing information about the execution context when a diagnostic event occurred.
@immutable
class CallStackTree {
  /// A list of call stacks captured during the diagnostic event.
  ///
  /// Each [CallStacks] object represents a stack trace from a specific thread
  /// or execution context. This can be null if no call stack information was
  /// available at the time of the diagnostic event.
  final List<CallStacks>? callStacks;
  
  /// Indicates whether call stacks are organized per thread.
  ///
  /// When true, each call stack in [callStacks] represents a separate thread.
  /// When false or null, the call stacks may be aggregated or organized
  /// differently.
  final bool? callStackPerThread;

  /// Creates a [CallStackTree] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract call stack tree
  /// information from MetricKit diagnostic data.
  ///
  /// The [map] should contain:
  /// - `callStacks`: An optional list of call stack data
  /// - `callStackPerThread`: An optional boolean indicating thread organization
  CallStackTree.fromJsonMap(Map<String, dynamic> map)
      : callStacks = map["callStacks"] != null
            ? List<CallStacks>.from(
                map["callStacks"].map((it) => CallStacks.fromJsonMap(it)))
            : null,
        callStackPerThread = map["callStackPerThread"];

  /// Converts this [CallStackTree] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `callStacks`: List of serialized call stack data (if available)
  /// - `callStackPerThread`: Boolean indicating thread organization (if
  ///   available)
  ///
  /// This method is commonly used when sending diagnostic data to analytics
  /// services or when persisting call stack information locally.
  ///
  /// Returns: A map containing the serialized call stack tree data.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['callStacks'] = callStacks?.map((v) => v.toJson()).toList();
    data['callStackPerThread'] = callStackPerThread;
    return data;
  }
}
