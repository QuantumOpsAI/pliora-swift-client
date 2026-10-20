import XCTest
@testable import FitAppClientSwift

/// pliora-contracts#372 — o marcador `type: "null"` tem de recusar qualquer
/// payload não nulo: a linha ENDED da carteira declara `studentName` só para que
/// um nome vazado viole a decodificação, nunca para transportá-lo.
final class NullDecodingRefusalTests: XCTestCase {
  private func rowJson(studentName:String?)->String {
    let field = studentName.map { ",\"studentName\":\($0)" } ?? ""
    return "{\"relationshipId\":\"rel-1\",\"studentId\":\"stu-1\",\"relationshipStatus\":\"ENDED\",\"startedAt\":\"2026-10-01T10:00:00Z\",\"endedAt\":\"2026-10-20T10:00:00Z\",\"operationalPriority\":\"NEUTRAL\",\"indicators\":[\"ENDED\"],\"destination\":\"RELATIONSHIP\"\(field)}"
  }
  func testAbsentOrLiteralNullDecodes() throws {
    for json in [rowJson(studentName:nil),rowJson(studentName:"null")] {
      let row = try CodableHelper.jsonDecoder.decode(PersonalPortfolioEndedRow.self,from:Data(json.utf8))
      XCTAssertNil(row.studentName)
    }
  }
  func testNonNullStudentNameIsRefused() {
    XCTAssertThrowsError(
      try CodableHelper.jsonDecoder.decode(PersonalPortfolioEndedRow.self,from:Data(rowJson(studentName:"\"leaked-name\"").utf8))
    )
  }
}
