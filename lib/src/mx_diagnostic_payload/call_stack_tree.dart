import 'package:flutter/foundation.dart';

import 'call_stacks.dart';

@immutable
class CallStackTree {
  final List<CallStacks>? callStacks;
  final bool? callStackPerThread;

  CallStackTree.fromJsonMap(Map<String, dynamic> map)
      : callStacks = map["callStacks"] != null
            ? List<CallStacks>.from(
                map["callStacks"].map((it) => CallStacks.fromJsonMap(it)))
            : null,
        callStackPerThread = map["callStackPerThread"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['callStacks'] = callStacks?.map((v) => v.toJson()).toList();
    data['callStackPerThread'] = callStackPerThread;
    return data;
  }
}
