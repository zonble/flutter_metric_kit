import 'package:flutter/material.dart';
import 'package:flutter_metric_kit/flutter_metric_kit.dart';
import 'dart:developer' as developer;

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
        body: const Center(
          child: Text(''),
        ),
      ),
    );
  }
}
