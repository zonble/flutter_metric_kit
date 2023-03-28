/// Represents all kinds of payloads that can be received.
abstract class Payload {
  /// Converts to JSON.
  Map<String, dynamic> toJson();
}
