import Foundation

/// Exact RFC3339 literal. Fraction digits and the original offset survive retries.
public struct WorkoutControlTimestamp: Codable, JSONEncodable, Hashable {
    public let rawValue: String
    public init(rawValue: String) throws {
        guard WorkoutControlWireGuard.fullTimestamp(rawValue) else {
            throw DecodingError.dataCorrupted(.init(codingPath:[],debugDescription:"Invalid workout control timestamp"))
        }
        self.rawValue=rawValue
    }
    public init(from decoder: Decoder) throws {
        try self.init(rawValue:decoder.singleValueContainer().decode(String.self))
    }
    public func encode(to encoder: Encoder) throws {
        var container=encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
