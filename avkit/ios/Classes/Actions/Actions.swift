import Foundation
private enum ErrorHandler: Error {
    case URLArgumentIsNil
}
enum Action {
    case setURL(URL?)
    case play
    case pause
    case unknown

    static func get(_ rawValue: String, arguments: Any?) throws -> Action {
        switch rawValue {
        case "playAudio":
            return .play
        case "pauseAudio":
            return .pause
        case "setURL":
            guard let dict = arguments as? [String: AnyHashable?],
                  let url = dict["url"] as? String else { throw ErrorHandler.URLArgumentIsNil }
            return .setURL(URL(string: url))
        default:
            return .unknown
        }
    }
}
