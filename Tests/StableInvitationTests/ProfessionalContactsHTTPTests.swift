import XCTest
import Alamofire
@testable import FitAppClientSwift

private final class ContactsProtocol: URLProtocol {
    static var requests:[URLRequest]=[]
    static var malformed=false
    override class func canInit(with request:URLRequest)->Bool {request.url?.host=="contacts-wire.invalid"}
    override class func canonicalRequest(for request:URLRequest)->URLRequest {request}
    override func startLoading() {
        Self.requests.append(request)
        let method=request.httpMethod ?? "GET",path=request.url!.path
        let status=method=="DELETE" ? 204 : method=="POST" ? 201 : 200
        let body:String
        if method=="DELETE" {body=""}
        else if Self.malformed {body="{}"}
        else if method=="POST" || method=="PUT" {body=#"{"revision":"r2","contact":{"contactId":"contact_public","kind":"SOCIAL","networkLabel":"Minha rede","profileUrl":"https://example.org/personal?view=profile#about","audience":"PUBLIC"}}"#}
        else if path.contains("/public/") {body=#"{"displayName":"Authored name","contacts":[{"contactId":"contact_public","kind":"SOCIAL","networkLabel":"Minha rede","profileUrl":"https://example.org/personal?view=profile#about","audience":"PUBLIC"}]}"#}
        else if path.contains("/student/") {body=#"{"relationshipId":"relation","relationshipStatus":"ACTIVE","displayName":"Authored name","contacts":[{"contactId":"contact_public","kind":"SOCIAL","networkLabel":"Minha rede","profileUrl":"https://example.org/personal?view=profile#about","audience":"PUBLIC"},{"contactId":"contact_students","kind":"SOCIAL","networkLabel":"Rede para alunos","profileUrl":"https://students.example.org/profile","audience":"STUDENTS"},{"contactId":"contact_whatsapp","kind":"WHATSAPP","phoneNumber":"+5511999999999","audience":"STUDENTS"}]}"#}
        else {body=#"{"revision":"r1","contacts":[{"contactId":"contact_students","kind":"SOCIAL","networkLabel":"Rede para alunos","profileUrl":"https://students.example.org/profile","audience":"STUDENTS"},{"contactId":"contact_whatsapp","kind":"WHATSAPP","phoneNumber":"+5511999999999","audience":"STUDENTS"}]}"#}
        client?.urlProtocol(self,didReceive:HTTPURLResponse(url:request.url!,statusCode:status,httpVersion:nil,headerFields:["Content-Type":"application/json","ETag":"rev-next"])!,cacheStoragePolicy:.notAllowed)
        if !body.isEmpty {client?.urlProtocol(self,didLoad:Data(body.utf8))}
        client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {}
}
private final class ContactsBuilder<T:Decodable>:AlamofireDecodableRequestBuilder<T> {
    override func createAlamofireSession(interceptor:RequestInterceptor?=nil)->Alamofire.Session {
        let config=URLSessionConfiguration.ephemeral;config.protocolClasses=[ContactsProtocol.self]
        return Alamofire.Session(configuration:config,interceptor:interceptor)
    }
}
private final class ContactsVoidBuilder<T>:AlamofireRequestBuilder<T> {
    override func createAlamofireSession(interceptor:RequestInterceptor?=nil)->Alamofire.Session {
        let config=URLSessionConfiguration.ephemeral;config.protocolClasses=[ContactsProtocol.self]
        return Alamofire.Session(configuration:config,interceptor:interceptor)
    }
}
private struct ContactsFactory:RequestBuilderFactory {
    func getNonDecodableBuilder<T>()->RequestBuilder<T>.Type {ContactsVoidBuilder<T>.self}
    func getBuilder<T:Decodable>()->RequestBuilder<T>.Type {ContactsBuilder<T>.self}
}
final class ProfessionalContactsHTTPTests:XCTestCase {
    private func run<T>(_ builder:RequestBuilder<T>,_ status:Int) {
        let done=expectation(description:"Contact generated HTTP")
        builder.execute(.global()) { result in
            switch result {
            case .success(let response):XCTAssertEqual(response.statusCode,status)
            case .failure:XCTFail("Valid contact HTTP fixture refused")
            }
            done.fulfill()
        }
        wait(for:[done],timeout:10)
    }
    func testSixGeneratedOperationsAndInvalidCommandBeforeHTTP() throws {
        let base=FitAppClientSwiftAPI.basePath,factory=FitAppClientSwiftAPI.requestBuilderFactory
        defer {FitAppClientSwiftAPI.basePath=base;FitAppClientSwiftAPI.requestBuilderFactory=factory}
        FitAppClientSwiftAPI.basePath="http://contacts-wire.invalid/api/v1";FitAppClientSwiftAPI.requestBuilderFactory=ContactsFactory()
        ContactsProtocol.requests=[];ContactsProtocol.malformed=false
        let create=try CodableHelper.decode(CreateProfessionalContactRequest.self,from:Data(#"{"kind":"SOCIAL","networkLabel":"Minha rede","profileUrl":"https://example.org/personal?view=profile#about","audience":"PUBLIC"}"#.utf8)).get()
        let replace=try CodableHelper.decode(ReplaceProfessionalContactRequest.self,from:Data(#"{"kind":"SOCIAL","networkLabel":"Minha rede","profileUrl":"https://example.org/personal?view=profile#about","audience":"PUBLIC"}"#.utf8)).get()
        run(ProfessionalContactsAPI.getOwnProfessionalContactsWithRequestBuilder(acceptLanguage:"pt-BR"),200)
        run(ProfessionalContactsAPI.getCurrentStudentPersonalContactsWithRequestBuilder(acceptLanguage:"pt-BR"),200)
        run(ProfessionalContactsAPI.getPublicProfessionalProfileWithRequestBuilder(profileRef:"pp_AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",acceptLanguage:"pt-BR"),200)
        run(try ProfessionalContactsAPI.createProfessionalContactWithRequestBuilder(ifMatch:"rev-read",idempotencyKey:"logical-contact-command",createProfessionalContactRequest:create,acceptLanguage:"pt-BR"),201)
        run(try ProfessionalContactsAPI.replaceProfessionalContactWithRequestBuilder(contactId:"contact_public",ifMatch:"rev-read",idempotencyKey:"logical-contact-command",replaceProfessionalContactRequest:replace,acceptLanguage:"pt-BR"),200)
        run(ProfessionalContactsAPI.deleteProfessionalContactWithRequestBuilder(contactId:"contact_public",ifMatch:"rev-read",idempotencyKey:"logical-contact-command",acceptLanguage:"pt-BR"),204)
        XCTAssertEqual(ContactsProtocol.requests.count,6)
        for r in ContactsProtocol.requests where ["POST","PUT","DELETE"].contains(r.httpMethod!) {
            XCTAssertEqual(r.value(forHTTPHeaderField:"If-Match"),"rev-read")
            XCTAssertEqual(r.value(forHTTPHeaderField:"Idempotency-Key"),"logical-contact-command")
        }
        var invalid=create;invalid.phoneNumber="+5511999999999"
        let before=ContactsProtocol.requests.count
        XCTAssertThrowsError(try ProfessionalContactsAPI.createProfessionalContactWithRequestBuilder(ifMatch:"rev-read",idempotencyKey:"invalid",createProfessionalContactRequest:invalid))
        let refused=expectation(description:"Invalid body before HTTP")
        ProfessionalContactsAPI.createProfessionalContact(ifMatch:"rev-read",idempotencyKey:"invalid",createProfessionalContactRequest:invalid) {_,error in
            if case .invalidRequest? = error as? ProfessionalContactsWireError {} else {XCTFail("Expected local request refusal")}
            refused.fulfill()
        }
        wait(for:[refused],timeout:10)
        XCTAssertEqual(ContactsProtocol.requests.count,before)
    }
    func testMalformedSuccessAfterMutationRemainsResponseFailure() throws {
        let base=FitAppClientSwiftAPI.basePath,factory=FitAppClientSwiftAPI.requestBuilderFactory
        defer {FitAppClientSwiftAPI.basePath=base;FitAppClientSwiftAPI.requestBuilderFactory=factory;ContactsProtocol.malformed=false}
        FitAppClientSwiftAPI.basePath="http://contacts-wire.invalid/api/v1";FitAppClientSwiftAPI.requestBuilderFactory=ContactsFactory()
        ContactsProtocol.requests=[];ContactsProtocol.malformed=true
        let create=try CodableHelper.decode(CreateProfessionalContactRequest.self,from:Data(#"{"kind":"SOCIAL","networkLabel":"Minha rede","profileUrl":"https://example.org/personal?view=profile#about","audience":"PUBLIC"}"#.utf8)).get()
        let done=expectation(description:"Issued mutation response refused")
        ProfessionalContactsAPI.createProfessionalContact(ifMatch:"rev-read",idempotencyKey:"issued",createProfessionalContactRequest:create) {_,error in
            guard case .error(201,_,_,let underlying)? = error as? ErrorResponse else {XCTFail("Must retain issued HTTP status");done.fulfill();return}
            if case .invalidResponse? = underlying as? ProfessionalContactsWireError {} else {XCTFail("Must not classify issued mutation as invalid request")}
            done.fulfill()
        }
        wait(for:[done],timeout:10)
        XCTAssertEqual(ContactsProtocol.requests.count,1)
    }
}
