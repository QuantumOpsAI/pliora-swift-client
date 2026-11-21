import Foundation
import AnyCodable

/** Generated closed empty request body: the wire is exactly {}. */
public struct NewsletterPersonalPresentationRequest: Codable, JSONEncodable, Hashable {
    public init() {}
    private struct AnyKey: CodingKey {
        var stringValue: String
        var intValue: Int? { nil }
        init?(stringValue: String) { self.stringValue = stringValue }
        init?(intValue: Int) { nil }
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyKey.self)
        guard container.allKeys.isEmpty else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "NewsletterPersonalPresentationRequest is a closed empty object"))
        }
    }
    public func encode(to encoder: Encoder) throws {
        _ = encoder.container(keyedBy: AnyKey.self)
    }
}
