# InvitationJourneysAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createInvitationJourney**](InvitationJourneysAPI.md#createinvitationjourney) | **POST** /invitation-journeys | Trocar um código público por uma jornada curta
[**createPendingStudentInvitationJourney**](InvitationJourneysAPI.md#creatependingstudentinvitationjourney) | **POST** /student-invitations/pending/{invitationId}/journey | Criar jornada para um convite pendente escolhido
[**listPendingStudentInvitations**](InvitationJourneysAPI.md#listpendingstudentinvitations) | **GET** /student-invitations/pending | Listar convites pendentes da identidade verificada
[**startInvitationEmailDiscoveryChallenge**](InvitationJourneysAPI.md#startinvitationemaildiscoverychallenge) | **POST** /student-invitations/email-discovery-challenges | Pedir um código para provar a posse de um endereço digitado (\&quot;Tenho um convite\&quot;)
[**verifyInvitationEmailDiscoveryChallenge**](InvitationJourneysAPI.md#verifyinvitationemaildiscoverychallenge) | **POST** /student-invitations/email-discovery-challenges/{challengeId}/verification | Verificar o código do endereço digitado e ver os convites pendentes dele


# **createInvitationJourney**
```swift
    open class func createInvitationJourney(createInvitationJourneyRequest: CreateInvitationJourneyRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: InvitationJourneyView?, _ error: Error?) -> Void)
```

Trocar um código público por uma jornada curta

Recebe somente o `linkCode` da URL first-party `https://join.pliora.quantumopsai.com/i/{linkCode}` e devolve uma credencial curta. Não aceita, recusa, abre ou consome convite. A resposta desconhecida é indistinguível de código revogado e não publica e-mail ou PII. `journeyToken` nunca entra em URL, logs ou analytics e expira em no máximo trinta minutos, limitado pela validade do convite.

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
    open class func createPendingStudentInvitationJourney(invitationId: String, createPendingInvitationJourneyRequest: CreatePendingInvitationJourneyRequest, acceptLanguage: String? = nil, idempotencyKey: String? = nil, completion: @escaping (_ data: InvitationJourneyView?, _ error: Error?) -> Void)
```

Criar jornada para um convite pendente escolhido

Cria a credencial curta para o convite escolhido. O convite é elegível por um de dois caminhos, e só por eles: o destino corresponde a um e-mail verificado da sessão, ou o corpo traz `emailDiscoveryProofId`, uma prova de endereço desta conta, ainda válida e não usada, cujo endereço provado é o destino deste convite. Inexistente, alheio e inelegível respondem de forma indistinguível. Não aceita, abre nem consome o convite. **A prova de posse nasce aqui, e só para este convite.** Com `emailDiscoveryProofId`, a operação consome a prova de endereço — que é de uso único, presa à conta e válida por 30 minutos — e grava a prova de posse **somente** do convite do path, no mesmo registro do desafio de posse do convite (`DEC-CONV-7`, sem emenda). Daí em diante o caminho é o de sempre: o contexto de aceite responde `emailOwnership.status = PROVEN` e o aceite segue pela única porta que existe. Outro convite do mesmo endereço exige novo código. Nada aqui altera o e-mail da conta. **Prova alheia, vencida, já usada ou de outro destino** responde o mesmo `404` indistinguível de um convite inexistente, e esse `404` **não consome** a prova: só a criação da jornada a consome. **`Idempotency-Key` é obrigatória quando `emailDiscoveryProofId` vem no corpo**, e a falta dela é `422 VALIDATION_ERROR`. A repetição com a mesma chave e o mesmo corpo devolve a mesma jornada, de modo que uma resposta perdida não queima a prova de uso único. A mesma chave com outro `invitationId` ou outro corpo responde `409 IDEMPOTENCY_CONFLICT` e nada é consumido. Sem a prova, a chave é aceita e ignorada.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String |
let createPendingInvitationJourneyRequest = CreatePendingInvitationJourneyRequest(platform: InvitationJourneyPlatform(), emailDiscoveryProofId: "emailDiscoveryProofId_example", appInstallationId: "appInstallationId_example") // CreatePendingInvitationJourneyRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica. Obrigatória quando o corpo traz `emailDiscoveryProofId`; sem ela, a recusa é `422 VALIDATION_ERROR`. (optional)

// Criar jornada para um convite pendente escolhido
InvitationJourneysAPI.createPendingStudentInvitationJourney(invitationId: invitationId, createPendingInvitationJourneyRequest: createPendingInvitationJourneyRequest, acceptLanguage: acceptLanguage, idempotencyKey: idempotencyKey) { (response, error) in
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
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica. Obrigatória quando o corpo traz &#x60;emailDiscoveryProofId&#x60;; sem ela, a recusa é &#x60;422 VALIDATION_ERROR&#x60;. | [optional]

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

# **startInvitationEmailDiscoveryChallenge**
```swift
    open class func startInvitationEmailDiscoveryChallenge(idempotencyKey: String, startInvitationEmailDiscoveryChallengeRequest: StartInvitationEmailDiscoveryChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: InvitationEmailDiscoveryChallengeView?, _ error: Error?) -> Void)
```

Pedir um código para provar a posse de um endereço digitado (\"Tenho um convite\")

Fluxo \"Tenho um convite\": a pessoa já entrou, não tem o link à mão e informa o e-mail para o qual o convite foi enviado. Só existe com sessão: antes do login não há conta a que prender a prova, e a operação viraria um disparador público de e-mail. **Nenhuma resposta depende de existir convite** para o endereço: nem este pedido, nem as recusas da verificação, nem o `429`. O `202` é idêntico, com os mesmos campos e a mesma latência, haja ou não convite pendente para o endereço, porque o envio é assíncrono, por fila. Só depois do código certo a verificação mostra o resultado. **O desafio é sempre persistido**, com ou sem convite, num registro que não depende de convite. **Sem convite, nenhum código é enviado**; mesmo assim **o desafio sem convite segue o mesmo ciclo de tentativas e validade de um real**: cada código digitado conta tentativa, a última esgota o desafio e, depois da validade, ele expira. Um desafio que nunca se esgotasse nem expirasse revelaria o resultado em poucas tentativas. **Limites contam pedidos, nunca envios**: por conta, por endereço (somando contas), por aparelho e um teto global. Pedir de novo antes de `resendAvailableAt` responde `429` com `Retry-After`. `422 VALIDATION_ERROR` depende só do endereço e da própria conta: endereço malformado, ou igual ao e-mail verificado da conta, caso que a descoberta comum já cobre. **Os parâmetros do desafio são do servidor.** `expiresAt`, `resendAvailableAt` e `maxAttempts` chegam prontos; quantas tentativas restam não é publicado. O endereço digitado não é adicionado à conta, não troca o e-mail principal e nunca é devolvido em claro: a resposta publica só `destinationMasked`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startInvitationEmailDiscoveryChallengeRequest = StartInvitationEmailDiscoveryChallengeRequest(email: "email_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartInvitationEmailDiscoveryChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Pedir um código para provar a posse de um endereço digitado (\"Tenho um convite\")
InvitationJourneysAPI.startInvitationEmailDiscoveryChallenge(idempotencyKey: idempotencyKey, startInvitationEmailDiscoveryChallengeRequest: startInvitationEmailDiscoveryChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **startInvitationEmailDiscoveryChallengeRequest** | [**StartInvitationEmailDiscoveryChallengeRequest**](StartInvitationEmailDiscoveryChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**InvitationEmailDiscoveryChallengeView**](InvitationEmailDiscoveryChallengeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyInvitationEmailDiscoveryChallenge**
```swift
    open class func verifyInvitationEmailDiscoveryChallenge(idempotencyKey: String, challengeId: String, verifyInvitationEmailDiscoveryChallengeRequest: VerifyInvitationEmailDiscoveryChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: InvitationEmailDiscoveryVerificationView?, _ error: Error?) -> Void)
```

Verificar o código do endereço digitado e ver os convites pendentes dele

Confere o código enviado ao endereço digitado e, em caso de acerto, devolve os convites pendentes daquele endereço e uma **prova de endereço**. Quem prova a posse vê o mesmo que veria entrando por \"e-mail com código\" com aquele endereço; lista vazia é resposta válida. **Nenhuma resposta de recusa depende de existir convite.** Num desafio sem convite, a sequência é a de um desafio real com código errado: `403 OTP_CODE_INVALID` a cada tentativa, `403 OTP_ATTEMPTS_EXHAUSTED` na última e `410 OTP_CODE_EXPIRED` depois da validade. O `429` é o mesmo nos dois casos. `challengeId` de outra conta responde `404`, indistinguível de um inexistente. **A prova de endereço é de uso único, presa à conta e válida por 30 minutos, e não autoriza aceite.** Ela serve só para abrir, em `createPendingStudentInvitationJourney`, a jornada de **um** convite daquele endereço. **A prova de posse nasce só na jornada do convite escolhido**: esta operação não grava prova de posse de convite, não altera o e-mail da conta e não devolve token de aceite, `linkCode` nem `journeyToken`. **Quantas tentativas restam não é publicado.**

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let challengeId = "challengeId_example" // String |
let verifyInvitationEmailDiscoveryChallengeRequest = VerifyInvitationEmailDiscoveryChallengeRequest(code: "code_example") // VerifyInvitationEmailDiscoveryChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Verificar o código do endereço digitado e ver os convites pendentes dele
InvitationJourneysAPI.verifyInvitationEmailDiscoveryChallenge(idempotencyKey: idempotencyKey, challengeId: challengeId, verifyInvitationEmailDiscoveryChallengeRequest: verifyInvitationEmailDiscoveryChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **verifyInvitationEmailDiscoveryChallengeRequest** | [**VerifyInvitationEmailDiscoveryChallengeRequest**](VerifyInvitationEmailDiscoveryChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**InvitationEmailDiscoveryVerificationView**](InvitationEmailDiscoveryVerificationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
