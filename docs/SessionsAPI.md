# SessionsAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**refreshSession**](SessionsAPI.md#refreshsession) | **POST** /sessions/refresh | Rotacionar refresh token e renovar sessão
[**revokeAllSessions**](SessionsAPI.md#revokeallsessions) | **DELETE** /sessions | Revogar todas as sessões da identidade autenticada
[**revokeCurrentSession**](SessionsAPI.md#revokecurrentsession) | **DELETE** /sessions/current | Revogar a sessão autenticada atual


# **refreshSession**
```swift
    open class func refreshSession(idempotencyKey: String, refreshSessionRequest: RefreshSessionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: SessionResponse?, _ error: Error?) -> Void)
```

Rotacionar refresh token e renovar sessão

Consome o refresh token apresentado, persiste o sucessor e devolve o novo envelope da sessão numa única transação. `issuedAt` é a âncora dos prazos: `expiresIn` e `refreshExpiresIn` são durações contadas de `issuedAt`, nunca da recepção — o vencimento de cada credencial é `issuedAt` + a duração publicada. **Repetição idempotente.** A `Idempotency-Key` nomeia a tentativa: repetir a mesma chave com o mesmo corpo devolve o **envelope original** gravado na primeira execução — mesmo `accessToken`, mesmo `refreshToken`, mesmo `issuedAt` e as mesmas durações — sem rotacionar de novo e **sem prolongar prazo nenhum**. Um replay servido vinte minutos depois traz o `issuedAt` original: quem tinha um access de quinze minutos recebe de volta um access já vencido, nunca quinze minutos novos a partir da recepção. Por isso uma resposta perdida é recuperável: a nova tentativa repete a mesma chave e o mesmo corpo, inclusive depois de morte de processo, e nunca troca o corpo sob a chave nem gera chave nova para reusar o refresh antigo. **Recusas, lidas pelo `code`, nunca pelo status sozinho.** `401 SESSION_INVALID` é a única recusa autoritativa que encerra a sessão no cliente: refresh inexistente, expirado ou de família revogada. `409 REFRESH_REPLAY_DETECTED` é o replay comprovado de um refresh já consumido apresentado sob **outra** chave, e revoga a família inteira — também exige entrada interativa. `409 IDEMPOTENCY_CONFLICT` é a mesma chave reutilizada com corpo divergente: falha de protocolo, **nunca prova de família revogada**, e a credencial é preservada. `422 VALIDATION_FAILED` cobre pedido malformado, inclusive a `Idempotency-Key` ausente, em branco ou longa demais. Timeout, `408`, `429`, `5xx`, cancelamento e resposta malformada são falhas indeterminadas: preservam a credencial e pedem nova tentativa com a **mesma** chave e o **mesmo** corpo — nunca são lidos como sessão inválida.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let refreshSessionRequest = RefreshSessionRequest(refreshToken: "refreshToken_example", deviceId: "deviceId_example") // RefreshSessionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Rotacionar refresh token e renovar sessão
SessionsAPI.refreshSession(idempotencyKey: idempotencyKey, refreshSessionRequest: refreshSessionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **refreshSessionRequest** | [**RefreshSessionRequest**](RefreshSessionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**SessionResponse**](SessionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeAllSessions**
```swift
    open class func revokeAllSessions(idempotencyKey: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revogar todas as sessões da identidade autenticada

A credencial Bearer é o gate de ator: ausente ou inválida, a resposta é `401 SESSION_INVALID` qualquer que seja a chave. Válida, a `Idempotency-Key` decide a repetição: a mesma chave com a mesma credencial devolve o resultado registrado, sem revogar de novo; a mesma chave com outra credencial é `409 IDEMPOTENCY_CONFLICT`, falha de protocolo que não prova revogação; e a chave ausente ou malformada sob credencial válida é `422 VALIDATION_FAILED`. Falha indeterminada (timeout, `5xx`, resposta malformada) nunca é confirmação de revogação: o cliente não afirma sessão remota encerrada antes da resposta conclusiva.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Revogar todas as sessões da identidade autenticada
SessionsAPI.revokeAllSessions(idempotencyKey: idempotencyKey, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeCurrentSession**
```swift
    open class func revokeCurrentSession(idempotencyKey: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revogar a sessão autenticada atual

A credencial Bearer é o gate de ator: ausente ou inválida, a resposta é `401 SESSION_INVALID` qualquer que seja a chave. Válida, a `Idempotency-Key` decide a repetição: a mesma chave com a mesma credencial devolve o resultado registrado, sem revogar de novo; a mesma chave com outra credencial é `409 IDEMPOTENCY_CONFLICT`, falha de protocolo que não prova revogação; e a chave ausente ou malformada sob credencial válida é `422 VALIDATION_FAILED`. Falha indeterminada (timeout, `5xx`, resposta malformada) nunca é confirmação de revogação: o cliente não afirma sessão remota encerrada antes da resposta conclusiva.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Revogar a sessão autenticada atual
SessionsAPI.revokeCurrentSession(idempotencyKey: idempotencyKey, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
