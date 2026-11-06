import Foundation
import AnyCodable

public struct WorkoutControlProblemDetails: Codable, JSONEncodable, Hashable {
    public enum Code: String, Codable, CaseIterable {
        case unauthenticated = "UNAUTHENTICATED"
        case forbidden = "FORBIDDEN"
        case relationshipPaused = "RELATIONSHIP_PAUSED"
        case relationshipInactive = "RELATIONSHIP_INACTIVE"
        case sessionNotFound = "SESSION_NOT_FOUND"
        case operationNotRecovered = "OPERATION_NOT_RECOVERED"
        case idempotencyConflict = "IDEMPOTENCY_CONFLICT"
        case executionIdentityDivergent = "EXECUTION_IDENTITY_DIVERGENT"
        case setAlreadyExecuted = "SET_ALREADY_EXECUTED"
        case sessionInterrupted = "SESSION_INTERRUPTED"
        case sessionNotInProgress = "SESSION_NOT_IN_PROGRESS"
        case controlActionNotAllowed = "CONTROL_ACTION_NOT_ALLOWED"
        case controlOccurrenceMismatch = "CONTROL_OCCURRENCE_MISMATCH"
        case preconditionFailed = "PRECONDITION_FAILED"
        case validationFailed = "VALIDATION_FAILED"
        case executionIdentityMismatch = "EXECUTION_IDENTITY_MISMATCH"
        case intentExpired = "INTENT_EXPIRED"
        case intentWindowExceeded = "INTENT_WINDOW_EXCEEDED"
        case trainingRateLimited = "TRAINING_RATE_LIMITED"
        case serviceUnavailable = "SERVICE_UNAVAILABLE"
        case internalError = "INTERNAL_ERROR"
    }
    public var type: String
    public var title: String
    public var status: Int
    public var code: Code
    public var correlationId: String
    public var fieldErrors: [FieldError]?
    public init(type: String,title: String,status: Int,code: Code,correlationId: String,fieldErrors: [FieldError]? = nil) {
        self.type=type; self.title=title; self.status=status; self.code=code; self.correlationId=correlationId; self.fieldErrors=fieldErrors
    }
    public enum CodingKeys: String, CodingKey, CaseIterable { case type,title,status,code,correlationId,fieldErrors }
    public init(from decoder: Decoder) throws {
        do {
            let raw = try decoder.singleValueContainer().decode([String: WorkoutControlWireValue].self)
            guard WorkoutControlWireGuard.accepts("WorkoutControlProblemDetails",raw.mapValues(\.value)) else { throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.type = try container.decode(String.self,forKey:.type)
            self.title = try container.decode(String.self,forKey:.title)
            self.status = try container.decode(Int.self,forKey:.status)
            self.code = try container.decode(Code.self,forKey:.code)
            self.correlationId = try container.decode(String.self,forKey:.correlationId)
            self.fieldErrors = try container.decodeIfPresent([FieldError].self,forKey:.fieldErrors)
        } catch { throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
    }

    public func encode(to encoder: Encoder) throws {
        do {
            var raw: [String: Any] = [:]
            raw["type"] = try WorkoutControlWireGuard.field(type)
            raw["title"] = try WorkoutControlWireGuard.field(title)
            raw["status"] = try WorkoutControlWireGuard.field(status)
            raw["code"] = try WorkoutControlWireGuard.field(code)
            raw["correlationId"] = try WorkoutControlWireGuard.field(correlationId)
            if let value=fieldErrors { raw["fieldErrors"] = try WorkoutControlWireGuard.field(value) }
            guard WorkoutControlWireGuard.accepts("WorkoutControlProblemDetails",raw) else { throw EncodingError.invalidValue("workout control wire shape",.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
        } catch { throw EncodingError.invalidValue("workout control wire shape",.init(codingPath: [], debugDescription: "Invalid workout control wire shape")) }
        var c=encoder.container(keyedBy:CodingKeys.self)
        try c.encode(type,forKey:.type);try c.encode(title,forKey:.title);try c.encode(status,forKey:.status);try c.encode(code,forKey:.code);try c.encode(correlationId,forKey:.correlationId);try c.encodeIfPresent(fieldErrors,forKey:.fieldErrors)
    }
}
