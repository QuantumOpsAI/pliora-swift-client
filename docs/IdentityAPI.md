# IdentityAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAuthenticatedIdentityProfile**](IdentityAPI.md#getauthenticatedidentityprofile) | **GET** /identity/me | Obter a identidade de apresentação da sessão autenticada
[**getEntryContext**](IdentityAPI.md#getentrycontext) | **GET** /identity/entry-context | Ler os contextos atuais da conta autenticada, fora de /sync
[**proveSocialIdentity**](IdentityAPI.md#provesocialidentity) | **POST** /identity/social-proof | Trocar prova externa por um contexto de identidade FitApp
[**proveSocialIdentityJourney**](IdentityAPI.md#provesocialidentityjourney) | **POST** /identity/journeys/social-proof | Trocar prova social pela próxima etapa segura da jornada
[**startOtpChallenge**](IdentityAPI.md#startotpchallenge) | **POST** /identity/otp/challenges | Iniciar desafio OTP com resposta não enumerável
[**startOtpJourneyChallenge**](IdentityAPI.md#startotpjourneychallenge) | **POST** /identity/journeys/otp/challenges | Iniciar desafio OTP preservando a jornada opaca
[**verifyOtpChallenge**](IdentityAPI.md#verifyotpchallenge) | **POST** /identity/otp/challenges/{challengeId}/verification | Verificar OTP e emitir sessão FitApp
[**verifyOtpJourneyChallenge**](IdentityAPI.md#verifyotpjourneychallenge) | **POST** /identity/journeys/otp/challenges/{challengeId}/verification | Verificar OTP e retornar a próxima etapa segura da jornada


# **getAuthenticatedIdentityProfile**
```swift
    open class func getAuthenticatedIdentityProfile(acceptLanguage: String? = nil, completion: @escaping (_ data: AuthenticatedIdentityProfile?, _ error: Error?) -> Void)
```

Obter a identidade de apresentação da sessão autenticada

Retorna somente os dados da própria conta necessários para o Perfil e para comunicar como a sessão atual foi iniciada. O nome é opcional e vem apenas do perfil autorado pelo profissional; e-mail, convite e atributos do provedor nunca são usados para fabricar um nome. COGNITO é apresentado ao cliente como EMAIL, e o app omite essa origem na interface.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter a identidade de apresentação da sessão autenticada
IdentityAPI.getAuthenticatedIdentityProfile(acceptLanguage: acceptLanguage) { (response, error) in
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

[**AuthenticatedIdentityProfile**](AuthenticatedIdentityProfile.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEntryContext**
```swift
    open class func getEntryContext(acceptLanguage: String? = nil, completion: @escaping (_ data: EntryContextView?, _ error: Error?) -> Void)
```

Ler os contextos atuais da conta autenticada, fora de /sync

Leitura autenticada do que a conta é e do que o servidor decide para ela **agora**: as capacidades que ela já detém — só aluno, só profissional, ambos ou nenhuma —, em qual delas o app abre, e se há escolha de jornada pendente. É a mesma projeção que as jornadas de entrada publicam no login, no mesmo vocabulário (`nextStep` e `invitationContext`), para o app que relança com a sessão restaurada e não apresenta prova de identidade nova. **Esta rota substitui `GET /sync/scope` para os clientes móveis**, que a chamavam apenas para descobrir o papel da conta: `/sync/_*` não é usado pelo runtime móvel do MVP e o descritor de escopo é chave de store de sincronização, não leitura de contexto de produto. Aqui há também o que lá falta: `homeContext` é a autoridade de contexto ativo cuja ausência faz `GET /sync/scope` negar quem detém as duas capacidades. **Duas coisas diferentes.** `contexts` são capacidades já concedidas, registradas no servidor quando nasceram dos atos que as criaram — aceitar um convite, concluir o onboarding profissional. `nextStep` é a escolha de jornada, e é dela que vale a regra do owner: **não existe papel global salvo**. Nenhuma escolha de entrada é persistida, nenhuma preferência de jornada é guardada, nada é derivado do provedor de identidade usado no login, e a leitura seguinte com convite válido volta a perguntar. **Ler não consome nada.** Um convite exposto como preservado continua utilizável: esta operação não aceita, recusa, elege nem cancela convite, e seguir pela jornada profissional também não o consome. Se o servidor não consegue estabelecer o contexto — a contagem de convites aceitáveis ou a leitura da conta falha —, a resposta é `503 ENTRY_CONTEXT_UNAVAILABLE`: é retentável e **nunca** significa \"sem contexto\", \"sem convite\" ou \"não é aluno\". O cliente preserva o que já tinha e repete a leitura. Nenhum dado de saúde trafega aqui e nenhum dado pessoal entra em query string: a operação não tem parâmetro de seleção de conta, capacidade ou convite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler os contextos atuais da conta autenticada, fora de /sync
IdentityAPI.getEntryContext(acceptLanguage: acceptLanguage) { (response, error) in
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

[**EntryContextView**](EntryContextView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **proveSocialIdentity**
```swift
    open class func proveSocialIdentity(idempotencyKey: String, socialIdentityProofRequest: SocialIdentityProofRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: IdentityContextResponse?, _ error: Error?) -> Void)
```

Trocar prova externa por um contexto de identidade FitApp

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let socialIdentityProofRequest = SocialIdentityProofRequest(provider: "provider_example", proof: "proof_example", invitationToken: "invitationToken_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // SocialIdentityProofRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Trocar prova externa por um contexto de identidade FitApp
IdentityAPI.proveSocialIdentity(idempotencyKey: idempotencyKey, socialIdentityProofRequest: socialIdentityProofRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **socialIdentityProofRequest** | [**SocialIdentityProofRequest**](SocialIdentityProofRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**IdentityContextResponse**](IdentityContextResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **proveSocialIdentityJourney**
```swift
    open class func proveSocialIdentityJourney(idempotencyKey: String, socialIdentityJourneyRequest: SocialIdentityJourneyRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: IdentityJourneyResponse?, _ error: Error?) -> Void)
```

Trocar prova social pela próxima etapa segura da jornada

Valida a prova no backend e preserva o convite opaco, quando presente. Apple é permitido somente no iOS; Google é permitido no Android e no iOS. Conta nova sem convite segue para onboarding de personal; conta nova de aluno exige convite válido. Autenticar nunca aceita o convite e e-mail nunca autoriza vínculo. Se o servidor não consegue estabelecer o contexto de entrada — a contagem de convites aceitáveis ou a releitura da conta recém-resolvida falha —, a resposta é `503 ENTRY_CONTEXT_UNAVAILABLE` e nenhuma sessão é emitida: o servidor nunca responde \"sem convite\" quando apenas não conseguiu ler o convite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let socialIdentityJourneyRequest = SocialIdentityJourneyRequest(provider: "provider_example", proof: "proof_example", invitationToken: "invitationToken_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // SocialIdentityJourneyRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Trocar prova social pela próxima etapa segura da jornada
IdentityAPI.proveSocialIdentityJourney(idempotencyKey: idempotencyKey, socialIdentityJourneyRequest: socialIdentityJourneyRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **socialIdentityJourneyRequest** | [**SocialIdentityJourneyRequest**](SocialIdentityJourneyRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**IdentityJourneyResponse**](IdentityJourneyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startOtpChallenge**
```swift
    open class func startOtpChallenge(idempotencyKey: String, startOtpChallengeRequest: StartOtpChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: OtpChallengeResponse?, _ error: Error?) -> Void)
```

Iniciar desafio OTP com resposta não enumerável

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startOtpChallengeRequest = StartOtpChallengeRequest(channel: "channel_example", destination: "destination_example", invitationToken: "invitationToken_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartOtpChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Iniciar desafio OTP com resposta não enumerável
IdentityAPI.startOtpChallenge(idempotencyKey: idempotencyKey, startOtpChallengeRequest: startOtpChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **startOtpChallengeRequest** | [**StartOtpChallengeRequest**](StartOtpChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**OtpChallengeResponse**](OtpChallengeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startOtpJourneyChallenge**
```swift
    open class func startOtpJourneyChallenge(idempotencyKey: String, startOtpChallengeRequest: StartOtpChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: OtpJourneyChallengeResponse?, _ error: Error?) -> Void)
```

Iniciar desafio OTP preservando a jornada opaca

Resposta uniforme; o convite fica ligado ao challenge até sessão ou cancelamento seguro.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startOtpChallengeRequest = StartOtpChallengeRequest(channel: "channel_example", destination: "destination_example", invitationToken: "invitationToken_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartOtpChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Iniciar desafio OTP preservando a jornada opaca
IdentityAPI.startOtpJourneyChallenge(idempotencyKey: idempotencyKey, startOtpChallengeRequest: startOtpChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **startOtpChallengeRequest** | [**StartOtpChallengeRequest**](StartOtpChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**OtpJourneyChallengeResponse**](OtpJourneyChallengeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyOtpChallenge**
```swift
    open class func verifyOtpChallenge(idempotencyKey: String, challengeId: String, verifyOtpChallengeRequest: VerifyOtpChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: SessionResponse?, _ error: Error?) -> Void)
```

Verificar OTP e emitir sessão FitApp

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let challengeId = "challengeId_example" // String |
let verifyOtpChallengeRequest = VerifyOtpChallengeRequest(code: "code_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // VerifyOtpChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Verificar OTP e emitir sessão FitApp
IdentityAPI.verifyOtpChallenge(idempotencyKey: idempotencyKey, challengeId: challengeId, verifyOtpChallengeRequest: verifyOtpChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **challengeId** | **String** |  |
 **verifyOtpChallengeRequest** | [**VerifyOtpChallengeRequest**](VerifyOtpChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**SessionResponse**](SessionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyOtpJourneyChallenge**
```swift
    open class func verifyOtpJourneyChallenge(idempotencyKey: String, challengeId: String, verifyOtpChallengeRequest: VerifyOtpChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: IdentityJourneyResponse?, _ error: Error?) -> Void)
```

Verificar OTP e retornar a próxima etapa segura da jornada

O servidor recupera o convite opaco ligado ao challenge. A resposta distingue onboarding, confirmação do convite e divergência de identidade; e-mail nunca autoriza vínculo e o convite não é aceito por esta operação. Se o servidor não consegue estabelecer o contexto de entrada, a resposta é `503 ENTRY_CONTEXT_UNAVAILABLE` e nenhuma sessão é emitida. Isso cobre o vínculo convite↔challenge ilegível — avaliado **antes** de verificar o código —, a contagem de convites aceitáveis e a releitura da conta recém-resolvida. Um vínculo ilegível nunca é lido como ausência de convite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let challengeId = "challengeId_example" // String |
let verifyOtpChallengeRequest = VerifyOtpChallengeRequest(code: "code_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // VerifyOtpChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Verificar OTP e retornar a próxima etapa segura da jornada
IdentityAPI.verifyOtpJourneyChallenge(idempotencyKey: idempotencyKey, challengeId: challengeId, verifyOtpChallengeRequest: verifyOtpChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **challengeId** | **String** |  |
 **verifyOtpChallengeRequest** | [**VerifyOtpChallengeRequest**](VerifyOtpChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**IdentityJourneyResponse**](IdentityJourneyResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
