import 'package:flutter/foundation.dart';

import 'background_exit_data.dart';
import 'foreground_exit_data.dart';

/// Represents metrics about application exit patterns and reasons.
///
/// This class encapsulates comprehensive data about how and why the application
/// exits in different states (foreground vs background). Application exit
/// metrics are crucial for understanding app stability, user engagement
/// patterns, and identifying issues that cause unexpected terminations. These
/// metrics help developers optimize app lifecycle management and improve
/// overall app reliability.
@immutable
class ApplicationExitMetrics {
  /// Exit data collected when the application was terminated while in the
  /// background.
  ///
  /// Contains detailed information about background terminations including the
  /// reasons for termination (memory pressure, system cleanup, timeout),
  /// frequency of background exits, and associated metadata. Background exits
  /// are often system-initiated and can indicate issues with background
  /// processing efficiency or excessive resource usage.
  ///
  /// This can be null if no background exit data is available for the
  /// collection period.
  final BackgroundExitData? backgroundExitData;
  
  /// Exit data collected when the application was terminated while in the
  /// foreground.
  ///
  /// Contains detailed information about foreground terminations including
  /// user-initiated exits, crashes, system-forced terminations, and other
  /// reasons for foreground app termination. Foreground exits directly impact
  /// user experience and can indicate stability issues or user behavior
  /// patterns.
  ///
  /// This can be null if no foreground exit data is available for the
  /// collection period.
  final ForegroundExitData? foregroundExitData;

  /// Creates an [ApplicationExitMetrics] instance from a JSON map.
  /// 
  /// This constructor parses the provided [map] to extract application
  /// exit metrics from MetricKit metric payloads.
  /// 
  /// The [map] should contain:
  /// - `backgroundExitData`: An optional map containing background exit data
  /// - `foregroundExitData`: An optional map containing foreground exit data
  /// 
  /// This constructor is typically used when processing metric payloads
  /// received from MetricKit to analyze application exit patterns and
  /// identify potential stability or lifecycle management issues.
  ApplicationExitMetrics.fromJsonMap(Map<String, dynamic> map)
      : backgroundExitData = map["backgroundExitData"] != null
            ? BackgroundExitData.fromJsonMap(map["backgroundExitData"])
            : null,
        foregroundExitData = map["foregroundExitData"] != null
            ? ForegroundExitData.fromJsonMap(map["foregroundExitData"])
            : null;

  /// Converts this [ApplicationExitMetrics] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains:
  /// - `backgroundExitData`: Serialized background exit data (if available)
  /// - `foregroundExitData`: Serialized foreground exit data (if available)
  ///
  /// This method is essential for application lifecycle monitoring workflows,
  /// enabling the transmission of exit metrics to stability monitoring
  /// services, crash reporting platforms, or analytics systems. It's
  /// particularly valuable for tracking app termination patterns, identifying
  /// stability issues, understanding user behavior, and optimizing app
  /// lifecycle management.
  ///
  /// Exit metrics help developers distinguish between normal user-initiated
  /// exits and problematic system-forced terminations, enabling targeted
  /// improvements to app stability and resource management.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backgroundExitData'] = backgroundExitData?.toJson();
    data['foregroundExitData'] = foregroundExitData?.toJson();
    return data;
  }
}
