import Flutter
import UIKit
import MetricKit

enum FlutterMetricKitPluginAction : String {
    case startReceivingReports = "start_receiving_reports"
    case stopReceivingReports = "stop_receiving_reports"
    case getPastPayloads = "get_past_payloads"
    case getPastDiagnosticPayloads = "get_diagnostic_past_payloads"
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
                MXMetricManager.shared.add(self)
                result(true)
            } else {
                result(FlutterError(code: "-2", message: "Not supported", details: "You can only call the method on iOS 13 and above"))
            }
        case .stopReceivingReports:
            if #available(iOS 13.0, *) {
                MXMetricManager.shared.remove(self)
                result(true)
            } else {
                result(FlutterError(code: "-2", message: "Not supported", details: "You can only call the method on iOS 14 and above"))
            }
        case .getPastPayloads:
            if #available(iOS 13.0, *) {
                let payloads = MXMetricManager.shared.pastPayloads
                let objects = payloads.map {
                    let data = $0.jsonRepresentation()
                    let object = try? JSONSerialization.jsonObject(with: data)
                    return object ?? [:]
                }
                guard let json = try? JSONSerialization.data(withJSONObject: objects) else {
                    result(FlutterError(code: "-3", message: "Invalid data", details: ""))
                    return
                }
                let string = String(data: json, encoding: .utf8)
                result(string)
            } else {
                result(FlutterError(code: "-2", message: "Not supported", details: "You can only call the method on iOS 13 and above"))
            }
        case .getPastDiagnosticPayloads:
            if #available(iOS 14.0, *) {
                let payloads = MXMetricManager.shared.pastDiagnosticPayloads
                let objects = payloads.map {
                    let data = $0.jsonRepresentation()
                    let object = try? JSONSerialization.jsonObject(with: data)
                    return object ?? [:]
                }
                guard let json = try? JSONSerialization.data(withJSONObject: objects) else {
                    result(FlutterError(code: "-3", message: "Invalid data", details: ""))
                    return
                }
                let string = String(data: json, encoding: .utf8)
                result(string)
            } else {
                result(FlutterError(code: "-2", message: "Not supported", details: "You can only call the method on iOS 14 and above"))
            }
        }
    }

    @available(iOS 13.0, *)
    public func didReceive(_ payloads: [MXMetricPayload]) {
        let jsonArray = payloads.map {
            let data = $0.jsonRepresentation()
            let object = try? JSONSerialization.jsonObject(with: data)
            return object ?? [:]
        }
        let dict:[String:Any] = [
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
        let jsonArray = payloads.map {
            let data = $0.jsonRepresentation()
            let object = try? JSONSerialization.jsonObject(with: data)
            return object ?? [:]
        }
        let dict:[String:Any] = [
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
