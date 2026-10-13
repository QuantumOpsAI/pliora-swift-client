import XCTest
@testable import FitAppClientSwift

final class AccountEmailConfirmationWireTests: XCTestCase {
    private let fixtureJSON = #"[{"name":"AccountEmailConfirmationAvailabilityView","label":"available","value":{"accountId":"account-demo","emailKind":"HIDDEN_EMAIL","state":"AVAILABLE","blocksEntry":false,"deferAllowed":true,"originMethods":["APPLE","GOOGLE"]},"required":["accountId","emailKind","state","blocksEntry","deferAllowed"]},{"name":"AccountEmailConfirmationAvailabilityView","label":"common","value":{"accountId":"account-demo","emailKind":"EMAIL","state":"NOT_ELIGIBLE","blocksEntry":false,"deferAllowed":true,"reason":"COMMON_EMAIL"},"required":["accountId","emailKind","state","blocksEntry","deferAllowed"]},{"name":"AccountEmailConfirmationAvailabilityView","label":"transportUnavailable","value":{"accountId":"account-demo","emailKind":"HIDDEN_EMAIL","state":"UNAVAILABLE","blocksEntry":false,"deferAllowed":true,"reason":"DESTINATION_TRANSPORT_UNAVAILABLE"},"required":["accountId","emailKind","state","blocksEntry","deferAllowed"]},{"name":"AccountEmailConfirmationAvailabilityView","label":"androidOriginalMailbox","value":{"accountId":"account-demo","emailKind":"HIDDEN_EMAIL","state":"AVAILABLE","blocksEntry":false,"deferAllowed":true,"originMethods":["ORIGINAL_EMAIL_POSSESSION"]},"required":["accountId","emailKind","state","blocksEntry","deferAllowed"]},{"name":"StartAccountEmailConfirmationAttemptRequest","label":"request","value":{"destinationEmail":"confirmed@example.com","device":{"deviceId":"device-demo-ios","platform":"IOS","appVersion":"1.0.0"}},"required":["destinationEmail","device"]},{"name":"AccountEmailAttemptOpenedView","label":"originRequired","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"ORIGIN_REQUIRED","originMethods":["APPLE"]},"required":["accountId","attemptId","purpose","expiresAt","stage","state","originMethods"]},{"name":"AccountEmailAttemptView","label":"originRequired","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"ORIGIN_REQUIRED","originMethods":["APPLE"]},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"social","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"SOCIAL_NONCE_READY","socialIntent":{"originIntentId":"origin-intent-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"ORIGIN","provider":"APPLE","nonce":"origin-nonce-demo-000000000000000000000","expiresAt":"2026-10-13T12:05:00Z"}},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"mailPending","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"ORIGIN_CODE_PENDING","originChallenge":{"originIntentId":"origin-intent-demo","challengeId":"origin-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"ORIGIN","deliveryState":"DISPATCH_PENDING","canVerify":false,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"mailReady","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"ORIGIN_CODE_READY","originChallenge":{"originIntentId":"origin-intent-demo","challengeId":"origin-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"ORIGIN","deliveryState":"CODE_READY","canVerify":true,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"destinationRequired","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"DESTINATION","state":"DESTINATION_REQUIRED","originAuthorizedUntil":"2026-10-13T12:08:00Z"},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"pending","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"DESTINATION","state":"DESTINATION_CODE_PENDING","originAuthorizedUntil":"2026-10-13T12:08:00Z","destinationChallenge":{"challengeId":"destination-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"DESTINATION","deliveryState":"DISPATCH_PENDING","canVerify":false,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"ready","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"DESTINATION","state":"DESTINATION_CODE_READY","originAuthorizedUntil":"2026-10-13T12:08:00Z","destinationChallenge":{"challengeId":"destination-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"DESTINATION","deliveryState":"CODE_READY","canVerify":true,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"confirmedNoFabricatedEmailProvider","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"COMMITTED","state":"CONFIRMED","confirmedAccount":{"accountId":"account-demo","emailKind":"EMAIL","email":"confirmed@example.com","linkedProviders":["APPLE","GOOGLE"]}},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"cancelled","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","state":"CANCELLED","cancelledAt":"2026-10-13T12:03:00Z","stage":"TERMINAL"},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"alreadyConfirmed","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","state":"CONFIRMED","confirmedAccount":{"accountId":"account-demo","emailKind":"EMAIL","email":"confirmed@example.com","linkedProviders":["APPLE","GOOGLE"]},"stage":"COMMITTED"},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"AccountEmailAttemptView","label":"expired","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"TERMINAL","state":"EXPIRED","expiredAt":"2026-10-13T12:10:00Z"},"required":["accountId","attemptId","purpose","expiresAt","state","stage"]},{"name":"StartAccountEmailConfirmationOriginIntentRequest","label":"request","value":{"method":"SOCIAL_PROVIDER","provider":"APPLE","device":{"deviceId":"device-demo-ios","platform":"IOS","appVersion":"1.0.0"}},"required":["method","device"]},{"name":"StartAccountEmailConfirmationOriginIntentRequest","label":"originalMailbox","value":{"method":"ORIGINAL_EMAIL_POSSESSION","device":{"deviceId":"device-demo-android","platform":"ANDROID"}},"required":["method","device"]},{"name":"AccountEmailOriginIntentView","label":"social","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"SOCIAL_NONCE_READY","socialIntent":{"originIntentId":"origin-intent-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"ORIGIN","provider":"APPLE","nonce":"origin-nonce-demo-000000000000000000000","expiresAt":"2026-10-13T12:05:00Z"}},"required":["accountId","attemptId","purpose","expiresAt","stage","state"]},{"name":"AccountEmailOriginIntentView","label":"mailPending","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"ORIGIN_CODE_PENDING","originChallenge":{"originIntentId":"origin-intent-demo","challengeId":"origin-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"ORIGIN","deliveryState":"DISPATCH_PENDING","canVerify":false,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","stage","state"]},{"name":"AccountEmailOriginIntentView","label":"mailReady","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"ORIGIN","state":"ORIGIN_CODE_READY","originChallenge":{"originIntentId":"origin-intent-demo","challengeId":"origin-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"ORIGIN","deliveryState":"CODE_READY","canVerify":true,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","stage","state"]},{"name":"AuthorizeAccountEmailConfirmationOriginRequest","label":"request","value":{"method":"SOCIAL_PROVIDER","originIntentId":"origin-intent-demo","proof":"synthetic-provider-proof-for-origin-only","device":{"deviceId":"device-demo-ios","platform":"IOS","appVersion":"1.0.0"}},"required":["method","originIntentId","device"]},{"name":"AuthorizeAccountEmailConfirmationOriginRequest","label":"originalMailbox","value":{"method":"ORIGINAL_EMAIL_POSSESSION","device":{"deviceId":"device-demo-android","platform":"ANDROID"},"originIntentId":"origin-intent-demo","originChallengeId":"origin-challenge-demo","code":"123456"},"required":["method","originIntentId","device"]},{"name":"AccountEmailOriginAuthorizedView","label":"destinationRequired","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"DESTINATION","state":"DESTINATION_REQUIRED","originAuthorizedUntil":"2026-10-13T12:08:00Z"},"required":["accountId","attemptId","purpose","expiresAt","stage","state","originAuthorizedUntil"]},{"name":"StartAccountEmailConfirmationDestinationChallengeRequest","label":"request","value":{"device":{"deviceId":"device-demo-ios","platform":"IOS","appVersion":"1.0.0"}},"required":["device"]},{"name":"AccountEmailDestinationChallengeView","label":"pending","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"DESTINATION","state":"DESTINATION_CODE_PENDING","originAuthorizedUntil":"2026-10-13T12:08:00Z","destinationChallenge":{"challengeId":"destination-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"DESTINATION","deliveryState":"DISPATCH_PENDING","canVerify":false,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","stage","state","originAuthorizedUntil","destinationChallenge"]},{"name":"AccountEmailDestinationChallengeView","label":"ready","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"DESTINATION","state":"DESTINATION_CODE_READY","originAuthorizedUntil":"2026-10-13T12:08:00Z","destinationChallenge":{"challengeId":"destination-challenge-demo","accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","stage":"DESTINATION","deliveryState":"CODE_READY","canVerify":true,"expiresAt":"2026-10-13T12:08:00Z","resendAvailableAt":"2026-10-13T12:01:00Z","codeLength":6,"maxAttempts":5}},"required":["accountId","attemptId","purpose","expiresAt","stage","state","originAuthorizedUntil","destinationChallenge"]},{"name":"ConfirmAccountEmailRequest","label":"request","value":{"destinationChallengeId":"destination-challenge-demo","code":"123456","device":{"deviceId":"device-demo-ios","platform":"IOS","appVersion":"1.0.0"}},"required":["destinationChallengeId","code","device"]},{"name":"AccountEmailConfirmedView","label":"confirmedNoFabricatedEmailProvider","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","stage":"COMMITTED","state":"CONFIRMED","confirmedAccount":{"accountId":"account-demo","emailKind":"EMAIL","email":"confirmed@example.com","linkedProviders":["APPLE","GOOGLE"]},"rereadRequired":true},"required":["accountId","attemptId","purpose","expiresAt","stage","state","confirmedAccount","rereadRequired"]},{"name":"CancelAccountEmailConfirmationAttemptRequest","label":"request","value":{"device":{"deviceId":"device-demo-ios","platform":"IOS","appVersion":"1.0.0"}},"required":["device"]},{"name":"AccountEmailCancellationView","label":"cancelled","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","state":"CANCELLED","cancelledAt":"2026-10-13T12:03:00Z","rereadRequired":false},"required":["accountId","attemptId","purpose","expiresAt","state","rereadRequired"]},{"name":"AccountEmailCancellationView","label":"alreadyConfirmed","value":{"accountId":"account-demo","attemptId":"attempt-demo","purpose":"CONFIRM_ACCOUNT_EMAIL","expiresAt":"2026-10-13T12:10:00Z","state":"CONFIRMED","confirmedAccount":{"accountId":"account-demo","emailKind":"EMAIL","email":"confirmed@example.com","linkedProviders":["APPLE","GOOGLE"]},"rereadRequired":true},"required":["accountId","attemptId","purpose","expiresAt","state","rereadRequired"]}]"#
    private func fixtures() throws -> [[String: Any]] { try XCTUnwrap(JSONSerialization.jsonObject(with:Data(fixtureJSON.utf8)) as? [[String: Any]]) }
    private func roundTrip(_ name: String,_ value: [String: Any],_ strategy: JSONEncoder.DateEncodingStrategy = .iso8601) throws -> Data {
        let input=try JSONSerialization.data(withJSONObject:value)
        let decoder=JSONDecoder(); decoder.dateDecodingStrategy = .custom { decoder in
            let raw=try decoder.singleValueContainer().decode(String.self)
            let formatter=ISO8601DateFormatter();formatter.formatOptions = [.withInternetDateTime,.withFractionalSeconds]
            if let date=formatter.date(from:raw) { return date }
            formatter.formatOptions = [.withInternetDateTime]
            guard let date=formatter.date(from:raw) else { throw DecodingError.dataCorrupted(.init(codingPath:[],debugDescription:"Invalid timestamp")) }
            return date
        }
        let encoder=JSONEncoder(); encoder.dateEncodingStrategy = strategy
        switch name {
        case "AccountEmailConfirmedAccountView":
            let dto=try decoder.decode(AccountEmailConfirmedAccountView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailSocialOriginIntentView":
            let dto=try decoder.decode(AccountEmailSocialOriginIntentView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailPossessionChallengeView":
            let dto=try decoder.decode(AccountEmailPossessionChallengeView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailConfirmationAvailabilityView":
            let dto=try decoder.decode(AccountEmailConfirmationAvailabilityView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "StartAccountEmailConfirmationAttemptRequest":
            let dto=try decoder.decode(StartAccountEmailConfirmationAttemptRequest.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailAttemptOpenedView":
            let dto=try decoder.decode(AccountEmailAttemptOpenedView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "StartAccountEmailConfirmationOriginIntentRequest":
            let dto=try decoder.decode(StartAccountEmailConfirmationOriginIntentRequest.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailOriginIntentView":
            let dto=try decoder.decode(AccountEmailOriginIntentView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AuthorizeAccountEmailConfirmationOriginRequest":
            let dto=try decoder.decode(AuthorizeAccountEmailConfirmationOriginRequest.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailOriginAuthorizedView":
            let dto=try decoder.decode(AccountEmailOriginAuthorizedView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "StartAccountEmailConfirmationDestinationChallengeRequest":
            let dto=try decoder.decode(StartAccountEmailConfirmationDestinationChallengeRequest.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailDestinationChallengeView":
            let dto=try decoder.decode(AccountEmailDestinationChallengeView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "ConfirmAccountEmailRequest":
            let dto=try decoder.decode(ConfirmAccountEmailRequest.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailConfirmedView":
            let dto=try decoder.decode(AccountEmailConfirmedView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "CancelAccountEmailConfirmationAttemptRequest":
            let dto=try decoder.decode(CancelAccountEmailConfirmationAttemptRequest.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailCancellationView":
            let dto=try decoder.decode(AccountEmailCancellationView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        case "AccountEmailAttemptView":
            let dto=try decoder.decode(AccountEmailAttemptView.self,from:input)
            XCTAssertFalse(String(describing:dto).contains("example.com"))
            return try encoder.encode(dto)
        default: throw NSError(domain:"unknown protocol DTO",code:1)
        }
    }
    private func reject(_ name: String,_ value: [String: Any]) {
        XCTAssertThrowsError(try roundTrip(name,value)) { error in
            XCTAssertFalse(String(describing:error).contains("example.com"))
        }
    }
    func testEveryPublishedRequestAndResponseStrictRoundTrip() throws {
        for fixture in try fixtures() {
            let name=fixture["name"] as! String;let value=fixture["value"] as! [String: Any]
            let data=try roundTrip(name,value)
            _ = try roundTrip(name,try XCTUnwrap(JSONSerialization.jsonObject(with:data) as? [String: Any]))
        }
    }
    func testTimestampWireRemainsTextWithDefaultAndNumericDateStrategies() throws {
        for fixture in try fixtures() {
            let name=fixture["name"] as! String;let value=fixture["value"] as! [String: Any]
            for strategy in [JSONEncoder.DateEncodingStrategy.deferredToDate,.secondsSince1970,.millisecondsSince1970] {
                let data=try roundTrip(name,value,strategy)
                let wire=try XCTUnwrap(JSONSerialization.jsonObject(with:data) as? [String:Any])
                XCTAssertTrue(AccountEmailWireGuard.accepts(name,wire))
                _ = try roundTrip(name,wire)
            }
        }
    }
    func testExplicitNullExtraAndUnknownValuesFailClosed() throws {
        for fixture in try fixtures() {
            let name=fixture["name"] as! String;let value=fixture["value"] as! [String: Any]
            for key in fixture["required"] as! [String] { var invalid=value;invalid.removeValue(forKey:key);reject(name,invalid) }
            for key in value.keys { var invalid=value;invalid[key]=NSNull();reject(name,invalid) }
            var extra=value;extra["unexpected"]="hidden@example.com";reject(name,extra)
            for key in ["state","purpose","stage","method"] where value[key] != nil { var invalid=value;invalid[key]="FUTURE_KIND";reject(name,invalid) }
            for donor in try fixtures() where donor["name"] as? String == name { for (key,field) in donor["value"] as! [String: Any] where value[key] == nil { var invalid=value;invalid[key]=field;reject(name,invalid) } }
        }
    }
    func testPossessionUsesExactlySixDigits() throws {
        for fixture in try fixtures() {
            let value=fixture["value"] as! [String: Any]
            guard value["code"] != nil else { continue }
            for code in ["12345678","12345","abcdef","123456\n"] { var invalid=value;invalid["code"]=code;reject(fixture["name"] as! String,invalid) }
        }
    }
    func testOriginDestinationAndPendingStagesCannotSubstituteEachOther() throws {
        for fixture in try fixtures() {
            let value=fixture["value"] as! [String: Any]
            for field in ["originChallenge","destinationChallenge"] {
                guard var challenge=value[field] as? [String: Any] else { continue }
                var invalid=value;challenge["stage"]=field=="originChallenge" ? "DESTINATION" : "ORIGIN";invalid[field]=challenge;reject(fixture["name"] as! String,invalid)
                challenge=value[field] as! [String: Any];challenge["canVerify"] = !(challenge["canVerify"] as! Bool);invalid[field]=challenge;reject(fixture["name"] as! String,invalid)
                challenge=value[field] as! [String: Any];challenge["accountId"]="other-account";invalid[field]=challenge;reject(fixture["name"] as! String,invalid)
            }
        }
    }
}
