import AVFoundation
public protocol AVPlayerType {
    func replaceCurrentItem(with: AVPlayerItem?)
    func play()
    func pause()
}
extension AVPlayer: AVPlayerType {}
