import Flutter
import UIKit

public class AudiokitPlugin: NSObject, FlutterPlugin {
    
    let microphone = MicrophoneMonitor()
    
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "audiokit", binaryMessenger: registrar.messenger())
    let instance = AudiokitPlugin()
      
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
  case "getAmplitude":
        microphone.startMonitoring()
        print(microphone.amplitude)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
