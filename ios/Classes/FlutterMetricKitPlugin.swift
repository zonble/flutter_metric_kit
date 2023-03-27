import Flutter
import UIKit
import MetricKit

enum FlutterMetricKitPluginAction : String {
    case startReceivingReports = "start_receiving_reports"
    case stopReceivingReports = "stop_receiving_reports"

}

/// The plugin that subscribe to MetricKit events.
public class FlutterMetricKitPlugin: NSObject, FlutterPlugin, MXMetricManagerSubscriber, FlutterStreamHandler {

    var sink: FlutterEventSink?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_metric_kit", binaryMessenger: registrar.messenger())
        let eventChannel = FlutterEventChannel(name: "flutter_metric_kit.events", binaryMessenger: registrar.messenger())
        let instance = FlutterMetricKitPlugin()

        registrar.addMethodCallDelegate(instance, channel: channel)
        eventChannel.setStreamHandler(instance)

    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let action = FlutterMetricKitPluginAction.init(rawValue: call.method) else {
            result(FlutterError(code: "-1", message: "Not implemented", details: "The method is not implemented"))
            return
        }
        switch action {
        case .startReceivingReports:
            if #available(iOS 13.0, *) {
                let shared = MXMetricManager.shared
                shared.add(self)
            }

        case .stopReceivingReports:
            if #available(iOS 13.0, *) {
                let shared = MXMetricManager.shared
                shared.remove(self)
            }
        }
    }

    @available(iOS 13.0, *)
    public func didReceive(_ payloads: [MXMetricPayload]) {
        let jsonArray = payloads.map { $0.jsonRepresentation()}
        let dict:[String:AnyHashable] = [
            "name": "MXMetricPayload",
            "payloads": jsonArray
        ]
        guard let data = try? JSONSerialization.data(withJSONObject: dict) else {
            return
        }
        let string = String(data: data, encoding: .utf8)
        sink?(string)
    }


    @available(iOS 14.0, *)
    public func didReceive(_ payloads: [MXDiagnosticPayload]) {
        let jsonArray = payloads.map { $0.jsonRepresentation()}
        let dict:[String:AnyHashable] = [
            "name": "MXDiagnosticPayload",
            "payloads": jsonArray
        ]
        guard let data = try? JSONSerialization.data(withJSONObject: dict) else {
            return
        }
        let string = String(data: data, encoding: .utf8)
        sink?(string)
    }

    // MARK: - Event channel

    public func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        sink = events
        return nil
    }

    public func onCancel(withArguments arguments: Any?) -> FlutterError? {
        sink = nil
        return nil
    }

}
