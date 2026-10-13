import XCTest
@testable import FitAppClientSwift

final class AccountEmailProjectionTests: XCTestCase {
    private let hidden = #"{"revision":"1","avatar":{"state":"NONE","variants":[]},"sessionProvider":"APPLE","professionalRegistrationStatus":"NOT_INFORMED","canInvite":false,"canImportGooglePhoto":false,"specialties":[],"workStyle":{},"preferences":{"measurementSystem":"METRIC","theme":"DARK","firstDayOfWeek":"MONDAY","firstDayOfWeekSource":"DERIVED_FROM_LOCALE","remindersEnabled":false},"relationshipSummary":{"activeCount":0,"pausedCount":0,"endedCount":0},"emailKind":"HIDDEN_EMAIL"}"#
    private let common = #"{"revision":"3","displayName":"Mariana Costa","avatar":{"state":"NONE","variants":[]},"email":"marina@example.com","emailKind":"EMAIL","sessionProvider":"EMAIL","professionalRegistrationStatus":"NOT_INFORMED","canInvite":false,"canImportGooglePhoto":false,"specialties":[],"workStyle":{},"preferences":{"measurementSystem":"METRIC","theme":"DARK","firstDayOfWeek":"MONDAY","firstDayOfWeekSource":"DERIVED_FROM_LOCALE","remindersEnabled":false},"relationshipSummary":{"activeCount":0,"pausedCount":0,"endedCount":0}}"#
    private func fixture(_ json: String, _ provider: String) throws -> [String: Any] {
        var fields = try XCTUnwrap(JSONSerialization.jsonObject(with: Data(json.utf8)) as? [String: Any])
        fields["sessionProvider"] = provider
        return fields
    }
    private func decode(_ fields: [String: Any]) throws -> PersonalProfileView {
        try JSONDecoder().decode(PersonalProfileView.self, from: JSONSerialization.data(withJSONObject: fields))
    }
    func testHiddenAndCommonAccountWithEverySessionProvider() throws {
        for provider in ["APPLE", "GOOGLE", "EMAIL"] {
            let value = try decode(fixture(hidden, provider))
            XCTAssertEqual(value.emailKind, .hiddenEmail)
            XCTAssertNil(value.email)
            XCTAssertFalse(value.description.contains("example.com"))
            let encoded = try XCTUnwrap(JSONSerialization.jsonObject(with: JSONEncoder().encode(value)) as? [String: Any])
            XCTAssertFalse(encoded.keys.contains("email"))
            XCTAssertEqual(try decode(fixture(common, provider)).emailKind, .email)
        }
    }
    func testHiddenAddressNullAndMaskRejectedBeforeDTO() throws {
        for provider in ["APPLE", "GOOGLE", "EMAIL"] {
            let addresses: [Any] = ["hidden@example.com", NSNull(), "h***@example.com"]
            for address in addresses {
                var invalid = try fixture(hidden, provider); invalid["email"] = address
                XCTAssertThrowsError(try decode(invalid)) { error in
                    XCTAssertFalse(String(describing: error).contains("example.com"))
                }
            }
        }
    }
    func testCommonAddressCannotBeAbsentOrNull() throws {
        for provider in ["APPLE", "GOOGLE", "EMAIL"] {
            var invalid = try fixture(common, provider); invalid.removeValue(forKey: "email")
            XCTAssertThrowsError(try decode(invalid))
            invalid["email"] = NSNull()
            XCTAssertThrowsError(try decode(invalid))
        }
    }
    func testUnknownClassificationFailsClosed() throws {
        var invalid = try fixture(hidden, "GOOGLE"); invalid["emailKind"] = "FUTURE_KIND"
        XCTAssertThrowsError(try decode(invalid))
    }
    func testIdentityOwnerAPIMatchesStructuralOmission() throws {
        for provider in ["APPLE", "GOOGLE", "EMAIL"] {
            var fields: [String: Any] = ["provider": provider, "emailKind": "HIDDEN_EMAIL", "linkedProviders": ["APPLE", "GOOGLE", "EMAIL"]]
            let value = try JSONDecoder().decode(AuthenticatedIdentityProfile.self, from: JSONSerialization.data(withJSONObject: fields))
            XCTAssertEqual(value.emailKind, .hiddenEmail)
            XCTAssertFalse(try XCTUnwrap(JSONSerialization.jsonObject(with: JSONEncoder().encode(value)) as? [String: Any]).keys.contains("email"))
            let addresses: [Any] = [NSNull(), "hidden@example.com", "h***@example.com"]
            for address in addresses {
                fields["email"] = address
                XCTAssertThrowsError(try JSONDecoder().decode(AuthenticatedIdentityProfile.self, from: JSONSerialization.data(withJSONObject: fields)))
            }
            fields["emailKind"] = "EMAIL"; fields["email"] = "common@example.com"
            XCTAssertEqual(try JSONDecoder().decode(AuthenticatedIdentityProfile.self, from: JSONSerialization.data(withJSONObject: fields)).email, "common@example.com")
            fields.removeValue(forKey: "email")
            XCTAssertThrowsError(try JSONDecoder().decode(AuthenticatedIdentityProfile.self, from: JSONSerialization.data(withJSONObject: fields)))
        }
    }
    func testInvalidDTOCannotEncodeAddressOrInventCommonState() throws {
        var invalid = try decode(fixture(hidden, "GOOGLE")); invalid.email = "hidden@example.com"
        XCTAssertThrowsError(try JSONEncoder().encode(invalid)) { error in
            XCTAssertFalse(String(describing: error).contains("example.com"))
        }
        invalid.email = nil; invalid.emailKind = .email
        XCTAssertThrowsError(try JSONEncoder().encode(invalid))
    }
}
