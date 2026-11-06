import Foundation
import AnyCodable

/** Generated closed empty payload. */
public struct WorkoutControlPausePayload: Codable, JSONEncodable, Hashable {
    public init() {}
    public enum CodingKeys: String, CodingKey, CaseIterable { case unused = "__never_a_wire_field" }
    public init(from decoder: Decoder) throws {
        do {
            let raw = try decoder.singleValueContainer().decode([String: WorkoutControlWireValue].self)
            guard WorkoutControlWireGuard.accepts("WorkoutControlPausePayload",raw.mapValues(\.value)) else { throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
            let container = try decoder.container(keyedBy: CodingKeys.self)

        } catch { throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
    }

    public func encode(to encoder: Encoder) throws {
        do {
            var raw: [String: Any] = [:]

            guard WorkoutControlWireGuard.accepts("WorkoutControlPausePayload",raw) else { throw EncodingError.invalidValue("workout control wire shape",.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
        } catch { throw EncodingError.invalidValue("workout control wire shape",.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
        _ = encoder.container(keyedBy: CodingKeys.self)
    }
}
