import XCTest
import Alamofire
@testable import FitAppClientSwift

private final class WWCProtocol: URLProtocol {
    static var body=Data()
    static var lastURLString:String?
    override class func canInit(with request:URLRequest)->Bool { request.url?.host == "wwc-codec.invalid" }
    override class func canonicalRequest(for request:URLRequest)->URLRequest { request }
    override func startLoading() {
        Self.lastURLString=request.url?.absoluteString
        let response=HTTPURLResponse(url:request.url!,statusCode:200,httpVersion:nil,headerFields:["Content-Type":"application/json"] )!
        client?.urlProtocol(self,didReceive:response,cacheStoragePolicy:.notAllowed)
        client?.urlProtocol(self,didLoad:Self.body)
        client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {}
}
private final class WWCBuilder<T:Decodable>:AlamofireDecodableRequestBuilder<T> {
    override func createAlamofireSession(interceptor:RequestInterceptor? = nil)->Alamofire.Session {
        let config=URLSessionConfiguration.ephemeral
        config.protocolClasses=[WWCProtocol.self]
        return Alamofire.Session(configuration:config,interceptor:interceptor)
    }
}
private struct WWCFactory:RequestBuilderFactory {
    func getNonDecodableBuilder<T>()->RequestBuilder<T>.Type { AlamofireRequestBuilder<T>.self }
    func getBuilder<T:Decodable>()->RequestBuilder<T>.Type { WWCBuilder<T>.self }
}

/// Real generated HTTP response/decoder factory; only the transport is synthetic.
final class WorkoutControlHTTPBoundaryTests:XCTestCase {
    func testBundleHTTPFactoryUsesTheTransitivePrecisionBoundary() {
        let base=FitAppClientSwiftAPI.basePath,factory=FitAppClientSwiftAPI.requestBuilderFactory
        defer {FitAppClientSwiftAPI.basePath=base;FitAppClientSwiftAPI.requestBuilderFactory=factory}
        FitAppClientSwiftAPI.basePath="http://wwc-codec.invalid/api/v1"
        FitAppClientSwiftAPI.requestBuilderFactory=WWCFactory()
        let template=#"{"bundleId":"01K000000000000000000B0001","bundleRevision":"bundle-rev-example-0002","generatedAt":"2026-05-18T10:36:20Z","sessionId":"0191b8e0-7c21-7b3a-9c6d-4f0a2b8e1d55","priority":"PINNED","items":[{"entityType":"WORKOUT_SESSION","entityId":"0191b8e0-7c21-7b3a-9c6d-4f0a2b8e1d55","kind":"UPSERT","revision":"3","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"WORKOUT_SESSION","sessionId":"0191b8e0-7c21-7b3a-9c6d-4f0a2b8e1d55","workoutAssignmentId":"01K00000000000000000000080","workoutId":"01K00000000000000000000070","prescriptionVersionId":"01K00000000000000000000007","status":"IN_PROGRESS","startedAt":"2026-05-18T07:31:04-03:00","completedAt":null,"lastRecordedAt":"2026-05-18T07:31:04-03:00","exerciseOrderPolicy":{"allowDefer":true,"allowReorder":true,"allowSkip":true,"requireSkipConfirmation":true}}},{"entityType":"WORKOUT_ASSIGNMENT","entityId":"01K00000000000000000000080","kind":"UPSERT","revision":"2","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"WORKOUT_ASSIGNMENT","assignmentId":"01K00000000000000000000080","workoutId":"01K00000000000000000000070","prescriptionVersionId":"01K00000000000000000000007","priority":"PINNED"}},{"entityType":"PRESCRIPTION_VERSION","entityId":"01K00000000000000000000007","kind":"UPSERT","revision":null,"asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"PRESCRIPTION_VERSION","prescriptionVersionId":"01K00000000000000000000007","publishedAt":"2026-05-15T14:00:00-03:00","workouts":[{"workoutId":"01K00000000000000000000070","name":"Treino A","focus":"Membros inferiores","exercises":[{"prescribedExerciseId":"01K000000000000000000P0001","exerciseId":"01K000000000000000000X0001","prescribedVariantId":"01K000000000000000000V0001","displayName":"Agachamento livre","position":1,"orderPolicy":"LOCKED","notes":"Mantenha o joelho alinhado com a ponta do pé.","sets":[{"prescribedSetId":"01K000000000000000000R0001","setIndex":1,"setType":"WORKING","repsMin":8,"repsMax":10,"target":{"loadValue":C10_NUMBER_TOKEN,"loadUnit":"KG","reps":10},"restSeconds":90,"restMinSeconds":60,"restMaxSeconds":90,"effortType":"RPE","effortValue":8,"note":"descida controlada"},{"prescribedSetId":"01K000000000000000000R0002","setIndex":2,"setType":"WORKING","repsMin":8,"repsMax":10,"target":{"loadValue":40,"loadUnit":"KG","reps":10},"restSeconds":90,"restMinSeconds":60,"restMaxSeconds":90}],"authorizedAlternativeIds":[]},{"prescribedExerciseId":"01K000000000000000000P0002","exerciseId":"01K000000000000000000X0002","prescribedVariantId":"01K000000000000000000V0002","displayName":"Leg press 45","position":2,"orderPolicy":"FLEXIBLE","sets":[{"prescribedSetId":"01K000000000000000000R0003","setIndex":1,"setType":"WORKING","target":{"loadValue":60,"loadUnit":"KG","reps":12},"restSeconds":60,"effortType":"RIR","effortValue":2}],"authorizedAlternativeIds":[]}]}]}},{"entityType":"EXERCISE","entityId":"01K000000000000000000X0001","kind":"UPSERT","revision":"4","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"EXERCISE","exerciseId":"01K000000000000000000X0001","name":"Agachamento livre","variantIds":["01K000000000000000000V0001"]}},{"entityType":"EXERCISE_VARIANT","entityId":"01K000000000000000000V0001","kind":"UPSERT","revision":"4","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"EXERCISE_VARIANT","variantId":"01K000000000000000000V0001","exerciseId":"01K000000000000000000X0001","name":"Barra livre","equipmentContextKey":"BARBELL","equipmentCodes":["BARBELL"]}},{"entityType":"EXERCISE","entityId":"01K000000000000000000X0002","kind":"UPSERT","revision":"4","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"EXERCISE","exerciseId":"01K000000000000000000X0002","name":"Leg press","variantIds":["01K000000000000000000V0002"]}},{"entityType":"EXERCISE_VARIANT","entityId":"01K000000000000000000V0002","kind":"UPSERT","revision":"4","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"EXERCISE_VARIANT","variantId":"01K000000000000000000V0002","exerciseId":"01K000000000000000000X0002","name":"Máquina 45 graus","equipmentContextKey":"LEG_PRESS_45","equipmentCodes":["LEG_PRESS"]}},{"entityType":"READ_MODEL_EXERCISE_HISTORY","entityId":"01K0000000000000000000RM11","kind":"UPSERT","revision":"3","asOf":"2026-05-18T07:30:00-03:00","origin":"PROJECTION","lastCommandId":null,"view":{"viewType":"READ_MODEL_EXERCISE_HISTORY","exerciseId":"01K000000000000000000X0001","variantId":"01K000000000000000000V0001","equipmentContextKey":"BARBELL","comparisonStatus":"COMPARED","entries":[{"sessionId":"0191a0e0-7c21-7b3a-9c6d-4f0a2b8e1d01","performedAt":"2026-05-11T07:50:12-03:00","setType":"WORKING","actual":{"loadValue":40,"loadUnit":"KG","reps":10,"rpe":8}},{"sessionId":"0191a0e0-7c21-7b3a-9c6d-4f0a2b8e1d01","performedAt":"2026-05-11T07:47:03-03:00","setType":"WORKING","actual":{"loadValue":40,"loadUnit":"KG","reps":10}},{"sessionId":"0191a0e0-7c21-7b3a-9c6d-4f0a2b8e1d00","performedAt":"2026-05-04T07:49:30-03:00","setType":"WORKING","actual":{"loadValue":37.5,"loadUnit":"KG","reps":10}}]}},{"entityType":"READ_MODEL_EXERCISE_HISTORY","entityId":"01K0000000000000000000RM12","kind":"UPSERT","revision":"1","asOf":"2026-05-18T07:30:00-03:00","origin":"PROJECTION","lastCommandId":null,"view":{"viewType":"READ_MODEL_EXERCISE_HISTORY","exerciseId":"01K000000000000000000X0002","variantId":"01K000000000000000000V0002","equipmentContextKey":"LEG_PRESS_45","comparisonStatus":"NO_COMPARABLE_EXECUTION","entries":[]}},{"entityType":"EXERCISE_EXECUTION","entityId":"01K000000000000000000E0001","kind":"UPSERT","revision":"2","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"EXERCISE_EXECUTION","exerciseExecutionId":"01K000000000000000000E0001","sessionId":"0191b8e0-7c21-7b3a-9c6d-4f0a2b8e1d55","prescribedExerciseId":"01K000000000000000000P0001","executedVariantId":"01K000000000000000000V0001","prescribedPosition":1,"executedPosition":1,"status":"IN_PROGRESS"}},{"entityType":"SET_EXECUTION","entityId":"01K000000000000000000S0001","kind":"UPSERT","revision":"7","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"SET_EXECUTION","setExecutionId":"01K000000000000000000S0001","exerciseExecutionId":"01K000000000000000000E0001","prescribedSetId":"01K000000000000000000R0001","setIndex":1,"status":"COMPLETED","target":{"loadValue":C10_NUMBER_TOKEN,"loadUnit":"KG","reps":10,"source":"PRESCRIPTION","expectedRpe":8},"actual":{"loadValue":C10_NUMBER_TOKEN,"loadUnit":"KG","reps":10,"rpe":8},"executedVariantId":"01K000000000000000000V0001","equipmentInstanceId":null,"observation":null,"startedAt":"2026-05-18T07:34:02-03:00","completedAt":"2026-05-18T07:34:48-03:00"}},{"entityType":"EXERCISE_EXECUTION","entityId":"01K000000000000000000E0002","kind":"UPSERT","revision":"2","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"EXERCISE_EXECUTION","exerciseExecutionId":"01K000000000000000000E0002","sessionId":"0191b8e0-7c21-7b3a-9c6d-4f0a2b8e1d55","prescribedExerciseId":"01K000000000000000000P0002","executedVariantId":"01K000000000000000000V0002","prescribedPosition":2,"executedPosition":2,"status":"DEFERRED"}},{"entityType":"DEFERRAL","entityId":"01K000000000000000000D0001","kind":"UPSERT","revision":"1","asOf":null,"origin":"FACT","lastCommandId":null,"view":{"viewType":"DEFERRAL","deferralId":"01K000000000000000000D0001","exerciseExecutionId":"01K000000000000000000E0002","status":"DEFERRED","prescribedPosition":2,"executedPosition":2}}]}"#
        for literal in ["0.5","1.0000000000000001","12345678901234567890.1234567890123456789","1e-400"] {
            WWCProtocol.body=Data(template.replacingOccurrences(of:"C10_NUMBER_TOKEN",with:literal).utf8)
            let done=expectation(description:"Bundle precision "+literal)
            StudentTrainingAPI.getStudentOfflineWorkoutBundle(sessionId:"session",apiResponseQueue:.global()) { body,error in
                if literal == "0.5" {XCTAssertNotNil(body);XCTAssertNil(error)}
                else {XCTAssertNil(body);XCTAssertNotNil(error)}
                done.fulfill()
            }
            wait(for:[done],timeout:10)
        }
    }
    func testHTTPFactoryValidatesOriginalDataBeforeFoundationRounding() {
        let base=FitAppClientSwiftAPI.basePath,factory=FitAppClientSwiftAPI.requestBuilderFactory
        defer {FitAppClientSwiftAPI.basePath=base;FitAppClientSwiftAPI.requestBuilderFactory=factory}
        FitAppClientSwiftAPI.basePath="http://wwc-codec.invalid/api/v1"
        FitAppClientSwiftAPI.requestBuilderFactory=WWCFactory()
        let valid=#"{"sessionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d01","prescriptionVersionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d02","revision":"opaque-control-c12","controlRevision":12,"sessionRevision":"opaque-session-1","bundleRevision":"opaque-bundle-a","serverNow":"2026-11-03T10:00:00Z","sessionStatus":"IN_PROGRESS","phase":"ACTIVE_SET","phaseId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d07","paused":false,"startedAt":"2026-11-03T09:50:00Z","lastRecordedAt":"2026-11-03T09:59:20Z","inactivity":{"activityAt":"2026-11-03T09:59:20Z","serverAnchor":"2026-11-03T10:00:00Z","inactiveElapsedMilliseconds":40000,"staleNoticeDueAt":"2026-11-03T11:59:20Z","interruptionDueAt":"2026-11-03T21:59:20Z","pauseExclusionLimitSeconds":3600,"pauseExclusionLimitReached":false},"completedSetCount":0,"totalSetCount":3,"allowedActions":["COMPLETE_SET","SKIP_SET","APPLY_VALUES","PAUSE"],"maxIntentAgeSeconds":30,"currentOccurrence":{"occurrenceId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d03","prescribedExerciseId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d04","prescribedSetId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d05","executedVariantId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d06","exerciseDisplayName":"Exercício sintético","position":1,"setIndex":1,"setType":"WORKING","prescribedSet":{"prescribedSetId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d05","setIndex":1,"setType":"WORKING","target":{"loadValue":20,"loadUnit":"KG","reps":12},"restSeconds":60},"loadBasis":null,"repsPerSide":false},"presentedTarget":{"loadValue":20,"loadUnit":"KG","reps":12,"source":"PRESCRIPTION"},"workingActualValues":{"loadValue":22,"loadUnit":"KG","reps":10},"exerciseExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d08","openSet":{"setExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d09","exerciseExecutionId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d08","revision":"opaque-set-4","openedAt":"2026-11-03T09:59:20Z"},"timer":{"timerId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d0a","phaseId":"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d07","kind":"SET","serverAnchor":"2026-11-03T10:00:00Z","activeElapsedMilliseconds":40000,"paused":false}}"#
        let fractional=valid.replacingOccurrences(of:#""controlRevision":12"#,with:#""controlRevision":9007199254740991.00000000000000000000000000000000001"#)
        XCTAssertNotEqual(valid,fractional)
        let dateOnly=valid.replacingOccurrences(of:#""serverNow":"2026-11-03T10:00:00Z""#,with:#""serverNow":"2026-11-04""#)
        XCTAssertNotEqual(valid,dateOnly)
        for (index,json) in [valid,fractional,dateOnly].enumerated() {
            WWCProtocol.body=Data(json.utf8)
            let done=expectation(description:"WWC HTTP (index)")
            WorkoutExecutionAPI.getStudentWorkoutControl(sessionId:"session",apiResponseQueue:.global()) { body,error in
                if index == 0 {XCTAssertNotNil(body);XCTAssertNil(error)}
                else {XCTAssertNil(body);XCTAssertNotNil(error)}
                done.fulfill()
            }
            wait(for:[done],timeout:10)
        }
    }
    /// UUID path segments must reach the wire in the canonical lowercase form the
    /// contract's [0-9a-f] patterns require; Foundation interpolates them uppercase.
    func testUUIDPathParameterSerializesCanonicalLowercase() {
        let base=FitAppClientSwiftAPI.basePath,factory=FitAppClientSwiftAPI.requestBuilderFactory
        defer {FitAppClientSwiftAPI.basePath=base;FitAppClientSwiftAPI.requestBuilderFactory=factory}
        FitAppClientSwiftAPI.basePath="http://wwc-codec.invalid/api/v1"
        FitAppClientSwiftAPI.requestBuilderFactory=WWCFactory()
        WWCProtocol.body=Data()
        let done=expectation(description:"receipt path")
        WorkoutExecutionAPI.getStudentWorkoutControlOperation(sessionId:"019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d01",operationId:UUID(uuidString:"019A4E10-7C21-7B3A-9C6D-4F0A2B8E1D0B")!,apiResponseQueue:.global()) { _,_ in done.fulfill() }
        wait(for:[done],timeout:10)
        XCTAssertEqual(WWCProtocol.lastURLString,"http://wwc-codec.invalid/api/v1/student/workout-sessions/019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d01/control/operations/019a4e10-7c21-7b3a-9c6d-4f0a2b8e1d0b")
    }
}
