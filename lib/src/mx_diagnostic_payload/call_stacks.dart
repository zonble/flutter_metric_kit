import 'package:flutter/foundation.dart';

import 'call_stack_root_frames.dart';

@immutable
class CallStacks {
  final bool? threadAttributed;
  final List<CallStackRootFrames>? callStackRootFrames;

  CallStacks.fromJsonMap(Map<String, dynamic> map)
      : threadAttributed = map["threadAttributed"],
        callStackRootFrames = map["callStackRootFrames"] != null
            ? List<CallStackRootFrames>.from(map["callStackRootFrames"]
                .map((it) => CallStackRootFrames.fromJsonMap(it)))
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['threadAttributed'] = threadAttributed;
    data['callStackRootFrames'] =
        callStackRootFrames?.map((v) => v.toJson()).toList();
    return data;
  }
}
