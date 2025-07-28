import 'package:flutter/foundation.dart';

/// Contains comprehensive metadata associated with diagnostic events.
/// 
/// This class encapsulates various pieces of contextual information that
/// accompany diagnostic events from MetricKit, such as crashes, hangs, or
/// CPU exceptions. The metadata provides essential context about the
/// application, device, and system state at the time of the diagnostic event,
/// which is crucial for effective debugging and analysis.
@immutable
class DiagnosticMetaData {
  /// The build version of the application when the diagnostic event occurred.
  /// 
  /// This typically corresponds to the build number or internal version
  /// identifier used by the development team, which helps correlate
  /// diagnostic events with specific application builds.
  final String? appBuildVersion;
  
  /// The user-facing version of the application.
  /// 
  /// This is the version string displayed to users (e.g., "1.2.3"),
  /// which helps identify which public release of the application
  /// experienced the diagnostic event.
  final String? appVersion;
  
  /// The region format setting of the device.
  /// 
  /// Indicates the locale and regional settings configured on the device,
  /// which can be relevant for issues related to localization, number
  /// formatting, or region-specific functionality.
  final String? regionFormat;
  
  /// The numeric code representing the type of exception that occurred.
  ///
  /// This value corresponds to system-defined exception type constants that
  /// categorize the nature of the diagnostic event (e.g., EXC_BAD_ACCESS,
  /// EXC_CRASH, etc.). Used primarily for crash and exception diagnostics.
  final int? exceptionType;
  
  /// The version of the operating system.
  /// 
  /// Provides the OS version string (e.g., "iOS 15.0", "macOS 12.1")
  /// to help identify OS-specific issues or compatibility problems.
  final String? osVersion;
  
  /// The type/model of the device.
  ///
  /// Identifies the specific device model (e.g., "iPhone13,2",
  /// "MacBookPro18,1") which is valuable for identifying device-specific issues
  /// or performance characteristics.
  final String? deviceType;
  
  /// The signal number associated with the diagnostic event.
  ///
  /// For crash diagnostics, this represents the Unix signal that caused the
  /// termination (e.g., SIGSEGV for segmentation violation, SIGABRT for abort).
  /// This is a key piece of information for understanding the nature of
  /// crashes.
  final int? signal;
  
  /// The specific exception code providing additional detail about the
  /// exception.
  ///
  /// Works in conjunction with [exceptionType] to provide more granular
  /// information about what specifically went wrong (e.g., memory access
  /// violations, arithmetic errors, etc.).
  final int? exceptionCode;
  
  /// The processor architecture of the platform.
  ///
  /// Indicates the CPU architecture (e.g., "arm64", "x86_64") which can be
  /// relevant for architecture-specific bugs or performance issues.
  final String? platformArchitecture;
  
  /// The reason for application termination.
  ///
  /// Provides a high-level description of why the application was terminated,
  /// such as system-initiated termination, memory pressure, watchdog timeout,
  /// or user-initiated termination.
  final String? terminationReason;
  
  /// Information about the virtual memory region involved in the diagnostic event.
  /// 
  /// Contains details about memory regions, addresses, and memory-related
  /// context that can be crucial for debugging memory-related issues,
  /// crashes, or exceptions.
  final String? virtualMemoryRegionInfo;

  /// Creates a [DiagnosticMetaData] instance from a JSON map.
  ///
  /// This constructor parses the provided [map] to extract diagnostic metadata
  /// from MetricKit diagnostic payloads.
  ///
  /// The [map] should contain any combination of the following fields:
  /// - `appBuildVersion`: Application build version string
  /// - `appVersion`: User-facing application version string
  /// - `regionFormat`: Device region format setting
  /// - `exceptionType`: Numeric exception type code
  /// - `osVersion`: Operating system version string
  /// - `deviceType`: Device model/type identifier
  /// - `signal`: Unix signal number (for crashes)
  /// - `exceptionCode`: Specific exception code
  /// - `platformArchitecture`: CPU architecture string
  /// - `terminationReason`: Reason for application termination
  /// - `virtualMemoryRegionInfo`: Virtual memory region details
  ///
  /// All fields are optional and will be null if not present in the map.
  DiagnosticMetaData.fromJsonMap(Map<String, dynamic> map)
      : appBuildVersion = map["appBuildVersion"],
        appVersion = map["appVersion"],
        regionFormat = map["regionFormat"],
        exceptionType = map["exceptionType"],
        osVersion = map["osVersion"],
        deviceType = map["deviceType"],
        signal = map["signal"],
        exceptionCode = map["exceptionCode"],
        platformArchitecture = map["platformArchitecture"],
        terminationReason = map["terminationReason"],
        virtualMemoryRegionInfo = map["virtualMemoryRegionInfo"];

  /// Converts this [DiagnosticMetaData] instance to a JSON map.
  ///
  /// Returns a [Map<String, dynamic>] representation that can be serialized to
  /// JSON or used for data transmission. The returned map contains all
  /// available diagnostic metadata fields:
  /// - `appBuildVersion`: Application build version (if available)
  /// - `appVersion`: User-facing application version (if available)
  /// - `regionFormat`: Device region format setting (if available)
  /// - `exceptionType`: Exception type code (if available)
  /// - `osVersion`: Operating system version (if available)
  /// - `deviceType`: Device model/type (if available)
  /// - `signal`: Unix signal number (if available)
  /// - `exceptionCode`: Exception code (if available)
  /// - `platformArchitecture`: CPU architecture (if available)
  /// - `terminationReason`: Termination reason (if available)
  /// - `virtualMemoryRegionInfo`: Memory region details (if available)
  ///
  /// This method is essential for transmitting diagnostic metadata to crash
  /// reporting services, analytics platforms, logging systems, or when
  /// persisting diagnostic information for later analysis. The rich metadata
  /// helps developers understand the context and circumstances of diagnostic
  /// events.
  ///
  /// Returns: A map containing all available diagnostic metadata fields.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appBuildVersion'] = appBuildVersion;
    data['appVersion'] = appVersion;
    data['regionFormat'] = regionFormat;
    data['exceptionType'] = exceptionType;
    data['osVersion'] = osVersion;
    data['deviceType'] = deviceType;
    data['signal'] = signal;
    data['exceptionCode'] = exceptionCode;
    data['platformArchitecture'] = platformArchitecture;
    data['terminationReason'] = terminationReason;
    data['virtualMemoryRegionInfo'] = virtualMemoryRegionInfo;
    return data;
  }
}
