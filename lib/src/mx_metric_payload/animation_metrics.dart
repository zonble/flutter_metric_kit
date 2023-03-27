import 'package:flutter/foundation.dart';

@immutable
class AnimationMetrics {
  final String scrollHitchTimeRatio;

  AnimationMetrics.fromJsonMap(Map<String, dynamic> map)
      : scrollHitchTimeRatio = map["scrollHitchTimeRatio"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['scrollHitchTimeRatio'] = scrollHitchTimeRatio;
    return data;
  }
}
