import Flutter
import UIKit
import AVFoundation

public class AvkitPlugin: NSObject, FlutterPlugin {
    private enum Constants {
        static let name = "avkit"
    }

    private let audioPlayer: AudioPlayerType = AudioPlayer.shared(player: AVPlayer(playerItem: nil))
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: Constants.name,
                                           binaryMessenger: registrar.messenger())
        let instance = AvkitPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall,
                       result: @escaping FlutterResult) {

        do {
            let method = try Action.get(call.method,
                                        arguments: call.arguments)
            switch method {
            case let .setURL(url):
                guard let url = url else {
                    errorHandler(result: result)
                    return
                }
                audioPlayer.set(url: url)
                result(true)
            case .play:
                audioPlayer.play()
                result(true)
            case .pause:
                audioPlayer.pause()
                result(true)
            default:
                errorHandler(result: result)
            }
        } catch {
            errorHandler(result: result)
        }
    }

    private func errorHandler(result: @escaping FlutterResult) {
        // TODO: Error Handler
        result(false)
    }
}
