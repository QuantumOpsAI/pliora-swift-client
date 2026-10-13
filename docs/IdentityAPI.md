# IdentityAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authorizeAccountEmailConfirmationOrigin**](IdentityAPI.md#authorizeaccountemailconfirmationorigin) | **POST** /identity/account/email-confirmation/attempts/{attemptId}/origin-proof | Validar prova exclusiva de origem da mesma conta
[**cancelAccountEmailConfirmationAttempt**](IdentityAPI.md#cancelaccountemailconfirmationattempt) | **POST** /identity/account/email-confirmation/attempts/{attemptId}/cancellation | Cancelar tentativa pendente sem alegar desfazer commit conhecido
[**confirmAccountEmail**](IdentityAPI.md#confirmaccountemail) | **POST** /identity/account/email-confirmation/attempts/{attemptId}/verification | Confirmar endereço na mesma conta em commit atômico
[**getAccountEmailConfirmationAttempt**](IdentityAPI.md#getaccountemailconfirmationattempt) | **GET** /identity/account/email-confirmation/attempts/{attemptId} | Reler tentativa e entrega para retomar ou resolver resposta perdida
[**getAccountEmailConfirmationAvailability**](IdentityAPI.md#getaccountemailconfirmationavailability) | **GET** /identity/account/email-confirmation | Consultar oferta opcional autenticada
[**getAuthenticatedIdentityProfile**](IdentityAPI.md#getauthenticatedidentityprofile) | **GET** /identity/me | Obter a identidade de apresentação da sessão autenticada
[**getEntryContext**](IdentityAPI.md#getentrycontext) | **GET** /identity/entry-context | Ler os contextos atuais da conta autenticada, fora de /sync
[**proveSocialIdentity**](IdentityAPI.md#provesocialidentity) | **POST** /identity/social-proof | Trocar prova externa por um contexto de identidade FitApp
[**proveSocialIdentityJourney**](IdentityAPI.md#provesocialidentityjourney) | **POST** /identity/journeys/social-proof | Trocar prova social pela próxima etapa segura da jornada
[**startAccountEmailConfirmationAttempt**](IdentityAPI.md#startaccountemailconfirmationattempt) | **POST** /identity/account/email-confirmation/attempts | Abrir tentativa da própria conta sem alterar endereço
[**startAccountEmailConfirmationDestinationChallenge**](IdentityAPI.md#startaccountemailconfirmationdestinationchallenge) | **POST** /identity/account/email-confirmation/attempts/{attemptId}/destination-challenges | Pedir posse do destino após origem autorizada
[**startAccountEmailConfirmationOriginIntent**](IdentityAPI.md#startaccountemailconfirmationoriginintent) | **POST** /identity/account/email-confirmation/attempts/{attemptId}/origin-intents | Abrir autorização contemporânea da origem
[**startAccountLinkingChallenge**](IdentityAPI.md#startaccountlinkingchallenge) | **POST** /identity/account/linking/challenges | Abrir a intenção de vincular um segundo provedor e receber o nonce que ele terá de assinar
[**startOtpChallenge**](IdentityAPI.md#startotpchallenge) | **POST** /identity/otp/challenges | Iniciar desafio OTP com resposta não enumerável
[**startOtpJourneyChallenge**](IdentityAPI.md#startotpjourneychallenge) | **POST** /identity/journeys/otp/challenges | Iniciar desafio OTP preservando a jornada opaca
[**submitAccountLinkingProof**](IdentityAPI.md#submitaccountlinkingproof) | **POST** /identity/account/linking/challenges/{challengeId}/proof | Apresentar a prova contemporânea do provedor e, se os e-mails divergirem, receber o desafio de posse
[**verifyAccountLinkingChallenge**](IdentityAPI.md#verifyaccountlinkingchallenge) | **POST** /identity/account/linking/challenges/{challengeId}/verification | Verificar o código de posse e unificar as contas
[**verifyOtpChallenge**](IdentityAPI.md#verifyotpchallenge) | **POST** /identity/otp/challenges/{challengeId}/verification | Verificar OTP e emitir sessão FitApp
[**verifyOtpJourneyChallenge**](IdentityAPI.md#verifyotpjourneychallenge) | **POST** /identity/journeys/otp/challenges/{challengeId}/verification | Verificar OTP e retornar a próxima etapa segura da jornada


# **authorizeAccountEmailConfirmationOrigin**
```swift
    open class func authorizeAccountEmailConfirmationOrigin(attemptId: String, idempotencyKey: String, authorizeAccountEmailConfirmationOriginRequest: AuthorizeAccountEmailConfirmationOriginRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailOriginAuthorizedView?, _ error: Error?) -> Void)
```

Validar prova exclusiva de origem da mesma conta

Origem aceita sem efeito na conta; autorização exclusiva de uso único. authorizedUntil=min(total, validade prova externa ou desafio ORIGIN original, verificação+5min); nonce consumido não precisa continuar aberto. Código DESTINATION/reenvio não estende autorização. Falta/expiração exige nova tentativa/provas, sem refresh silencioso. Autorização contemporânea cumulativa à sessão. SOCIAL_PROVIDER valida assinatura/issuer/audience/expiração/nonce e identidade já ligada à própria conta; token comum/login/terceiro/outra finalidade não vale. MAIL valida desafio exclusivo ORIGIN. Código de convite/destino não autoriza origem, mesmo com bytes iguais. Consume proof/nonce/challenge uma vez, mantém recusa/contador na transação. Login recém-concluído só serve se servidor comprovar e vincular prova à tentativa; bearer/timestamp local não basta. Credencial EMAIL real ligada conserva-se, não é criada aqui. Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let attemptId = "attemptId_example" // String |
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let authorizeAccountEmailConfirmationOriginRequest = AuthorizeAccountEmailConfirmationOriginRequest(method: "method_example", originIntentId: "originIntentId_example", proof: "proof_example", originChallengeId: "originChallengeId_example", code: "code_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // AuthorizeAccountEmailConfirmationOriginRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Validar prova exclusiva de origem da mesma conta
IdentityAPI.authorizeAccountEmailConfirmationOrigin(attemptId: attemptId, idempotencyKey: idempotencyKey, authorizeAccountEmailConfirmationOriginRequest: authorizeAccountEmailConfirmationOriginRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **attemptId** | **String** |  |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **authorizeAccountEmailConfirmationOriginRequest** | [**AuthorizeAccountEmailConfirmationOriginRequest**](AuthorizeAccountEmailConfirmationOriginRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailOriginAuthorizedView**](AccountEmailOriginAuthorizedView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelAccountEmailConfirmationAttempt**
```swift
    open class func cancelAccountEmailConfirmationAttempt(attemptId: String, idempotencyKey: String, cancelAccountEmailConfirmationAttemptRequest: CancelAccountEmailConfirmationAttemptRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailCancellationView?, _ error: Error?) -> Void)
```

Cancelar tentativa pendente sem alegar desfazer commit conhecido

CANCELLED só quando nenhum commit ocorreu, zero alteração da conta. Já confirmado retorna CONFIRMED real e exige releitura, nunca fake undo. Transporte incerto não autoriza afirmar cancelamento. Replay mesma chave/fingerprint devolve resultado após reautorizar conta/sessão; outra conta/finalidade/etapa/corpo/destino nunca reutiliza chave/prova. Nenhuma prova exigida. Cancelamento autenticado da própria tentativa invalida nonce/autorização/desafios/provas pendentes atomicamente antes do commit, impede commit tardio. Skip sem tentativa não chama esta rota. Resposta perdida: GET tentativa antes de repetir/afirmar cancelamento, e reler identidade se commit desconhecido; conta trocada descarta resposta. Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let attemptId = "attemptId_example" // String |
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let cancelAccountEmailConfirmationAttemptRequest = CancelAccountEmailConfirmationAttemptRequest(device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // CancelAccountEmailConfirmationAttemptRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Cancelar tentativa pendente sem alegar desfazer commit conhecido
IdentityAPI.cancelAccountEmailConfirmationAttempt(attemptId: attemptId, idempotencyKey: idempotencyKey, cancelAccountEmailConfirmationAttemptRequest: cancelAccountEmailConfirmationAttemptRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **attemptId** | **String** |  |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **cancelAccountEmailConfirmationAttemptRequest** | [**CancelAccountEmailConfirmationAttemptRequest**](CancelAccountEmailConfirmationAttemptRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailCancellationView**](AccountEmailCancellationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **confirmAccountEmail**
```swift
    open class func confirmAccountEmail(attemptId: String, idempotencyKey: String, confirmAccountEmailRequest: ConfirmAccountEmailRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailConfirmedView?, _ error: Error?) -> Void)
```

Confirmar endereço na mesma conta em commit atômico

Commit conhecido na mesma AccountId, endereço comum verificado e providers reais. Não fabrica subject Cognito/EMAIL, não edita claim históricoApple; C2/C3 Cognito real futuro resolve mesma conta pelo verified email e só então vincula identidade EMAIL. Obrigatório reler GET /identity/me + linkedProviders e Perfil do contexto; nunca escrever snapshots/emailKind/providers localmente. Falha de releitura é atualização pendente/retry, não hidden inventado. expiresAt é histórico da tentativa, não autorização nova. Prova exclusivamente DESTINATION na mesma tentativa; nenhum convite, target/email/proof ORIGIN ou AccountId escolhido. Commit atômico revalida sessão/ator/device, total, originAuthorizedUntil, destino/challenge/purpose/stage/validade, elegibilidade e origem canônica ainda vigente, unicidade/locks/CAS; consome ambas provas e tentativa uma vez. Colisão409 somente após ambas autorizadas, sem id/nome/email de terceiro nem fusão/stub/newaccount/transferência; mantém acessos e dados originais. Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let attemptId = "attemptId_example" // String |
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let confirmAccountEmailRequest = ConfirmAccountEmailRequest(destinationChallengeId: "destinationChallengeId_example", code: "code_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // ConfirmAccountEmailRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Confirmar endereço na mesma conta em commit atômico
IdentityAPI.confirmAccountEmail(attemptId: attemptId, idempotencyKey: idempotencyKey, confirmAccountEmailRequest: confirmAccountEmailRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **attemptId** | **String** |  |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **confirmAccountEmailRequest** | [**ConfirmAccountEmailRequest**](ConfirmAccountEmailRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailConfirmedView**](AccountEmailConfirmedView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountEmailConfirmationAttempt**
```swift
    open class func getAccountEmailConfirmationAttempt(attemptId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailAttemptView?, _ error: Error?) -> Void)
```

Reler tentativa e entrega para retomar ou resolver resposta perdida

Leitura autenticada mesma conta/sessão/tentativa para lostresponse/retomada. Alien/missing/expired unavailable uniform410; EXPIRED só tombstone já conhecido e ainda legível, sem reativar prova. Estado fechado exige exatamente payload da etapa, nada de origem/hint/endereço privado/proof/código. Pending→ready só após transporte confirmado; instantes não são prorrogados. CONFIRMED/CANCELLED terminais preservam expiresAt histórico, não dão autorização. Conta trocada/resultados tardios descartados. Após knowncommit reler identidade/providers/Perfil; se cancel incerto, esta leitura decide antes de alegar zero efeito.  Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let attemptId = "attemptId_example" // String |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Reler tentativa e entrega para retomar ou resolver resposta perdida
IdentityAPI.getAccountEmailConfirmationAttempt(attemptId: attemptId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **attemptId** | **String** |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailAttemptView**](AccountEmailAttemptView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountEmailConfirmationAvailability**
```swift
    open class func getAccountEmailConfirmationAvailability(platform: Platform_getAccountEmailConfirmationAvailability, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailConfirmationAvailabilityView?, _ error: Error?) -> Void)
```

Consultar oferta opcional autenticada

Oferta autenticada opcional nos contextos Personal/Aluno/sem espaço/ambos, pela classificação da conta e não pelo provider corrente. AVAILABLE exige origem realmente suportada/ligada e transporte destino habilitado. NOT_ELIGIBLE é conta comum. UNAVAILABLE protege a conta sem abrir desafio impossível. Pular oferta sem tentativa é operação local sem request, Idempotency-Key, prova ou comando dependente: nunca bloqueia C1/nextStep/continuation/convite/onboarding/app/treino. Perfil retoma a mesma família após pular.  Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let platform = "platform_example" // String | Seleciona métodos suportados, nunca autoriza origem. Servidor confere plataforma/device e disponibilidade real.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Consultar oferta opcional autenticada
IdentityAPI.getAccountEmailConfirmationAvailability(platform: platform, acceptLanguage: acceptLanguage) { (response, error) in
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
 **platform** | **String** | Seleciona métodos suportados, nunca autoriza origem. Servidor confere plataforma/device e disponibilidade real. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailConfirmationAvailabilityView**](AccountEmailConfirmationAvailabilityView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAuthenticatedIdentityProfile**
```swift
    open class func getAuthenticatedIdentityProfile(acceptLanguage: String? = nil, completion: @escaping (_ data: AuthenticatedIdentityProfile?, _ error: Error?) -> Void)
```

Obter a identidade de apresentação da sessão autenticada

Retorna somente os dados da própria conta necessários para o Perfil e para comunicar como a sessão atual foi iniciada. O nome é opcional e vem apenas do perfil autorado pelo profissional; e-mail, convite e atributos do provedor nunca são usados para fabricar um nome. COGNITO é apresentado ao cliente como EMAIL, e o app omite essa origem na interface. **Formas de entrar da conta.** `linkedProviders` lista todas as formas de entrar que a conta já aceita, e não só a da sessão atual (`provider`): é o que a tela de vinculação lista e o que ela deixa de oferecer. Nunca vem vazia. **E-mail oculto não é exibido.** Numa conta Apple com *Ocultar Meu E-mail*, o e-mail verificado é o relay da Apple, que não é o e-mail pessoal da pessoa (ADR-0007 §5). `emailKind = HIDDEN_EMAIL` marca esse caso e o endereço é omitido: o relay nunca sai por esta operação. Com `emailKind = EMAIL`, `email` vem sempre.

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

Leitura autenticada do que a conta é e do que o servidor decide para ela **agora**: as capacidades que ela já detém — só aluno, só profissional, ambos ou nenhuma — e se há escolha de jornada pendente. É a mesma projeção que as jornadas de entrada publicam no login, no mesmo vocabulário (`nextStep` e `invitationContext`), para o app que relança com a sessão restaurada e não apresenta prova de identidade nova. **Esta rota substitui `GET /sync/scope` para os clientes móveis**, que a chamavam apenas para descobrir o papel da conta: `/sync/_*` não é usado pelo runtime móvel do MVP e o descritor de escopo é chave de store de sincronização, não leitura de contexto de produto. **Qual espaço o app abre não é decidido aqui.** `contexts` é a lista autorizada nesta leitura e nada mais. Quem detém as duas capacidades abre o último espaço utilizado, decidido pelo app por uma preferência local que só desempata entre valores de `contexts` desta leitura e nunca autoriza nada; sem preferência válida contra `contexts`, o app apresenta a escolha. **Duas coisas diferentes.** `contexts` são capacidades já concedidas, registradas no servidor quando nasceram dos atos que as criaram — aceitar um convite, concluir o onboarding profissional. `nextStep` é a escolha de jornada, e é dela que vale a regra do owner: **não existe papel global salvo**. Nenhuma escolha de entrada é persistida, nenhuma preferência de jornada é guardada, nada é derivado do provedor de identidade usado no login, e a leitura seguinte com convite válido volta a perguntar. **Ler não consome nada.** Um convite exposto como preservado continua utilizável: esta operação não aceita, recusa, elege nem cancela convite, e seguir pela jornada profissional também não o consome. Se o servidor não consegue estabelecer o contexto — a contagem de convites aceitáveis ou a leitura da conta falha —, a resposta é `503 ENTRY_CONTEXT_UNAVAILABLE`: é retentável e **nunca** significa \"sem contexto\", \"sem convite\" ou \"não é aluno\". O cliente preserva o que já tinha e repete a leitura. Nenhum dado de saúde trafega aqui e nenhum dado pessoal entra em query string: a operação não tem parâmetro de seleção de conta, capacidade ou convite.

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

# **startAccountEmailConfirmationAttempt**
```swift
    open class func startAccountEmailConfirmationAttempt(idempotencyKey: String, startAccountEmailConfirmationAttemptRequest: StartAccountEmailConfirmationAttemptRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailAttemptOpenedView?, _ error: Error?) -> Void)
```

Abrir tentativa da própria conta sem alterar endereço

Tentativa sem efeito sobre conta:Vincula conta/ator/sessão ativa/device/destino normalizado/finalidade, expiresAt total≤10min fixo. Sem renovar prazos por transição/reenvio; destino diferente exige nova tentativa. Métodos de origem vêm do servidor, nativos já ligados e suportados; fallback caixa original só quando provider original não autentica nesta plataforma e transporte funciona. Não publica origem/destino/hints. Destino digitado normalizado exclusivamente no servidor e elegível como endereço comum. Nunca origem/AccountId/purpose/prova/convite do cliente. Só conta canônica HIDDEN_EMAIL sem endereço comum confirmado é elegível; não alterar conta comum. Não expor existência de conta de terceiro antes das duas provas. Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startAccountEmailConfirmationAttemptRequest = StartAccountEmailConfirmationAttemptRequest(destinationEmail: "destinationEmail_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartAccountEmailConfirmationAttemptRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abrir tentativa da própria conta sem alterar endereço
IdentityAPI.startAccountEmailConfirmationAttempt(idempotencyKey: idempotencyKey, startAccountEmailConfirmationAttemptRequest: startAccountEmailConfirmationAttemptRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **startAccountEmailConfirmationAttemptRequest** | [**StartAccountEmailConfirmationAttemptRequest**](StartAccountEmailConfirmationAttemptRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailAttemptOpenedView**](AccountEmailAttemptOpenedView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startAccountEmailConfirmationDestinationChallenge**
```swift
    open class func startAccountEmailConfirmationDestinationChallenge(attemptId: String, idempotencyKey: String, startAccountEmailConfirmationDestinationChallengeRequest: StartAccountEmailConfirmationDestinationChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailDestinationChallengeView?, _ error: Error?) -> Void)
```

Pedir posse do destino após origem autorizada

Nenhuma confirmação de conta. Pending não abre código, ready só depois transporte confirmado. Falta de transporte503 desfaz desafio inviável. expiresAt do desafio≤min(total,originAuthorizedUntil,emissão+10min); cooldown60s/5tentativas e orçamento por conta/endereço/device/global. GET da tentativa observa transição pending→ready; nunca202 interpretado como entrega. Destino fixado na tentativa; não aceitar novo email/origem/challenge/proof/purpose no body. Revalidar sessão, total e autorização ORIGIN antes de pedir ao emissor compartilhado stage DESTINATION, sem predicado de convite pendente D4 (exclusivo INVITATION_DISCOVERY). Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let attemptId = "attemptId_example" // String |
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startAccountEmailConfirmationDestinationChallengeRequest = StartAccountEmailConfirmationDestinationChallengeRequest(device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartAccountEmailConfirmationDestinationChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Pedir posse do destino após origem autorizada
IdentityAPI.startAccountEmailConfirmationDestinationChallenge(attemptId: attemptId, idempotencyKey: idempotencyKey, startAccountEmailConfirmationDestinationChallengeRequest: startAccountEmailConfirmationDestinationChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **attemptId** | **String** |  |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **startAccountEmailConfirmationDestinationChallengeRequest** | [**StartAccountEmailConfirmationDestinationChallengeRequest**](StartAccountEmailConfirmationDestinationChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailDestinationChallengeView**](AccountEmailDestinationChallengeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startAccountEmailConfirmationOriginIntent**
```swift
    open class func startAccountEmailConfirmationOriginIntent(attemptId: String, idempotencyKey: String, startAccountEmailConfirmationOriginIntentRequest: StartAccountEmailConfirmationOriginIntentRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountEmailOriginIntentView?, _ error: Error?) -> Void)
```

Abrir autorização contemporânea da origem

Intenção exclusivamente ORIGIN. Nonce servido ou entrega original pendente/pronta, sem troca de conta/endereço/provider. Missing transport503 não deixa código ativo inviável. Reenvio após prazo servido usa nova chave lógica, invalida antigo; replay mesma chave/corpo devolve estado original sem emitir de novo. Origem vem da conta no servidor. SOCIAL_PROVIDER usa provider já ligado, sem novo vínculo; Apple somente IOS. ORIGINAL_EMAIL_POSSESSION não recebe endereço de origem nem provider e só é permitido quando autenticação original indisponível na plataforma; servidor envia à caixa canônica original sem revelar relay/hint. Platform declarada seleciona UX, não autoriza: conferir device e matriz server-side. Autoridade: DOC-ACCOUNT-UNIFICATION-AND-ANTI-ATO-LINKING §4.1/4.1.1/4.2/4.3 em pliora-docs42cd0bff, contracts#214. Todas as operações reautorizam conta/ator/sessão/device e tentativa; nunca dependem de espaço/papel/provider corrente. C7/C8 e IdentityJourneyResponse.nextStep/continuation/invitation permanecem intactos. Código/proof/nonce/destino não vão a log/telemetria/erro. Mesmo fingerprint/chave/corpo reproduz resultado técnico guardado sem enviar/consumir duas vezes; outra conta/finalidade/etapa/destino/corpo é recusa. Transação recusada preserva contadores antiabuso sem alterar conta; transporte indisponível503 não deixa desafio impossível ativo. Nenhum202 declara entrega.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let attemptId = "attemptId_example" // String |
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startAccountEmailConfirmationOriginIntentRequest = StartAccountEmailConfirmationOriginIntentRequest(method: "method_example", provider: "provider_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartAccountEmailConfirmationOriginIntentRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abrir autorização contemporânea da origem
IdentityAPI.startAccountEmailConfirmationOriginIntent(attemptId: attemptId, idempotencyKey: idempotencyKey, startAccountEmailConfirmationOriginIntentRequest: startAccountEmailConfirmationOriginIntentRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **attemptId** | **String** |  |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **startAccountEmailConfirmationOriginIntentRequest** | [**StartAccountEmailConfirmationOriginIntentRequest**](StartAccountEmailConfirmationOriginIntentRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountEmailOriginIntentView**](AccountEmailOriginIntentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startAccountLinkingChallenge**
```swift
    open class func startAccountLinkingChallenge(idempotencyKey: String, startAccountLinkingChallengeRequest: StartAccountLinkingChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountLinkingIntentView?, _ error: Error?) -> Void)
```

Abrir a intenção de vincular um segundo provedor e receber o nonce que ele terá de assinar

Primeiro passo de C7 no catálogo de identidade. Cria a intenção de vinculação e devolve o `nonce` de uso único que o provedor secundário terá de assinar. **Por que existe.** Apple Sign-In com *Ocultar Meu E-mail* entrega um endereço de relay (`…@privaterelay.appleid.com`) e o Google entrega o endereço real. A resolução por e-mail verificado não reconhece os dois como a mesma pessoa, e nasce uma segunda conta — sem personal, sem anamnese, sem histórico. Antes desta sequência a colisão de relay terminava em `401` sem informação de recuperação; aqui ela tem caminho. **Por que este passo é separado da prova.** O `nonce` que impede replay tem de ser escolhido pelo servidor **depois** que a intenção existe. Um `nonce` que o cliente derivasse da própria sessão seria constante enquanto a sessão durasse, e um único token do provedor serviria para toda tentativa de vinculação daquela sessão — o replay que o protocolo precisa fechar. Por isso a prova vem no passo seguinte, e não aqui. **Nada é vinculado, nenhum código é enviado e nenhuma conta é tocada.** Abrir a intenção não altera vínculo algum; abandoná-la a deixa expirar sem efeito, e `410 CHALLENGE_UNAVAILABLE` é o que os passos seguintes respondem depois disso. **O endereço alvo não é campo deste pedido.** Ele é derivado da prova no passo seguinte, de modo que dizer o e-mail de outra pessoa nunca reivindique a caixa postal dela. Apple fora de iOS está fora da matriz da plataforma e é recusada pelo próprio schema, como em `POST /identity/social-proof`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startAccountLinkingChallengeRequest = StartAccountLinkingChallengeRequest(targetProvider: "targetProvider_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // StartAccountLinkingChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abrir a intenção de vincular um segundo provedor e receber o nonce que ele terá de assinar
IdentityAPI.startAccountLinkingChallenge(idempotencyKey: idempotencyKey, startAccountLinkingChallengeRequest: startAccountLinkingChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **startAccountLinkingChallengeRequest** | [**StartAccountLinkingChallengeRequest**](StartAccountLinkingChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountLinkingIntentView**](AccountLinkingIntentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

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

# **submitAccountLinkingProof**
```swift
    open class func submitAccountLinkingProof(idempotencyKey: String, challengeId: String, submitAccountLinkingProofRequest: SubmitAccountLinkingProofRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountLinkingProofView?, _ error: Error?) -> Void)
```

Apresentar a prova contemporânea do provedor e, se os e-mails divergirem, receber o desafio de posse

Segundo passo de C7. Avalia a **prova contemporânea** do provedor secundário contra a intenção que a precede e decide, no servidor, entre vincular direto e exigir prova de posse do endereço da conta alvo. **A prova é opaca e presa a esta intenção.** `proof` carrega o ID token do provedor assinado sobre o `nonce` que o passo anterior devolveu. Token emitido para login comum, ou para outra intenção, é recusado com `401 AUTHENTICATION_FAILED`. O cliente não interpreta `proof` e nunca o registra em log. **Posse nunca é presumida.** Se os endereços coincidirem e não houver conta secundária, o provedor é vinculado e a resposta é `200`. Se divergirem, ou se aquele provedor pertencer a outra conta, o servidor emite um desafio de posse ao endereço da conta alvo e responde `202`. **Só a verificação unifica.** **Nada aqui arquiva conta.** Uma resposta `202` não migrou identidade, não revogou sessão e não aplicou arquivamento: as duas contas seguem exatamente como estavam. Pedir, falhar ou abandonar a verificação preserva o estado anterior. **Fusão automática com dados em conflito é proibida.** Se as duas contas tiverem dados de negócio concluídos, a unificação é recusada com `409 ACCOUNT_DATA_CONFLICT` e passa a exigir suporte assistido; o contrato não publica caminho automático para esse caso. **A resposta `202` é uniforme e não enumera.** `destinationHint` é mascarado e não confirma a existência da conta alvo; o endereço não é publicado nem mascarado, e o saldo de tentativas não é publicado. Intenção expirada, consumida ou inexistente responde `410 CHALLENGE_UNAVAILABLE`, sem distinção observável entre os três.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let challengeId = "challengeId_example" // String |
let submitAccountLinkingProofRequest = SubmitAccountLinkingProofRequest(proof: "proof_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // SubmitAccountLinkingProofRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Apresentar a prova contemporânea do provedor e, se os e-mails divergirem, receber o desafio de posse
IdentityAPI.submitAccountLinkingProof(idempotencyKey: idempotencyKey, challengeId: challengeId, submitAccountLinkingProofRequest: submitAccountLinkingProofRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **submitAccountLinkingProofRequest** | [**SubmitAccountLinkingProofRequest**](SubmitAccountLinkingProofRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountLinkingProofView**](AccountLinkingProofView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyAccountLinkingChallenge**
```swift
    open class func verifyAccountLinkingChallenge(idempotencyKey: String, challengeId: String, verifyAccountLinkingChallengeRequest: VerifyAccountLinkingChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AccountUnifiedView?, _ error: Error?) -> Void)
```

Verificar o código de posse e unificar as contas

C8 do catálogo de identidade, e **a única transação que unifica**. Confere o código enviado ao endereço da conta alvo e, em caso de acerto, migra a identidade externa para a conta autenticada, revoga as sessões da conta secundária e arquiva o registro dela — de forma indivisível. Se qualquer parte falhar, nada disso aconteceu. **Três fatores de posse, e nenhum presumido.** Chegar aqui já exigiu a sessão da conta primária e a prova contemporânea do provedor secundário presa à intenção; este passo acrescenta a posse da caixa postal da conta alvo. Nenhuma vinculação com e-mail divergente se completa sem os três. **Seis dígitos, e não oito.** O emissor é o desafio de **posse** da plataforma, que emite seis dígitos, e não o `EMAIL_OTP` do Cognito, que emite oito e **autentica**: autenticar como a conta alvo seria o oposto do que este protocolo quer, e a conta alvo pode não ter identidade Cognito nenhuma. **Arquivar exige elegibilidade.** A conta secundária só é absorvida quando não tem dados de negócio concluídos. Se as duas tiverem, a recusa é `409 ACCOUNT_DATA_CONFLICT` e a unificação não acontece — nem parcialmente. **Código errado é falha recuperável**: o desafio continua de pé e a pessoa tenta de novo, com `401 AUTHENTICATION_FAILED`. Esgotar as tentativas, consumir ou deixar expirar encerra o **desafio**, não a conta, e responde `410 CHALLENGE_UNAVAILABLE` — o mesmo código que o restante da família de identidade publica, sem distinguir expirado de consumido de inexistente, para que o desafio não vire oráculo. Abre-se outra intenção e recomeça; código expirado nunca é reativado. **Quantas tentativas restam não é publicado**, aqui nem no passo anterior, e nenhuma recusa revela o e-mail, o identificador ou qualquer dado da outra conta.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let challengeId = "challengeId_example" // String |
let verifyAccountLinkingChallengeRequest = VerifyAccountLinkingChallengeRequest(code: "code_example", device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example")) // VerifyAccountLinkingChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Verificar o código de posse e unificar as contas
IdentityAPI.verifyAccountLinkingChallenge(idempotencyKey: idempotencyKey, challengeId: challengeId, verifyAccountLinkingChallengeRequest: verifyAccountLinkingChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **verifyAccountLinkingChallengeRequest** | [**VerifyAccountLinkingChallengeRequest**](VerifyAccountLinkingChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AccountUnifiedView**](AccountUnifiedView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

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

O servidor recupera o convite opaco ligado ao challenge. A resposta distingue onboarding, sessão emitida e escolha de jornada; a divergência entre o e-mail da conta e o destino do convite é resolvida depois, por prova de posse no contexto de aceite. E-mail nunca autoriza vínculo e o convite não é aceito por esta operação. Se o servidor não consegue estabelecer o contexto de entrada, a resposta é `503 ENTRY_CONTEXT_UNAVAILABLE` e nenhuma sessão é emitida. Isso cobre o vínculo convite↔challenge ilegível — avaliado **antes** de verificar o código —, a contagem de convites aceitáveis e a releitura da conta recém-resolvida. Um vínculo ilegível nunca é lido como ausência de convite.

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
