import Foundation

/// Generated wire presence for an optional nullable WWC scalar. Zero is .value(0).
public enum WorkoutControlOptional<Value: Codable & Hashable>: Codable, Hashable {
    case absent
    case null
    case value(Value)
    public init(from decoder: Decoder) throws {
        let container=try decoder.singleValueContainer()
        self=container.decodeNil() ? .null : .value(try container.decode(Value.self))
    }
    public func encode(to encoder: Encoder) throws {
        var container=encoder.singleValueContainer()
        switch self {
        case .absent: throw EncodingError.invalidValue(self,.init(codingPath:encoder.codingPath,debugDescription:"Absent workout control property requires a keyed container"))
        case .null: try container.encodeNil()
        case .value(let value): try container.encode(value)
        }
    }
}

extension KeyedDecodingContainer {
    public func decode<Value>(_ type: WorkoutControlOptional<Value>.Type,forKey key: Key) throws -> WorkoutControlOptional<Value> {
        guard contains(key) else {return .absent}
        if try decodeNil(forKey:key) {return .null}
        return .value(try decode(Value.self,forKey:key))
    }
}
extension KeyedEncodingContainer {
    public mutating func encode<Value>(_ value: WorkoutControlOptional<Value>,forKey key: Key) throws {
        switch value {
        case .absent: break
        case .null: try encodeNil(forKey:key)
        case .value(let value): try encode(value,forKey:key)
        }
    }
}
