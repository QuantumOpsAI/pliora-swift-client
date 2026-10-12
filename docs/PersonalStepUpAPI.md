# PersonalStepUpAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completePersonalPasskeyRegistration**](PersonalStepUpAPI.md#completepersonalpasskeyregistration) | **POST** /personal/step-up/passkey-registration-challenges/{challengeId}/verification | Concluir o cadastro da passkey com a resposta WebAuthn
[**getPersonalStepUpControl**](PersonalStepUpAPI.md#getpersonalstepupcontrol) | **GET** /personal/step-up | Ler o controle de step-up da conta PERSONAL — precondição inicial e política vigente
[**startPersonalPasskeyRegistration**](PersonalStepUpAPI.md#startpersonalpasskeyregistration) | **POST** /personal/step-up/passkey-registration-challenges | Abrir o desafio de cadastro de passkey da conta PERSONAL
[**startPersonalStepUpChallenge**](PersonalStepUpAPI.md#startpersonalstepupchallenge) | **POST** /personal/step-up/challenges | Emitir o desafio de step-up vinculado ao ato de liberação
[**verifyPersonalStepUpChallenge**](PersonalStepUpAPI.md#verifypersonalstepupchallenge) | **POST** /personal/step-up/challenges/{challengeId}/verification | Verificar a asserção WebAuthn e emitir a prova opaca do ato


# **completePersonalPasskeyRegistration**
```swift
    open class func completePersonalPasskeyRegistration(idempotencyKey: String, ifMatch: String, challengeId: String, completePersonalPasskeyRegistrationRequest: CompletePersonalPasskeyRegistrationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalPasskeyRegistrationView?, _ error: Error?) -> Void)
```

Concluir o cadastro da passkey com a resposta WebAuthn

Segundo e último passo do cadastro. O servidor verifica a resposta de atestação — tipo `public-key`, `challenge` exato do passo anterior, hash de `rpId`, origem/app autorizados, posse e presença, e `userVerification` conforme a política publicada — e registra a credencial na conta autenticada. **Cadastro não conta como prova de ato**: o que sai daqui é a credencial registrada e a `controlRevision` nova, nunca uma `StepUpProof` — o ato consequente exige o desafio próprio de `startPersonalStepUpChallenge` mesmo com a passkey recém-criada. `410 CHALLENGE_UNAVAILABLE` responde desafio ausente, expirado, já consumido ou de outra conta de forma **indistinguível** — o desafio não vira oráculo —, e a ordem das recusas é: desafio (`410`), precondição (`412`), corpo (`422`/`401`). Resposta de atestação inválida é `401 AUTHENTICATION_FAILED`, sem detalhar qual verificação falhou e sem ecoar credencial, desafio ou dado do caso — Problem Details nunca transporta material criptográfico. `If-Match` ecoa a `revision` do desafio emitido, nunca `*`. O replay da mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado — mesmo depois do desafio consumido — em vez de reexecutar a cerimônia; é o retry cuja conclusão já aconteceu e cuja resposta se perdeu.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **desafio** emitido, o mesmo valor de `revision` na resposta `201` que o criou. Compare-and-set: revisão velha é `412`, sem reexecutar a cerimônia. O curinga `*` não é elegível — quem nunca viu o desafio também o enviaria —, e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let challengeId = "challengeId_example" // String | Desafio de cadastro emitido por `startPersonalPasskeyRegistration`. Identidade opaca, que não autoriza nada por si.
let completePersonalPasskeyRegistrationRequest = CompletePersonalPasskeyRegistrationRequest(credential: WebAuthnAttestationResponse(id: "id_example", rawId: "rawId_example", type: "type_example", response: WebAuthnAttestationResponse_response(clientDataJSON: "clientDataJSON_example", attestationObject: "attestationObject_example", transports: ["transports_example"]))) // CompletePersonalPasskeyRegistrationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Concluir o cadastro da passkey com a resposta WebAuthn
PersonalStepUpAPI.completePersonalPasskeyRegistration(idempotencyKey: idempotencyKey, ifMatch: ifMatch, challengeId: challengeId, completePersonalPasskeyRegistrationRequest: completePersonalPasskeyRegistrationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **desafio** emitido, o mesmo valor de &#x60;revision&#x60; na resposta &#x60;201&#x60; que o criou. Compare-and-set: revisão velha é &#x60;412&#x60;, sem reexecutar a cerimônia. O curinga &#x60;*&#x60; não é elegível — quem nunca viu o desafio também o enviaria —, e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **challengeId** | **String** | Desafio de cadastro emitido por &#x60;startPersonalPasskeyRegistration&#x60;. Identidade opaca, que não autoriza nada por si. |
 **completePersonalPasskeyRegistrationRequest** | [**CompletePersonalPasskeyRegistrationRequest**](CompletePersonalPasskeyRegistrationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalPasskeyRegistrationView**](PersonalPasskeyRegistrationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStepUpControl**
```swift
    open class func getPersonalStepUpControl(acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStepUpControlView?, _ error: Error?) -> Void)
```

Ler o controle de step-up da conta PERSONAL — precondição inicial e política vigente

Leitura sem efeito colateral do controle de step-up da conta autenticada: se há passkey registrada, os prazos de segurança vigentes e a `revision` que toda mutação desta família ecoa em `If-Match`. **É daqui que sai a precondição inicial**: o `ETag` desta resposta é o primeiro `If-Match` elegível de `startPersonalPasskeyRegistration` e de `startPersonalStepUpChallenge`, e o curinga `*` nunca é elegível — é o valor que quem não leu o controle também enviaria, e derrubaria a precondição. `passkey.registered` decide se o cadastro precisa acontecer antes do desafio do ato; `policy` publica os prazos do servidor — `challengeTtlSeconds` e `proofTtlSeconds` — configurados por release e **nunca** validade indefinida. O que esta leitura **não** publica: material de credencial, desafio vigente, prova emitida, e nenhum dado do caso protegido — pergunta, condição, resposta ou justificativa não existem nesta superfície. Conta sem persona profissional é `403 FORBIDDEN`: aluno, admin ou conta de outro papel não têm step-up nesta superfície. A revisão do controle muda quando o conjunto de credenciais ou a política muda — desafio emitido ou expirado sozinho não a move. Resposta `private, no-store`: cadastrar ou perder credencial em outro fluxo nunca é escondido por cache.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o controle de step-up da conta PERSONAL — precondição inicial e política vigente
PersonalStepUpAPI.getPersonalStepUpControl(acceptLanguage: acceptLanguage) { (response, error) in
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

[**PersonalStepUpControlView**](PersonalStepUpControlView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startPersonalPasskeyRegistration**
```swift
    open class func startPersonalPasskeyRegistration(idempotencyKey: String, ifMatch: String, startPersonalPasskeyRegistrationRequest: StartPersonalPasskeyRegistrationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalPasskeyRegistrationChallengeView?, _ error: Error?) -> Void)
```

Abrir o desafio de cadastro de passkey da conta PERSONAL

Primeiro passo do cadastro, usado quando `getPersonalStepUpControl` diz `passkey.registered: false`. Emite `WebAuthnCredentialCreationOptions` com desafio aleatório imprevisível de uso único, vinculado à **conta PERSONAL autenticada e à sessão** — nem outra conta, nem outra sessão da mesma conta conseguem concluí-lo. O desafio expira no instante do servidor publicado em `expiresAt`; abandono é expiração natural, sem efeito e sem credencial. **Não é login alternativo e não vincula contas**: a credencial criada vale somente como prova de presença verificada para step-up **desta** conta, e a conclusão não emite sessão, não toca em provedor externo e não move consentimento algum. O servidor guarda somente material público — identidade da credencial, chave pública e handle opaco; a chave privada nunca sai do autenticador. `excludeCredentials` lista só handles opacos das credenciais já desta conta, sem dado de pessoa. A configuração de RP — `rp.id`, `rp.name` — e a lista de origens e apps autorizados são **configuração de runtime do servidor**, exigidas para emitir e verificar; o cliente consome o que o desafio publica e nunca envia nem presume esses valores. O `ETag` da resposta é a `revision` do desafio emitido, o `If-Match` de `completePersonalPasskeyRegistration`. **`If-Match` exige a revisão do controle lida** — o `ETag` de `getPersonalStepUpControl`, nunca `*`. O replay da mesma `Idempotency-Key` com o mesmo corpo devolve o desafio guardado sem emitir um segundo; a mesma chave com corpo divergente é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **controle de step-up** que o cliente leu, o mesmo valor de `revision` em `getPersonalStepUpControl`. Compare-and-set: revisão velha é `412`, sem emitir desafio. O curinga `*` não é elegível — é o valor que quem nunca leu o controle também enviaria, e derrubaria a precondição —, e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let startPersonalPasskeyRegistrationRequest = StartPersonalPasskeyRegistrationRequest(device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartPersonalPasskeyRegistrationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abrir o desafio de cadastro de passkey da conta PERSONAL
PersonalStepUpAPI.startPersonalPasskeyRegistration(idempotencyKey: idempotencyKey, ifMatch: ifMatch, startPersonalPasskeyRegistrationRequest: startPersonalPasskeyRegistrationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **controle de step-up** que o cliente leu, o mesmo valor de &#x60;revision&#x60; em &#x60;getPersonalStepUpControl&#x60;. Compare-and-set: revisão velha é &#x60;412&#x60;, sem emitir desafio. O curinga &#x60;*&#x60; não é elegível — é o valor que quem nunca leu o controle também enviaria, e derrubaria a precondição —, e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **startPersonalPasskeyRegistrationRequest** | [**StartPersonalPasskeyRegistrationRequest**](StartPersonalPasskeyRegistrationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalPasskeyRegistrationChallengeView**](PersonalPasskeyRegistrationChallengeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startPersonalStepUpChallenge**
```swift
    open class func startPersonalStepUpChallenge(idempotencyKey: String, ifMatch: String, startPersonalStepUpChallengeRequest: StartPersonalStepUpChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStepUpChallengeView?, _ error: Error?) -> Void)
```

Emitir o desafio de step-up vinculado ao ato de liberação

O desafio do **ato**. O corpo declara a finalidade fechada — `MEDICAL_CLEARANCE_DECLARATION` (P9) ou `PROFESSIONAL_WAIVER` (P9b), e nenhuma outra —, a `targetRef` **opaca** do alvo/caso, a `targetVersion` e a `targetRevision` esperadas e o `mutationIntentId`, a identidade da intenção de mutação que o comando do ato apresentará. O servidor vincula a intenção **inteira** por fingerprint — conta + sessão + finalidade + alvo + versão + revisão + intenção — e é esse fingerprint que a prova emitida na verificação carrega implicitamente. **O desafio não carrega o caso**: nenhuma pergunta, condição, resposta ou justificativa viaja para o autenticador, para a origem ou para o provedor — `targetRef` é opaco e a finalidade é um enum fechado, de modo que nada sensível chega a superfícies fora do servidor. Exige passkey registrada: sem ela a recusa é `409 PASSKEY_NOT_REGISTERED` e o cliente cadastra antes — o cadastro não substitui este passo, e cada ato pede desafio novo. `If-Match` ecoa a `revision` do controle lida, nunca `*`; o replay da mesma `Idempotency-Key` com o mesmo corpo devolve o desafio guardado — **replay não é emissão nova**: desafio novo ganha identidade, `challenge` e expiry novos. O `ETag` da resposta é a `revision` do desafio, o `If-Match` da verificação.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **controle de step-up** que o cliente leu, o mesmo valor de `revision` em `getPersonalStepUpControl`. Compare-and-set: revisão velha é `412`, sem emitir desafio. O curinga `*` não é elegível — é o valor que quem nunca leu o controle também enviaria, e derrubaria a precondição —, e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let startPersonalStepUpChallengeRequest = StartPersonalStepUpChallengeRequest(purpose: StepUpPurpose(), targetRef: "targetRef_example", targetVersion: 123, targetRevision: "targetRevision_example", mutationIntentId: "mutationIntentId_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartPersonalStepUpChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Emitir o desafio de step-up vinculado ao ato de liberação
PersonalStepUpAPI.startPersonalStepUpChallenge(idempotencyKey: idempotencyKey, ifMatch: ifMatch, startPersonalStepUpChallengeRequest: startPersonalStepUpChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **controle de step-up** que o cliente leu, o mesmo valor de &#x60;revision&#x60; em &#x60;getPersonalStepUpControl&#x60;. Compare-and-set: revisão velha é &#x60;412&#x60;, sem emitir desafio. O curinga &#x60;*&#x60; não é elegível — é o valor que quem nunca leu o controle também enviaria, e derrubaria a precondição —, e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **startPersonalStepUpChallengeRequest** | [**StartPersonalStepUpChallengeRequest**](StartPersonalStepUpChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStepUpChallengeView**](PersonalStepUpChallengeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyPersonalStepUpChallenge**
```swift
    open class func verifyPersonalStepUpChallenge(idempotencyKey: String, ifMatch: String, challengeId: String, verifyPersonalStepUpChallengeRequest: VerifyPersonalStepUpChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStepUpProofView?, _ error: Error?) -> Void)
```

Verificar a asserção WebAuthn e emitir a prova opaca do ato

A troca da asserção pela **prova**. O servidor verifica assinatura, tipo `public-key`, `challenge` exato do desafio emitido, hash de `rpId`, origem/app autorizados, posse e presença e `userVerification` conforme a política — contra a vinculação gravada: conta + sessão + finalidade + alvo + versão + revisão + fingerprint da intenção. Sucesso devolve `PersonalStepUpProofView`: uma **prova opaca de uso único**, com `expiresAt` do servidor e TTL publicado no controle, que o comando do ato consome **na mesma transação** do commit — e que não serve a outro ato, outro alvo, outra conta, outra sessão nem outra revisão. `410 CHALLENGE_UNAVAILABLE` responde desafio ausente, expirado, já consumido ou de outra conta de forma **indistinguível**, e a ordem das recusas é desafio (`410`), precondição (`412`), corpo (`422`/`401`): asserção inválida é `401 AUTHENTICATION_FAILED`, sem detalhar qual verificação falhou e sem ecoar assinatura, credencial, `challenge` ou dado do caso — nenhum Problem Details transporta material criptográfico nem conteúdo do caso. `If-Match` ecoa a `revision` do desafio emitido, nunca `*`. O replay da mesma `Idempotency-Key` com o mesmo corpo devolve a prova guardada: é o retry cuja verificação já aconteceu mas cuja resposta se perdeu — e a prova assim recuperada continua de uso único, consumida uma vez no commit do ato.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **desafio** emitido, o mesmo valor de `revision` na resposta `201` que o criou. Compare-and-set: revisão velha é `412`, sem reexecutar a cerimônia. O curinga `*` não é elegível — quem nunca viu o desafio também o enviaria —, e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let challengeId = "challengeId_example" // String | Desafio de step-up emitido por `startPersonalStepUpChallenge`. Identidade opaca, que não autoriza nada por si.
let verifyPersonalStepUpChallengeRequest = VerifyPersonalStepUpChallengeRequest(assertion: WebAuthnAssertionResponse(id: "id_example", rawId: "rawId_example", type: "type_example", response: WebAuthnAssertionResponse_response(clientDataJSON: "clientDataJSON_example", authenticatorData: "authenticatorData_example", signature: "signature_example", userHandle: "userHandle_example"))) // VerifyPersonalStepUpChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Verificar a asserção WebAuthn e emitir a prova opaca do ato
PersonalStepUpAPI.verifyPersonalStepUpChallenge(idempotencyKey: idempotencyKey, ifMatch: ifMatch, challengeId: challengeId, verifyPersonalStepUpChallengeRequest: verifyPersonalStepUpChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **desafio** emitido, o mesmo valor de &#x60;revision&#x60; na resposta &#x60;201&#x60; que o criou. Compare-and-set: revisão velha é &#x60;412&#x60;, sem reexecutar a cerimônia. O curinga &#x60;*&#x60; não é elegível — quem nunca viu o desafio também o enviaria —, e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **challengeId** | **String** | Desafio de step-up emitido por &#x60;startPersonalStepUpChallenge&#x60;. Identidade opaca, que não autoriza nada por si. |
 **verifyPersonalStepUpChallengeRequest** | [**VerifyPersonalStepUpChallengeRequest**](VerifyPersonalStepUpChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStepUpProofView**](PersonalStepUpProofView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
