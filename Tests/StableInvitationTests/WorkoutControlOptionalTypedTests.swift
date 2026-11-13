import XCTest
@testable import FitAppClientSwift

final class WorkoutControlOptionalTypedTests:XCTestCase {
    func testTypedNumberStatesAndDefaults() throws {
        let states:[WorkoutControlOptional<Double>]=[.absent,.null,.value(0),.value(8.5)]
        XCTAssertEqual(Set(states).count,4)
        for state in states {
            let target=ExecutionTargetValues(loadValue:nil,loadUnit:nil,reps:0,source:.prescription,expectedRpe:state)
            let actual=WorkoutSetValues(loadValue:nil,loadUnit:nil,reps:0,rpe:state)
            let targetWire=try CodableHelper.jsonEncoder.encode(target),actualWire=try CodableHelper.jsonEncoder.encode(actual)
            XCTAssertEqual(try CodableHelper.jsonDecoder.decode(ExecutionTargetValues.self,from:targetWire).expectedRpe,state)
            XCTAssertEqual(try CodableHelper.jsonDecoder.decode(WorkoutSetValues.self,from:actualWire).rpe,state)
        }
        XCTAssertEqual(ExecutionTargetValues(loadValue:nil,loadUnit:nil,reps:0,source:.prescription).expectedRpe,.absent)
        XCTAssertEqual(WorkoutSetValues(loadValue:nil,loadUnit:nil,reps:0).rpe,.absent)
    }
    func testTypedEnumStates() throws {
        let states:[WorkoutControlOptional<LoadBasis>]=[.absent,.null,.value(.total)]
        for state in states {
            var input=try CodableHelper.jsonDecoder.decode(SetExecutionSyncView.self,from:Data(#"{"viewType":"SET_EXECUTION","setExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d09","exerciseExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d08","prescribedSetId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d05","setIndex":1,"status":"COMPLETED","target":{"loadValue":20,"loadUnit":"KG","reps":12,"source":"PRESCRIPTION"},"actual":{"loadValue":22,"loadUnit":"KG","reps":10,"rpe":8},"executedVariantId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d06","equipmentInstanceId":null,"observation":null,"startedAt":"2026-11-03T09:59:00Z","completedAt":"2026-11-03T09:59:20Z"}"#.utf8))
            input.loadBasis=state
            let wire=try CodableHelper.jsonEncoder.encode(input)
            XCTAssertEqual(try CodableHelper.jsonDecoder.decode(SetExecutionSyncView.self,from:wire).loadBasis,state)
        }
    }
    func testTypedEncodingStillRefusesInvalidOptionalValues() throws {
        for kind in ["target-rpe","actual-rpe","unknown-basis"] {
            var input=try CodableHelper.jsonDecoder.decode(WorkoutControlView.self,from:Data(#"{"sessionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d01","prescriptionVersionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d02","revision":"opaque-control-c12","controlRevision":12,"sessionRevision":"opaque-session-1","bundleRevision":"opaque-bundle-a","serverNow":"2026-11-03T10:00:00Z","sessionStatus":"IN_PROGRESS","phase":"FINISHABLE","phaseId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d07","paused":false,"startedAt":"2026-11-03T09:50:00Z","lastRecordedAt":"2026-11-03T09:59:20Z","inactivity":{"activityAt":"2026-11-03T09:59:20Z","serverAnchor":"2026-11-03T10:00:00Z","inactiveElapsedMilliseconds":40000,"staleNoticeDueAt":"2026-11-03T11:59:20Z","interruptionDueAt":"2026-11-03T21:59:20Z","pauseExclusionLimitSeconds":3600,"pauseExclusionLimitReached":false},"completedSetCount":3,"totalSetCount":3,"allowedActions":["AMEND_LAST_SET"],"maxIntentAgeSeconds":30,"handoffReason":"FINISH_ON_PHONE","lastAcceptedOperationId":"operation-complete-synthetic-1","lastSet":{"setExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d09","revision":"opaque-set-5","setExecution":{"viewType":"SET_EXECUTION","setExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d09","exerciseExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d08","prescribedSetId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d05","setIndex":1,"status":"COMPLETED","target":{"loadValue":20,"loadUnit":"KG","reps":12,"source":"PRESCRIPTION"},"actual":{"loadValue":22,"loadUnit":"KG","reps":10,"rpe":8},"executedVariantId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d06","equipmentInstanceId":null,"observation":null,"startedAt":"2026-11-03T09:59:00Z","completedAt":"2026-11-03T09:59:20Z"},"amendEligible":true}}"#.utf8))
            switch kind {
            case "target-rpe": input.lastSet?.setExecution.target.expectedRpe = .value(-1)
            case "actual-rpe": input.lastSet?.setExecution.actual?.rpe = .value(11)
            default: input.lastSet?.setExecution.loadBasis = .value(.unknownDefaultOpenApi)
            }
            XCTAssertThrowsError(try CodableHelper.jsonEncoder.encode(input),kind)
        }
    }
}
