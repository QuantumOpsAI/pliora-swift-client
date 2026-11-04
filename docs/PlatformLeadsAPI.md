# PlatformLeadsAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**submitPlatformContactRequest**](PlatformLeadsAPI.md#submitplatformcontactrequest) | **POST** /platform-leads/contact-requests | Receber pedido de contato de interessado na plataforma


# **submitPlatformContactRequest**
```swift
    open class func submitPlatformContactRequest(idempotencyKey: String, platformContactRequest: PlatformContactRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PlatformContactReceipt?, _ error: Error?) -> Void)
```

Receber pedido de contato de interessado na plataforma

Recepção pública sem autenticação e sem enumeração de cadastro. A resposta 202 só ocorre após commit durável e é idêntica para pedido novo, duplicado, fechado, suprimido ou conta já existente. A mesma Idempotency-Key com o mesmo pedido recupera o recibo; pedido divergente com a chave responde 409. O corpo tem teto de 16 KiB antes do parse. UTF-8 válido, chaves JSON duplicadas, conteúdo após o objeto, controles em name, timezone IANA, unicidade de channelGrants por channel e catálogos publicados de originCode/textVersion exigem validação no runtime: o schema não a prova. A seleção de canais é explícita; este pedido não consente newsletter, não prova posse do e-mail e não vincula conta. CORS admite só origens institucionais configuradas e sem credenciais/cookies do Admin. Nenhum endereço, corpo ou hash de PII é refletido em resposta ou log.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | UUID canônico minúsculo não nil, gerado por tentativa lógica.
let platformContactRequest = PlatformContactRequest(name: "name_example", email: "email_example", phone: "phone_example", interest: "interest_example", originCode: "originCode_example", timezone: "timezone_example", channelGrants: [PlatformContactChannelGrant(channel: "channel_example", textVersion: "textVersion_example")]) // PlatformContactRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Receber pedido de contato de interessado na plataforma
PlatformLeadsAPI.submitPlatformContactRequest(idempotencyKey: idempotencyKey, platformContactRequest: platformContactRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **idempotencyKey** | **String** | UUID canônico minúsculo não nil, gerado por tentativa lógica. |
 **platformContactRequest** | [**PlatformContactRequest**](PlatformContactRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PlatformContactReceipt**](PlatformContactReceipt.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
