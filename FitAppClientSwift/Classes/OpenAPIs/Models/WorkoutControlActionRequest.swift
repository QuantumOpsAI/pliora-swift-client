import Foundation

/** Generated closed const-tagged union, with typed branches. */
public enum WorkoutControlActionRequest: Codable, JSONEncodable, Hashable {
    case typeWorkoutControlActionRequestOneOf(WorkoutControlActionRequestOneOf)
    case typeWorkoutControlActionRequestOneOf1(WorkoutControlActionRequestOneOf1)
    case typeWorkoutControlActionRequestOneOf2(WorkoutControlActionRequestOneOf2)
    case typeWorkoutControlActionRequestOneOf3(WorkoutControlActionRequestOneOf3)
    case typeWorkoutControlActionRequestOneOf4(WorkoutControlActionRequestOneOf4)
    case typeWorkoutControlActionRequestOneOf5(WorkoutControlActionRequestOneOf5)
    case typeWorkoutControlActionRequestOneOf6(WorkoutControlActionRequestOneOf6)
    case typeWorkoutControlActionRequestOneOf7(WorkoutControlActionRequestOneOf7)
    case typeWorkoutControlActionRequestOneOf8(WorkoutControlActionRequestOneOf8)
    private enum DiscriminatorCodingKey: String, CodingKey {
        case action = "action"
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DiscriminatorCodingKey.self)
        let tag = try container.decode(String.self, forKey: .action)
        switch tag {
        case "BEGIN_SET": self = .typeWorkoutControlActionRequestOneOf(try WorkoutControlActionRequestOneOf(from: decoder))
        case "COMPLETE_SET": self = .typeWorkoutControlActionRequestOneOf1(try WorkoutControlActionRequestOneOf1(from: decoder))
        case "SKIP_SET": self = .typeWorkoutControlActionRequestOneOf2(try WorkoutControlActionRequestOneOf2(from: decoder))
        case "END_REST_AND_BEGIN": self = .typeWorkoutControlActionRequestOneOf3(try WorkoutControlActionRequestOneOf3(from: decoder))
        case "APPLY_VALUES": self = .typeWorkoutControlActionRequestOneOf4(try WorkoutControlActionRequestOneOf4(from: decoder))
        case "ADJUST_REST_TARGET": self = .typeWorkoutControlActionRequestOneOf5(try WorkoutControlActionRequestOneOf5(from: decoder))
        case "PAUSE": self = .typeWorkoutControlActionRequestOneOf6(try WorkoutControlActionRequestOneOf6(from: decoder))
        case "RESUME": self = .typeWorkoutControlActionRequestOneOf7(try WorkoutControlActionRequestOneOf7(from: decoder))
        case "AMEND_LAST_SET": self = .typeWorkoutControlActionRequestOneOf8(try WorkoutControlActionRequestOneOf8(from: decoder))
        default: throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Unknown WorkoutControlActionRequest discriminator"))
        }
    }
    public func encode(to encoder: Encoder) throws {
        switch self {
        case .typeWorkoutControlActionRequestOneOf(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf1(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf2(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf3(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf4(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf5(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf6(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf7(let value): try value.encode(to: encoder)
        case .typeWorkoutControlActionRequestOneOf8(let value): try value.encode(to: encoder)
        }
    }
}
