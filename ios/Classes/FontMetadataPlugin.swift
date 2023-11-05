import Flutter
import UIKit

public class FontMetadataPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channelName = "alibahareh.flutter.plugins.fontmetadata/channel"
    let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
    let instance = FontMetadataPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getFontName":
      if let args = call.arguments as? [String: Any],
         let path = args["path"] as? String {
        // Instantiate FontMetadata with the path.
        let fontMetadata: FontMetadata = FontMetadata(path: path)
        // Get the font family name.
        if let fontName = fontMetadata.getFontName() {
          // Return the font name to the Flutter side.
          result(fontName)
        } else {
          // Return an error or a message indicating that the font name could not be retrieved.
          result(FlutterError(code: "UNAVAILABLE",
                              message: "Could not retrieve the font family name.",
                              details: nil))
        }
      } else {
        // Return an error or a message indicating that the input was invalid.
        result(FlutterError(code: "INVALID_INPUT",
                            message: "Invalid input, expected a valid path.",
                            details: nil))
      }


    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
