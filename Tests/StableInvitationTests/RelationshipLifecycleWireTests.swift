import XCTest
@testable import FitAppClientSwift

/// Gerado por scripts/lib/relationship-lifecycle-wire.mjs. Não editar à mão.
final class RelationshipLifecycleWireTests: XCTestCase {
  private func request<T>(_ builder:RequestBuilder<T>) throws -> URLRequest {
    let concrete=try XCTUnwrap(builder as? AlamofireRequestBuilder<T>)
    return try XCTUnwrap(concrete.createURLRequest())
  }
  private var previousBasePath=""
  override func setUp() {
    super.setUp()
    previousBasePath=FitAppClientSwiftAPI.basePath
    FitAppClientSwiftAPI.basePath="http://127.0.0.1:1/api/v1"
  }
  override func tearDown() {
    FitAppClientSwiftAPI.basePath=previousBasePath
    super.tearDown()
  }

  func test_pausePersonalStudentRelationship_sendsNoBodyTheKeyAndIfMatchAndRetriesWithTheSameBytes() throws {
    let first=try request(RelationshipLifecycleAPI.pausePersonalStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-personal-pause",ifMatch:"rv-read"))
    XCTAssertEqual(first.httpMethod,"POST")
    XCTAssertEqual(first.url?.path,"/api/v1/personal/relationships/rel-1/pause")
    XCTAssertTrue(first.httpBody?.isEmpty ?? true)
    XCTAssertEqual(first.value(forHTTPHeaderField:"Idempotency-Key"),"logical-personal-pause")
    XCTAssertEqual(first.value(forHTTPHeaderField:"If-Match"),"rv-read")
    let retry=try request(RelationshipLifecycleAPI.pausePersonalStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-personal-pause",ifMatch:"rv-read"))
    XCTAssertEqual(retry.httpMethod,first.httpMethod)
    XCTAssertEqual(retry.url,first.url)
    XCTAssertEqual(retry.httpBody,first.httpBody)
    XCTAssertEqual(retry.allHTTPHeaderFields,first.allHTTPHeaderFields)
  }

  func test_resumePersonalStudentRelationship_sendsNoBodyTheKeyAndIfMatchAndRetriesWithTheSameBytes() throws {
    let first=try request(RelationshipLifecycleAPI.resumePersonalStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-personal-resume",ifMatch:"rv-read"))
    XCTAssertEqual(first.httpMethod,"POST")
    XCTAssertEqual(first.url?.path,"/api/v1/personal/relationships/rel-1/resumption")
    XCTAssertTrue(first.httpBody?.isEmpty ?? true)
    XCTAssertEqual(first.value(forHTTPHeaderField:"Idempotency-Key"),"logical-personal-resume")
    XCTAssertEqual(first.value(forHTTPHeaderField:"If-Match"),"rv-read")
    let retry=try request(RelationshipLifecycleAPI.resumePersonalStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-personal-resume",ifMatch:"rv-read"))
    XCTAssertEqual(retry.httpMethod,first.httpMethod)
    XCTAssertEqual(retry.url,first.url)
    XCTAssertEqual(retry.httpBody,first.httpBody)
    XCTAssertEqual(retry.allHTTPHeaderFields,first.allHTTPHeaderFields)
  }

  func test_endPersonalStudentRelationship_sendsNoBodyTheKeyAndIfMatchAndRetriesWithTheSameBytes() throws {
    let first=try request(RelationshipLifecycleAPI.endPersonalStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-personal-end",ifMatch:"rv-read"))
    XCTAssertEqual(first.httpMethod,"POST")
    XCTAssertEqual(first.url?.path,"/api/v1/personal/relationships/rel-1/end")
    XCTAssertTrue(first.httpBody?.isEmpty ?? true)
    XCTAssertEqual(first.value(forHTTPHeaderField:"Idempotency-Key"),"logical-personal-end")
    XCTAssertEqual(first.value(forHTTPHeaderField:"If-Match"),"rv-read")
    let retry=try request(RelationshipLifecycleAPI.endPersonalStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-personal-end",ifMatch:"rv-read"))
    XCTAssertEqual(retry.httpMethod,first.httpMethod)
    XCTAssertEqual(retry.url,first.url)
    XCTAssertEqual(retry.httpBody,first.httpBody)
    XCTAssertEqual(retry.allHTTPHeaderFields,first.allHTTPHeaderFields)
  }

  func test_pauseStudentRelationship_sendsNoBodyTheKeyAndIfMatchAndRetriesWithTheSameBytes() throws {
    let first=try request(RelationshipLifecycleAPI.pauseStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-student-pause",ifMatch:"rv-read"))
    XCTAssertEqual(first.httpMethod,"POST")
    XCTAssertEqual(first.url?.path,"/api/v1/student/relationships/rel-1/pause")
    XCTAssertTrue(first.httpBody?.isEmpty ?? true)
    XCTAssertEqual(first.value(forHTTPHeaderField:"Idempotency-Key"),"logical-student-pause")
    XCTAssertEqual(first.value(forHTTPHeaderField:"If-Match"),"rv-read")
    let retry=try request(RelationshipLifecycleAPI.pauseStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-student-pause",ifMatch:"rv-read"))
    XCTAssertEqual(retry.httpMethod,first.httpMethod)
    XCTAssertEqual(retry.url,first.url)
    XCTAssertEqual(retry.httpBody,first.httpBody)
    XCTAssertEqual(retry.allHTTPHeaderFields,first.allHTTPHeaderFields)
  }

  func test_resumeStudentRelationship_sendsNoBodyTheKeyAndIfMatchAndRetriesWithTheSameBytes() throws {
    let first=try request(RelationshipLifecycleAPI.resumeStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-student-resume",ifMatch:"rv-read"))
    XCTAssertEqual(first.httpMethod,"POST")
    XCTAssertEqual(first.url?.path,"/api/v1/student/relationships/rel-1/resumption")
    XCTAssertTrue(first.httpBody?.isEmpty ?? true)
    XCTAssertEqual(first.value(forHTTPHeaderField:"Idempotency-Key"),"logical-student-resume")
    XCTAssertEqual(first.value(forHTTPHeaderField:"If-Match"),"rv-read")
    let retry=try request(RelationshipLifecycleAPI.resumeStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-student-resume",ifMatch:"rv-read"))
    XCTAssertEqual(retry.httpMethod,first.httpMethod)
    XCTAssertEqual(retry.url,first.url)
    XCTAssertEqual(retry.httpBody,first.httpBody)
    XCTAssertEqual(retry.allHTTPHeaderFields,first.allHTTPHeaderFields)
  }

  func test_endStudentRelationship_sendsNoBodyTheKeyAndIfMatchAndRetriesWithTheSameBytes() throws {
    let first=try request(RelationshipLifecycleAPI.endStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-student-end",ifMatch:"rv-read"))
    XCTAssertEqual(first.httpMethod,"POST")
    XCTAssertEqual(first.url?.path,"/api/v1/student/relationships/rel-1/end")
    XCTAssertTrue(first.httpBody?.isEmpty ?? true)
    XCTAssertEqual(first.value(forHTTPHeaderField:"Idempotency-Key"),"logical-student-end")
    XCTAssertEqual(first.value(forHTTPHeaderField:"If-Match"),"rv-read")
    let retry=try request(RelationshipLifecycleAPI.endStudentRelationshipWithRequestBuilder(relationshipId:"rel-1",idempotencyKey:"logical-student-end",ifMatch:"rv-read"))
    XCTAssertEqual(retry.httpMethod,first.httpMethod)
    XCTAssertEqual(retry.url,first.url)
    XCTAssertEqual(retry.httpBody,first.httpBody)
    XCTAssertEqual(retry.allHTTPHeaderFields,first.allHTTPHeaderFields)
  }

  func testViewsDecodeTheSideThatPausedAndWhetherThisSideResumes() throws {
    let personal=try JSONDecoder().decode(PersonalStudentRelationshipView.self,from:Data(#"{"relationshipId":"01K00000000000000000000030","studentId":"01K00000000000000000000031","studentName":"Aluno Exemplo","status":"PAUSED","pausedBy":"PERSONAL","canResume":true,"revision":"rv-next"}"#.utf8))
    XCTAssertEqual(personal.pausedBy,.personal)
    XCTAssertTrue(personal.canResume)
    let student=try JSONDecoder().decode(StudentRelationshipView.self,from:Data(#"{"relationshipId":"01K00000000000000000000200","status":"PAUSED","pausedBy":"STUDENT","canResume":true,"personalDisplayName":"Personal Exemplo","revision":"rv-next"}"#.utf8))
    XCTAssertEqual(student.pausedBy,.student)
    XCTAssertTrue(student.canResume)
  }
  func testUnknownPausedByDecodesAsUnknownInsteadOfFailingTheRead() throws {
    let json=#"{"relationshipId":"01K00000000000000000000200","status":"PAUSED","pausedBy":"FUTURE_SIDE","canResume":true,"personalDisplayName":"Personal Exemplo","revision":"rv-next"}"#
    let student=try JSONDecoder().decode(StudentRelationshipView.self,from:Data(json.utf8))
    XCTAssertEqual(student.pausedBy,.unknownDefaultOpenApi)
  }
}
