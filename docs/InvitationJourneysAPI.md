# InvitationJourneysAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createInvitationJourney**](InvitationJourneysAPI.md#createinvitationjourney) | **POST** /invitation-journeys | Trocar um código público por uma jornada curta
[**createPendingStudentInvitationJourney**](InvitationJourneysAPI.md#creatependingstudentinvitationjourney) | **POST** /student-invitations/pending/{invitationId}/journey | Criar jornada para um convite pendente escolhido
[**listPendingStudentInvitations**](InvitationJourneysAPI.md#listpendingstudentinvitations) | **GET** /student-invitations/pending | Listar convites pendentes da identidade verificada


# **createInvitationJourney**
```swift
    open class func createInvitationJourney(createInvitationJourneyRequest: CreateInvitationJourneyRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: InvitationJourneyView?, _ error: Error?) -> Void)
```

Trocar um código público por uma jornada curta

Recebe somente o `linkCode` da URL first-party `https://join.pliora.com/i/{linkCode}` e devolve uma credencial curta. Não aceita, recusa, abre ou consome convite. A resposta desconhecida é indistinguível de código revogado e não publica e-mail ou PII. `journeyToken` nunca entra em URL, logs ou analytics e expira em no máximo trinta minutos, limitado pela validade do convite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let createInvitationJourneyRequest = CreateInvitationJourneyRequest(linkCode: "linkCode_example", platform: InvitationJourneyPlatform(), appInstallationId: "appInstallationId_example") // CreateInvitationJourneyRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Trocar um código público por uma jornada curta
InvitationJourneysAPI.createInvitationJourney(createInvitationJourneyRequest: createInvitationJourneyRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **createInvitationJourneyRequest** | [**CreateInvitationJourneyRequest**](CreateInvitationJourneyRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**InvitationJourneyView**](InvitationJourneyView.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPendingStudentInvitationJourney**
```swift
    open class func createPendingStudentInvitationJourney(invitationId: String, createPendingInvitationJourneyRequest: CreatePendingInvitationJourneyRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: InvitationJourneyView?, _ error: Error?) -> Void)
```

Criar jornada para um convite pendente escolhido

Cria a credencial curta somente se o destino do convite corresponder a um e-mail verificado da sessão. Inexistente, alheio e inelegível respondem de forma indistinguível. Não aceita, abre nem consome o convite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String |
let createPendingInvitationJourneyRequest = CreatePendingInvitationJourneyRequest(platform: InvitationJourneyPlatform(), appInstallationId: "appInstallationId_example") // CreatePendingInvitationJourneyRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Criar jornada para um convite pendente escolhido
InvitationJourneysAPI.createPendingStudentInvitationJourney(invitationId: invitationId, createPendingInvitationJourneyRequest: createPendingInvitationJourneyRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** |  |
 **createPendingInvitationJourneyRequest** | [**CreatePendingInvitationJourneyRequest**](CreatePendingInvitationJourneyRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**InvitationJourneyView**](InvitationJourneyView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPendingStudentInvitations**
```swift
    open class func listPendingStudentInvitations(acceptLanguage: String? = nil, completion: @escaping (_ data: PendingStudentInvitationPage?, _ error: Error?) -> Void)
```

Listar convites pendentes da identidade verificada

Retomada determinística após instalação. O servidor usa exclusivamente os e-mails verificados da sessão; o cliente não envia endereço. A resposta não contém `linkCode`, token de aceite nem `journeyToken`, não altera o convite e exige escolha explícita quando houver mais de um item.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Listar convites pendentes da identidade verificada
InvitationJourneysAPI.listPendingStudentInvitations(acceptLanguage: acceptLanguage) { (response, error) in
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

[**PendingStudentInvitationPage**](PendingStudentInvitationPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
