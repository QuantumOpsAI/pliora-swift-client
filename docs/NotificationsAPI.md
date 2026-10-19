# NotificationsAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deactivateMyPushDestination**](NotificationsAPI.md#deactivatemypushdestination) | **DELETE** /me/push-destinations/{installationId} | deactivateMyPushDestination
[**getMyNotificationPreferences**](NotificationsAPI.md#getmynotificationpreferences) | **GET** /me/notification-preferences | getMyNotificationPreferences
[**getMyPushDestinations**](NotificationsAPI.md#getmypushdestinations) | **GET** /me/push-destinations | getMyPushDestinations
[**getPersonalActivityDigest**](NotificationsAPI.md#getpersonalactivitydigest) | **GET** /personal/activity-digests/{digestId} | getPersonalActivityDigest
[**getPersonalSessionRecognition**](NotificationsAPI.md#getpersonalsessionrecognition) | **GET** /personal/students/{studentId}/sessions/{sessionId}/recognition | getPersonalSessionRecognition
[**getPersonalWeeklyReview**](NotificationsAPI.md#getpersonalweeklyreview) | **GET** /personal/weekly-reviews/{reviewId} | getPersonalWeeklyReview
[**getStudentSessionRecognition**](NotificationsAPI.md#getstudentsessionrecognition) | **GET** /student/sessions/{sessionId}/recognition | getStudentSessionRecognition
[**getStudentWeeklyReview**](NotificationsAPI.md#getstudentweeklyreview) | **GET** /student/weekly-reviews/{reviewId} | getStudentWeeklyReview
[**listPersonalActivityDigests**](NotificationsAPI.md#listpersonalactivitydigests) | **GET** /personal/activity-digests | listPersonalActivityDigests
[**listPersonalWeeklyReviews**](NotificationsAPI.md#listpersonalweeklyreviews) | **GET** /personal/weekly-reviews | listPersonalWeeklyReviews
[**listStudentWeeklyReviews**](NotificationsAPI.md#liststudentweeklyreviews) | **GET** /student/weekly-reviews | listStudentWeeklyReviews
[**prepareMyPushDestinationRegistration**](NotificationsAPI.md#preparemypushdestinationregistration) | **POST** /me/push-destination-registration-contexts | prepareMyPushDestinationRegistration
[**putPersonalSessionRecognition**](NotificationsAPI.md#putpersonalsessionrecognition) | **PUT** /personal/students/{studentId}/sessions/{sessionId}/recognition | putPersonalSessionRecognition
[**resolveMyNotificationDestination**](NotificationsAPI.md#resolvemynotificationdestination) | **GET** /me/notifications/{notificationId}/destination | resolveMyNotificationDestination
[**updateMyNotificationPreferences**](NotificationsAPI.md#updatemynotificationpreferences) | **PUT** /me/notification-preferences | updateMyNotificationPreferences
[**upsertMyPushDestination**](NotificationsAPI.md#upsertmypushdestination) | **PUT** /me/push-destinations/{installationId} | upsertMyPushDestination


# **deactivateMyPushDestination**
```swift
    open class func deactivateMyPushDestination(installationId: String, ifMatch: String, idempotencyKey: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PushDestinationView?, _ error: Error?) -> Void)
```

deactivateMyPushDestination

Desativa sem exigir vínculo/consentimento ou disponibilidade FCM/APNs; alheio/inexistente404 uniforme. Já INACTIVE e revisão corrente retorna200 sem novo fato. Replay reautoriza conta/sessão. Logout offline não confirma revogação no servidor; sessão/binding também devem bloquear envio.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let installationId = "installationId_example" // String | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let ifMatch = "ifMatch_example" // String | ETag exata lida: controle na primeira instalação desconhecida; destino no update/DELETE; preferences na edição. Sem curinga;412 não grava nem mescla.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// deactivateMyPushDestination
NotificationsAPI.deactivateMyPushDestination(installationId: installationId, ifMatch: ifMatch, idempotencyKey: idempotencyKey, acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **installationId** | **String** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **ifMatch** | **String** | ETag exata lida: controle na primeira instalação desconhecida; destino no update/DELETE; preferences na edição. Sem curinga;412 não grava nem mescla. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PushDestinationView**](PushDestinationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyNotificationPreferences**
```swift
    open class func getMyNotificationPreferences(acceptLanguage: String? = nil, completion: @escaping (_ data: NotificationPreferencesView?, _ error: Error?) -> Void)
```

getMyNotificationPreferences

Sem contexto STUDENT/PERSONAL autorizado responde403 FORBIDDEN. Leitura autenticada sem efeitos de negócio; revalida autorização atual. Falha é Problem Details, nunca vazio substituto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// getMyNotificationPreferences
NotificationsAPI.getMyNotificationPreferences(acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**NotificationPreferencesView**](NotificationPreferencesView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyPushDestinations**
```swift
    open class func getMyPushDestinations(acceptLanguage: String? = nil, completion: @escaping (_ data: PushDestinationsView?, _ error: Error?) -> Void)
```

getMyPushDestinations

Própria conta sem exigir contexto aluno, vínculo ou consentimento. Lista ACTIVE/INACTIVE sem token; revision de controle é precondição de criação. Nenhuma leitura envia ou marca leitura.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// getMyPushDestinations
NotificationsAPI.getMyPushDestinations(acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PushDestinationsView**](PushDestinationsView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalActivityDigest**
```swift
    open class func getPersonalActivityDigest(digestId: UUID, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: DigestView?, _ error: Error?) -> Void)
```

getPersonalActivityDigest

Leitura autenticada sem efeitos de negócio; revalida autorização atual. Falha é Problem Details, nunca vazio substituto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let digestId = 987 // UUID | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Paginação opaca account-bound; cursor inválido422. (optional)
let limit = 987 // Int | Paginação opaca account-bound; cursor inválido422. (optional) (default to 20)

// getPersonalActivityDigest
NotificationsAPI.getPersonalActivityDigest(digestId: digestId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **digestId** | **UUID** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Paginação opaca account-bound; cursor inválido422. | [optional]
 **limit** | **Int** | Paginação opaca account-bound; cursor inválido422. | [optional] [default to 20]

### Return type

[**DigestView**](DigestView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalSessionRecognition**
```swift
    open class func getPersonalSessionRecognition(studentId: String, sessionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: SessionRecognitionView?, _ error: Error?) -> Void)
```

getPersonalSessionRecognition

Somente sessão concluída autorizada no contexto atual: 200 retorna reconhecimento existente com ETag; 204 sem corpo confirma sessão acessível ainda sem reconhecimento.404 uniforme para sessão inexistente, alheia, não concluída ou sem acesso. GET não reconhece nem marca leitura. Ausência autorizada permite criação explícita com If-None-Match:* somente ao personal.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let sessionId = "sessionId_example" // String | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// getPersonalSessionRecognition
NotificationsAPI.getPersonalSessionRecognition(studentId: studentId, sessionId: sessionId, acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **studentId** | **String** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **sessionId** | **String** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**SessionRecognitionView**](SessionRecognitionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalWeeklyReview**
```swift
    open class func getPersonalWeeklyReview(reviewId: UUID, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: WeeklyReviewView?, _ error: Error?) -> Void)
```

getPersonalWeeklyReview

Leitura autenticada sem efeitos de negócio; revalida autorização atual. Falha é Problem Details, nunca vazio substituto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let reviewId = 987 // UUID | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Paginação opaca account-bound; cursor inválido422. (optional)
let limit = 987 // Int | Paginação opaca account-bound; cursor inválido422. (optional) (default to 20)

// getPersonalWeeklyReview
NotificationsAPI.getPersonalWeeklyReview(reviewId: reviewId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **UUID** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Paginação opaca account-bound; cursor inválido422. | [optional]
 **limit** | **Int** | Paginação opaca account-bound; cursor inválido422. | [optional] [default to 20]

### Return type

[**WeeklyReviewView**](WeeklyReviewView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentSessionRecognition**
```swift
    open class func getStudentSessionRecognition(sessionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: SessionRecognitionView?, _ error: Error?) -> Void)
```

getStudentSessionRecognition

Somente sessão concluída autorizada no contexto atual: 200 retorna reconhecimento existente com ETag; 204 sem corpo confirma sessão acessível ainda sem reconhecimento.404 uniforme para sessão inexistente, alheia, não concluída ou sem acesso. GET não reconhece nem marca leitura. Ausência autorizada permite criação explícita com If-None-Match:* somente ao personal.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// getStudentSessionRecognition
NotificationsAPI.getStudentSessionRecognition(sessionId: sessionId, acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**SessionRecognitionView**](SessionRecognitionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentWeeklyReview**
```swift
    open class func getStudentWeeklyReview(reviewId: UUID, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: WeeklyReviewView?, _ error: Error?) -> Void)
```

getStudentWeeklyReview

Leitura autenticada sem efeitos de negócio; revalida autorização atual. Falha é Problem Details, nunca vazio substituto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let reviewId = 987 // UUID | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Paginação opaca account-bound; cursor inválido422. (optional)
let limit = 987 // Int | Paginação opaca account-bound; cursor inválido422. (optional) (default to 20)

// getStudentWeeklyReview
NotificationsAPI.getStudentWeeklyReview(reviewId: reviewId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reviewId** | **UUID** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Paginação opaca account-bound; cursor inválido422. | [optional]
 **limit** | **Int** | Paginação opaca account-bound; cursor inválido422. | [optional] [default to 20]

### Return type

[**WeeklyReviewView**](WeeklyReviewView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalActivityDigests**
```swift
    open class func listPersonalActivityDigests(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: ActivityDigestsPage?, _ error: Error?) -> Void)
```

listPersonalActivityDigests

Leitura autenticada sem efeitos de negócio; revalida autorização atual. Falha é Problem Details, nunca vazio substituto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Paginação opaca account-bound; cursor inválido422. (optional)
let limit = 987 // Int | Paginação opaca account-bound; cursor inválido422. (optional) (default to 20)

// listPersonalActivityDigests
NotificationsAPI.listPersonalActivityDigests(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Paginação opaca account-bound; cursor inválido422. | [optional]
 **limit** | **Int** | Paginação opaca account-bound; cursor inválido422. | [optional] [default to 20]

### Return type

[**ActivityDigestsPage**](ActivityDigestsPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalWeeklyReviews**
```swift
    open class func listPersonalWeeklyReviews(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: WeeklyReviewsPage?, _ error: Error?) -> Void)
```

listPersonalWeeklyReviews

Descoberta normal independente do opt-in push, ordenada pelo fim exclusivo DESC e reviewId ASC. Projeção de fatos autorizados; cursor account-bound inválido422; sem status de envio/leitura. Semana ISO imutável; timezone atual não reinterpreta histórico.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Paginação opaca account-bound; cursor inválido422. (optional)
let limit = 987 // Int | Paginação opaca account-bound; cursor inválido422. (optional) (default to 20)

// listPersonalWeeklyReviews
NotificationsAPI.listPersonalWeeklyReviews(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Paginação opaca account-bound; cursor inválido422. | [optional]
 **limit** | **Int** | Paginação opaca account-bound; cursor inválido422. | [optional] [default to 20]

### Return type

[**WeeklyReviewsPage**](WeeklyReviewsPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStudentWeeklyReviews**
```swift
    open class func listStudentWeeklyReviews(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: WeeklyReviewsPage?, _ error: Error?) -> Void)
```

listStudentWeeklyReviews

Descoberta normal independente do opt-in push, ordenada pelo fim exclusivo DESC e reviewId ASC. Projeção de fatos autorizados; cursor account-bound inválido422; sem status de envio/leitura. Semana ISO imutável; timezone atual não reinterpreta histórico.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Paginação opaca account-bound; cursor inválido422. (optional)
let limit = 987 // Int | Paginação opaca account-bound; cursor inválido422. (optional) (default to 20)

// listStudentWeeklyReviews
NotificationsAPI.listStudentWeeklyReviews(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Paginação opaca account-bound; cursor inválido422. | [optional]
 **limit** | **Int** | Paginação opaca account-bound; cursor inválido422. | [optional] [default to 20]

### Return type

[**WeeklyReviewsPage**](WeeklyReviewsPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **prepareMyPushDestinationRegistration**
```swift
    open class func prepareMyPushDestinationRegistration(idempotencyKey: String, preparePushRegistrationRequest: PreparePushRegistrationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PushRegistrationContextView?, _ error: Error?) -> Void)
```

prepareMyPushDestinationRegistration

Prepara intenção completa imutável account/session/installation-bound por120s. Congela token binding revision sem revelar owner. Não transfere nem ativa destino. Repetição reautoriza conta e sessão.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let preparePushRegistrationRequest = PreparePushRegistrationRequest(installationId: "installationId_example", platform: PushPlatform(), provider: PushProvider(), token: "token_example", apnsEnvironment: PushApnsEnvironment(), permissionState: PushPermissionState(), locale: Locale(), receivingEnabled: false, capabilities: [PushCapability()]) // PreparePushRegistrationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// prepareMyPushDestinationRegistration
NotificationsAPI.prepareMyPushDestinationRegistration(idempotencyKey: idempotencyKey, preparePushRegistrationRequest: preparePushRegistrationRequest, acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **preparePushRegistrationRequest** | [**PreparePushRegistrationRequest**](PreparePushRegistrationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PushRegistrationContextView**](PushRegistrationContextView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putPersonalSessionRecognition**
```swift
    open class func putPersonalSessionRecognition(studentId: String, sessionId: String, idempotencyKey: String, recognitionCommand: RecognitionCommand, acceptLanguage: String? = nil, ifMatch: String? = nil, ifNoneMatch: IfNoneMatch_putPersonalSessionRecognition? = nil, completion: @escaping (_ data: SessionRecognitionView?, _ error: Error?) -> Void)
```

putPersonalSessionRecognition

Somente personal do vínculo ativo, sessão concluída autorizada. Exatamente uma precondição If-None-Match:* (criar) ou If-Match:revision (replay), ambas/nenhuma422. Replay idêntico devolve fato, código distinto409 RECOGNITION_ALREADY_RECORDED; CAS vencido412. Sem edição/remoção, chat/texto livre ou ato por chegada/toque/GET.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let sessionId = "sessionId_example" // String | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let recognitionCommand = RecognitionCommand(code: SessionRecognitionCode()) // RecognitionCommand |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let ifMatch = "ifMatch_example" // String | Para replay do fato existente, ETag revision da view. Exatamente uma precondição exigida. Não permite editar código. (optional)
let ifNoneMatch = "ifNoneMatch_example" // String | Criar somente quando não existe reconhecimento. Exatamente uma precondição; nenhuma/ambas422; existência diverge412. Descobrir ausência no GET próprio da sessão antes de criar. (optional)

// putPersonalSessionRecognition
NotificationsAPI.putPersonalSessionRecognition(studentId: studentId, sessionId: sessionId, idempotencyKey: idempotencyKey, recognitionCommand: recognitionCommand, acceptLanguage: acceptLanguage, ifMatch: ifMatch, ifNoneMatch: ifNoneMatch) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **studentId** | **String** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **sessionId** | **String** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **recognitionCommand** | [**RecognitionCommand**](RecognitionCommand.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **ifMatch** | **String** | Para replay do fato existente, ETag revision da view. Exatamente uma precondição exigida. Não permite editar código. | [optional]
 **ifNoneMatch** | **String** | Criar somente quando não existe reconhecimento. Exatamente uma precondição; nenhuma/ambas422; existência diverge412. Descobrir ausência no GET próprio da sessão antes de criar. | [optional]

### Return type

[**SessionRecognitionView**](SessionRecognitionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resolveMyNotificationDestination**
```swift
    open class func resolveMyNotificationDestination(notificationId: UUID, acceptLanguage: String? = nil, completion: @escaping (_ data: NotificationDestinationView?, _ error: Error?) -> Void)
```

resolveMyNotificationDestination

Resolve depois da autenticação/app lock. Conta destinatária somente; inexistente/outra conta404 indistinguível. GET não marca lido nem reconhece/conclui/inicia. Sem URLs arbitrárias. Contexto e IDs só AVAILABLE autorizado; EXPIRED/UNAVAILABLE sem IDs. Payload desconhecido fallback seguro.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let notificationId = 987 // UUID | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// resolveMyNotificationDestination
NotificationsAPI.resolveMyNotificationDestination(notificationId: notificationId, acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **notificationId** | **UUID** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**NotificationDestinationView**](NotificationDestinationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMyNotificationPreferences**
```swift
    open class func updateMyNotificationPreferences(ifMatch: String, idempotencyKey: String, notificationPreferences: NotificationPreferences, acceptLanguage: String? = nil, completion: @escaping (_ data: NotificationPreferencesView?, _ error: Error?) -> Void)
```

updateMyNotificationPreferences

Sem contexto STUDENT/PERSONAL autorizado responde403 FORBIDDEN. Documento completo dos contextos autorizados, sem papel global. If-Match obrigatório;412 preserva edição no cliente e requer releitura. Contexto ausente não pode ser habilitado. Alteração não concede consentimento e não faz backfill. IANA/horários inválidos422 sem correção silenciosa.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata lida: controle na primeira instalação desconhecida; destino no update/DELETE; preferences na edição. Sem curinga;412 não grava nem mescla.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let notificationPreferences = NotificationPreferences(deliveryTimeZone: "deliveryTimeZone_example", quietHours: NotificationQuietHours(enabled: false, startLocal: "startLocal_example", endLocal: "endLocal_example"), routinePriority: NotificationContext(), student: StudentNotificationPreferences(workoutReminder: WorkoutReminderPreference(enabled: false, localTime: "localTime_example", weekdays: [NotificationWeekday()], followPlanDays: false), staleSessionEnabled: false, planUpdatesEnabled: false, analysisRequestsEnabled: false, firstWorkoutFeedbackEnabled: false, motivationEnabled: false, returnInvitationEnabled: false, weeklyReviewEnabled: false, recognitionEnabled: false), personal: PersonalNotificationPreferences(completionMode: "completionMode_example", actionUpdatesEnabled: false, weeklyReviewEnabled: false, noRecentRecordsInDigestEnabled: false)) // NotificationPreferences |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// updateMyNotificationPreferences
NotificationsAPI.updateMyNotificationPreferences(ifMatch: ifMatch, idempotencyKey: idempotencyKey, notificationPreferences: notificationPreferences, acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ifMatch** | **String** | ETag exata lida: controle na primeira instalação desconhecida; destino no update/DELETE; preferences na edição. Sem curinga;412 não grava nem mescla. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **notificationPreferences** | [**NotificationPreferences**](NotificationPreferences.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**NotificationPreferencesView**](NotificationPreferencesView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upsertMyPushDestination**
```swift
    open class func upsertMyPushDestination(installationId: String, ifMatch: String, idempotencyKey: String, upsertPushDestinationRequest: UpsertPushDestinationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PushDestinationView?, _ error: Error?) -> Void)
```

upsertMyPushDestination

Registra somente intenção idêntica ao preparo para esta instalação/conta/sessão. Divergência409; contexto expirado/binding alterado412; outra conta/instalação404 uniforme. If-Match de controle no primeiro registro, destino no update. Registro não concede consentimento. Token reassociado tem fencing atômico: destino anterior não recebe mais. Replay reautoriza conta/sessão e binding antes de retornar.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let installationId = "installationId_example" // String | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis.
let ifMatch = "ifMatch_example" // String | ETag exata lida: controle na primeira instalação desconhecida; destino no update/DELETE; preferences na edição. Sem curinga;412 não grava nem mescla.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let upsertPushDestinationRequest = UpsertPushDestinationRequest(platform: PushPlatform(), provider: PushProvider(), token: "token_example", apnsEnvironment: PushApnsEnvironment(), permissionState: PushPermissionState(), locale: Locale(), receivingEnabled: false, capabilities: [PushCapability()], registrationContextId: "registrationContextId_example") // UpsertPushDestinationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// upsertMyPushDestination
NotificationsAPI.upsertMyPushDestination(installationId: installationId, ifMatch: ifMatch, idempotencyKey: idempotencyKey, upsertPushDestinationRequest: upsertPushDestinationRequest, acceptLanguage: acceptLanguage) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **installationId** | **String** | Identidade opaca validada na conta atual; alheio e inexistente indistinguíveis. |
 **ifMatch** | **String** | ETag exata lida: controle na primeira instalação desconhecida; destino no update/DELETE; preferences na edição. Sem curinga;412 não grava nem mescla. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **upsertPushDestinationRequest** | [**UpsertPushDestinationRequest**](UpsertPushDestinationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PushDestinationView**](PushDestinationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
