import XCTest
@testable import FitAppClientSwift

final class StableInvitationSerializationTests: XCTestCase {
  private func request<T>(_ builder:RequestBuilder<T>) throws -> URLRequest {
    let concrete=try XCTUnwrap(builder as? AlamofireRequestBuilder<T>)
    return try XCTUnwrap(concrete.createURLRequest())
  }
  private func payload(_ request:URLRequest) throws -> [String:Any] {
    let data=try XCTUnwrap(request.httpBody)
    XCTAssertEqual(request.value(forHTTPHeaderField:"Content-Type"),"application/json")
    return try XCTUnwrap(JSONSerialization.jsonObject(with:data) as? [String:Any])
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
  func testPresetCreateAndRenewalHTTPPayloads() throws {
    for days in [StudentInvitationDaysValidity.Days._7, ._15, ._30] {
      let validity=StudentInvitationValidity.typeStudentInvitationDaysValidity(.init(days:days))
      let input=CreateStudentInvitationRequest(inviteeEmail:"synthetic@example.invalid",validity:validity)
      let created=try request(StudentInvitationsAPI.createPersonalStudentInvitationWithRequestBuilder(idempotencyKey:"logical-create",createStudentInvitationRequest:input))
      XCTAssertEqual(created.httpMethod,"POST")
      XCTAssertNil(created.value(forHTTPHeaderField:"If-Match"))
      let wire=try XCTUnwrap(try payload(created)["validity"] as? [String:Any])
      XCTAssertEqual(Set(wire.keys),["days"])
      XCTAssertEqual(wire["days"] as? Int,days.rawValue)
      let renewal=RenewPersonalStudentInvitationRequest(validity:validity,sendEmail:true)
      let renewed=try request(StudentInvitationsAPI.renewPersonalStudentInvitationWithRequestBuilder(invitationId:"opaque-id",idempotencyKey:"logical-renew",ifMatch:"\"etag-literal\"",renewPersonalStudentInvitationRequest:renewal))
      XCTAssertEqual(renewed.value(forHTTPHeaderField:"If-Match"),"\"etag-literal\"")
      let body=try payload(renewed)
      XCTAssertEqual(body["sendEmail"] as? Bool,true)
      let renewedWire=try XCTUnwrap(body["validity"] as? [String:Any])
      XCTAssertEqual(Set(renewedWire.keys),["days"])
      XCTAssertEqual(renewedWire["days"] as? Int,days.rawValue)
    }
  }
  func testCustomDatePreservesCivilDateAndIanaZoneInHTTPBody() throws {
    let validity=StudentInvitationValidity.typeStudentInvitationDateValidity(.init(date:"2026-11-30",timeZone:"America/Sao_Paulo"))
    let create=CreateStudentInvitationRequest(inviteeEmail:"synthetic@example.invalid",validity:validity)
    let creation=try request(StudentInvitationsAPI.createPersonalStudentInvitationWithRequestBuilder(idempotencyKey:"logical-create",createStudentInvitationRequest:create))
    let renewal=RenewPersonalStudentInvitationRequest(validity:validity,sendEmail:false)
    let renewed=try request(StudentInvitationsAPI.renewPersonalStudentInvitationWithRequestBuilder(invitationId:"opaque-id",idempotencyKey:"logical-renew",ifMatch:"\"etag-literal\"",renewPersonalStudentInvitationRequest:renewal))
    for http in [creation,renewed] {
      let json=try XCTUnwrap(try payload(http)["validity"] as? [String:Any])
      XCTAssertEqual(Set(json.keys),["date","timeZone"])
      XCTAssertEqual(json["date"] as? String,"2026-11-30")
      XCTAssertEqual(json["timeZone"] as? String,"America/Sao_Paulo")
    }
    XCTAssertEqual(try payload(renewed)["sendEmail"] as? Bool,false)
    XCTAssertEqual(renewed.value(forHTTPHeaderField:"If-Match"),"\"etag-literal\"")
  }
  func testMixedExtraMissingAndNonIntegerShapesRejected() throws {
    for json in ["{}","{\"days\":7,\"date\":\"2026-11-30\",\"timeZone\":\"UTC\"}","{\"days\":7,\"extra\":true}","{\"date\":\"2026-11-30\"}","{\"days\":8}","{\"days\":\"7\"}","{\"days\":null}","{\"days\":true}","{\"date\":null,\"timeZone\":\"UTC\"}","{\"date\":7,\"timeZone\":\"UTC\"}","{\"date\":true,\"timeZone\":\"UTC\"}","{\"date\":\"2026-11-30\",\"timeZone\":null}","{\"date\":\"2026-11-30\",\"timeZone\":7}","{\"date\":\"2026-11-30\",\"timeZone\":true}","{\"date\":\"2026-11-30\",\"timeZone\":\"UTC\",\"extra\":true}"] {
      XCTAssertThrowsError(try JSONDecoder().decode(StudentInvitationValidity.self,from:Data(json.utf8)))
    }
    let invalid=StudentInvitationValidity.typeStudentInvitationDaysValidity(.init(days:.unknownDefaultOpenApi))
    XCTAssertThrowsError(try JSONEncoder().encode(invalid))
  }
  func testSyncMutationsRequireLiteralItemRevisionInTypedEnvelopes() throws {
    let decoder=JSONDecoder();decoder.dateDecodingStrategy = .iso8601
    let encoder=JSONEncoder();encoder.dateEncodingStrategy = .iso8601
    let etag="\"item-etag\""
    for commandType in ["relationship.invitation.resend","relationship.invitation.removal"] {
      let fields:[String:Any]=["commandId":"0191c2a0-3333-7a00-8000-000000000002","commandType":commandType,"schema":1,"aggregateType":"STUDENT_INVITATION","aggregateId":"opaque-id","clientOccurredAt":"2026-10-12T12:00:00Z","payload":["invitationId":"opaque-id"],"expectedRevision":etag]
      let input=try JSONSerialization.data(withJSONObject:fields)
      let envelope=try decoder.decode(SyncCommandEnvelope.self,from:input)
      switch envelope {
      case .typeRelationshipInvitationResendCommand(let value): XCTAssertEqual(value.expectedRevision,etag)
      case .typeRelationshipInvitationRemoveCommand(let value): XCTAssertEqual(value.expectedRevision,etag)
      default: XCTFail("Wrong typed envelope")
      }
      let output=try XCTUnwrap(JSONSerialization.jsonObject(with:try encoder.encode(envelope)) as? [String:Any])
      XCTAssertEqual(output["expectedRevision"] as? String,etag)
      XCTAssertEqual(output["commandType"] as? String,commandType)
      for shape in ["missing","null"] {
        var invalid=fields
        if shape=="missing" { invalid.removeValue(forKey:"expectedRevision") } else { invalid["expectedRevision"]=NSNull() }
        XCTAssertThrowsError(try decoder.decode(SyncCommandEnvelope.self,from:JSONSerialization.data(withJSONObject:invalid)))
      }
    }
  }
  func testItemEtagLiteralInHTTPHeadersAndResponseAccessible() throws {
    let etag="\"server-item-validator\""
    let resend=try request(StudentInvitationsAPI.resendPersonalStudentInvitationWithRequestBuilder(invitationId:"opaque-id",idempotencyKey:"logical-resend",ifMatch:etag))
    let removal=try request(StudentInvitationsAPI.removePersonalStudentInvitationWithRequestBuilder(invitationId:"opaque-id",idempotencyKey:"logical-removal",ifMatch:etag))
    XCTAssertEqual(resend.value(forHTTPHeaderField:"If-Match"),etag)
    XCTAssertEqual(removal.value(forHTTPHeaderField:"If-Match"),etag)
    let http=try XCTUnwrap(HTTPURLResponse(url:URL(string:"http://127.0.0.1:1/api/v1/personal/student-invitations/opaque-id")!,statusCode:200,httpVersion:"HTTP/1.1",headerFields:["ETag":etag]))
    let response=Response<Void>(response:http,body:(),bodyData:nil)
    XCTAssertEqual(response.header.first { $0.key.caseInsensitiveCompare("ETag") == .orderedSame }?.value,etag)
  }
}
