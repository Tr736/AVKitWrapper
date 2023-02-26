import Foundation
import AVFoundation
public protocol AudioPlayerType {
    func play()
    func pause()
    func set(url: URL)
}

struct AudioPlayer: AudioPlayerType {
    public static var instance: AudioPlayer?

    public static func shared(player: AVPlayerType) -> AudioPlayer {
        if let instance = instance {
            return instance
        }
        let instance = AudioPlayer(player: player)
        self.instance = instance
        return instance
    }

    private let player: AVPlayerType

    private init(player: AVPlayerType) {
        self.player = player
    }

    public func set(url: URL) {
        let item = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: item)
    }

    public func play() {
        player.play()
    }

    public func pause() {
        player.pause()
    }
}

