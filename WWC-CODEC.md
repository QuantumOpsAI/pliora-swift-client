# Workout control wire boundary

Use the SDK CodableHelper.decode/jsonDecoder (also used by the HTTP request builder). WWC and contract-derived ancestor roots validate original UTF-8 JSON numeric lexemes before Foundation conversion. Arbitrary external Decoder implementations cannot expose those lexemes and do not provide this >38-digit guarantee. Other DTOs retain the existing decoder behavior and formatter.

WorkoutControlTimestamp preserves the original RFC3339 literal in WWC models and in SetExecutionSyncView.startedAt/completedAt. Convert explicitly for display; retain rawValue for immutable deadlines and replay. Valid wire values outside a native DTO numeric range or precision fail decoding explicitly; the schema is not narrowed. For number fields backed by Double, the boundary compares the original mathematical number with the canonical native JSON roundtrip before constructing a DTO. A valid high-precision value is refused locally when that roundtrip would change the payload; this is a native SDK representation limit, not a JSON/schema violation. Integer fields keep their existing exact rules.

## Optional nullable properties

`ExecutionTargetValues.expectedRpe` and `WorkoutSetValues.rpe` use `WorkoutControlOptional<Double>`. `SetExecutionSyncView.loadBasis` uses `WorkoutControlOptional<LoadBasis>`. Their constructor default is `.absent`. A missing JSON key decodes to `.absent`, an explicit JSON null to `.null`, and a non-null scalar to `.value(value)`, including numeric zero. Encoding preserves the same key presence.

Map all three cases explicitly when converting these properties. For example, `.absent`, `.null` and `.value(0)` are distinct values of `WorkoutControlOptional<Double>`.
