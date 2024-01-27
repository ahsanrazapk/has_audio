import Flutter
import UIKit
import AVFoundation

public class HasAudioPlugin: NSObject, FlutterPlugin {
    private let channelName = "com.falcon.has_audio"

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: channelName, binaryMessenger: registrar.messenger())
        let instance = HasAudioPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "hasAudio" {
            if let args = call.arguments as? Dictionary<String, Any>,
               let videoPath = args["videoPath"] as? String,
               let url = URL(string: videoPath) {
                result(hasAudioTrack(videoURL: url))
            } else {
                result(false)
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func hasAudioTrack(videoURL: URL) -> Bool {
        let asset = AVAsset(url: videoURL)
        let audioTracks = asset.tracks(withMediaType: .audio)
        return !audioTracks.isEmpty
    }
}
