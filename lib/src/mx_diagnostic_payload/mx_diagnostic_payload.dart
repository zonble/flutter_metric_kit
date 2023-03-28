import 'package:flutter/foundation.dart';

import 'cpu_exception_diagnostics.dart';
import 'crash_diagnostics.dart';
import 'disk_write_exception_diagnostics.dart';
import 'hang_diagnostics.dart';

@immutable
class MXDiagnosticPayload {
  final List<CrashDiagnostics>? crashDiagnostics;
  final String? timeStampEnd;
  final List<HangDiagnostics>? hangDiagnostics;
  final List<CpuExceptionDiagnostics>? cpuExceptionDiagnostics;
  final String? timeStampBegin;
  final List<DiskWriteExceptionDiagnostics>? diskWriteExceptionDiagnostics;

  MXDiagnosticPayload.fromJsonMap(Map<String, dynamic> map)
      : crashDiagnostics = map["crashDiagnostics"] != null
            ? List<CrashDiagnostics>.from(map["crashDiagnostics"]
                .map((it) => CrashDiagnostics.fromJsonMap(it)))
            : null,
        timeStampEnd = map["timeStampEnd"],
        hangDiagnostics = map["hangDiagnostics"] != null
            ? List<HangDiagnostics>.from(map["hangDiagnostics"]
                .map((it) => HangDiagnostics.fromJsonMap(it)))
            : null,
        cpuExceptionDiagnostics = map["cpuExceptionDiagnostics"] != null
            ? List<CpuExceptionDiagnostics>.from(map["cpuExceptionDiagnostics"]
                .map((it) => CpuExceptionDiagnostics.fromJsonMap(it)))
            : null,
        timeStampBegin = map["timeStampBegin"],
        diskWriteExceptionDiagnostics = map["diskWriteExceptionDiagnostics"] !=
                null
            ? List<DiskWriteExceptionDiagnostics>.from(
                map["diskWriteExceptionDiagnostics"]
                    .map((it) => DiskWriteExceptionDiagnostics.fromJsonMap(it)))
            : null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['crashDiagnostics'] =
        crashDiagnostics?.map((v) => v.toJson()).toList();
    data['timeStampEnd'] = timeStampEnd;
    data['hangDiagnostics'] = hangDiagnostics?.map((v) => v.toJson()).toList();
    data['cpuExceptionDiagnostics'] =
        cpuExceptionDiagnostics?.map((v) => v.toJson()).toList();
    data['timeStampBegin'] = timeStampBegin;
    data['diskWriteExceptionDiagnostics'] =
        diskWriteExceptionDiagnostics?.map((v) => v.toJson()).toList();
    return data;
  }
}
