import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_metric_kit/flutter_metric_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterMetricKit.events.listen((event) {
      developer.log(event);
    });
    FlutterMetricKit.startReceivingReports();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () async {
                    final reports = await FlutterMetricKit.getPastPayloads();
                    developer.log(reports.toString());
                  },
                  child: const Text('getPastPayloads')),
              TextButton(
                  onPressed: () async {
                    final reports =
                        await FlutterMetricKit.getPastDiagnosticPayloads();
                    developer.log(reports.toString());
                  },
                  child: const Text('getPastDiagnosticPayloads')),
            ],
          ),
        ),
      ),
    );
  }
}
