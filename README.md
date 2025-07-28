# flutter_metric_kit

2025 and onwards © Weizhong Yang a.k.a zonble

Flutter wrapper for [MetricKit](https://developer.apple.com/documentation/metrickit) on iOS and macOS.

## Overview

`flutter_metric_kit` provides a Dart interface to Apple's MetricKit, allowing
Flutter apps to collect and analyze advanced performance and diagnostics metrics
from iOS and macOS devices. This plugin is useful for monitoring app
performance, resource usage, and crash diagnostics in production environments.

## Features

- Collects a wide range of metrics, including:
  - CPU, memory, GPU, and disk I/O usage
  - App launch and responsiveness metrics
  - Animation and display performance
  - Network transfer statistics
  - Location activity and cellular condition metrics
  - Signpost and custom event metrics
  - Crash and hang diagnostics
  - Device and app metadata
- Provides strongly-typed Dart models for all MetricKit payloads
- Supports JSON serialization for easy storage and analysis
- Designed for extensibility and maintainability

## Getting Started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_metric_kit: ^<latest_version>
```

Import the package:

```dart
import 'package:flutter_metric_kit/flutter_metric_kit.dart';
```

## Usage Example

```dart
// Initialize and fetch metrics (example)
final metrics = await FlutterMetricKit.instance.startReceivingReports();
print(metrics.cpuMetrics?.toJson());
```

## Platform Support

- iOS 12.0+
- macOS 12.0+

## Documentation

- All public APIs are documented in the source code for clarity and maintainability.
- See the [MetricKit
  documentation](https://developer.apple.com/documentation/metrickit) for
  details on the underlying metrics.

## Contributing

Contributions are welcome! Please open issues or pull requests for bug fixes, improvements, or new features.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
