# StudentPushAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deactivateStudentPushDestination**](StudentPushAPI.md#deactivatestudentpushdestination) | **DELETE** /student/push-destinations/{installationId} | Desativar um destino de push do aluno
[**getStudentPushDestinations**](StudentPushAPI.md#getstudentpushdestinations) | **GET** /student/push-destinations | Ler os destinos de push do aluno e a revisão do controle
[**upsertStudentPushDestination**](StudentPushAPI.md#upsertstudentpushdestination) | **PUT** /student/push-destinations/{installationId} | Registrar ou atualizar um destino de push do aluno


# **deactivateStudentPushDestination**
```swift
    open class func deactivateStudentPushDestination(installationId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentPushDestinationView?, _ error: Error?) -> Void)
```

Desativar um destino de push do aluno

Desativação **idempotente** do próprio destino, pelo mesmo motivo da exceção (`DOC-ANAMNESIS-BY-RELATIONSHIP` §5.3): o app a chama ao sair da conta, ao trocar de conta e quando a permissão do SO deixa de estar concedida. O sucesso marca `INACTIVE` e avança a `revision` uma vez; repetir a desativação sobre a `revision` corrente de um destino já `INACTIVE` responde `200` sem efeito novo — desativar duas vezes nunca é erro. A desativação **não depende do provedor**: token rotacionado, removido ou expirado no FCM/APNs não muda a resposta. Um destino `INACTIVE` volta a `ACTIVE` somente por `upsertStudentPushDestination` com token novo e a `revision` do destino — nunca por esta operação. `installationId` que a conta não conhece — nunca registrado por ela ou registrado por **outra conta** — responde o `404` indistinguível `PUSH_DESTINATION_NOT_FOUND`: destino alheio não pode ser desativado e sua existência não é revelada por este caminho. `If-Match` obrigatório ecoa a `revision` do destino; `*` é `422` e revisão divergente é `412`, sem gravar. **Repetição:** a mesma `Idempotency-Key` com a mesma intenção devolve o resultado guardado depois de reautorizar a conta; a mesma chave para intenção distinta é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let installationId = "installationId_example" // String | Instalação endereçada, na identidade opaca gerada pelo app e registrada por `upsertStudentPushDestination`. Existência fora do escopo da conta nunca é revelada pela desativação — desconhecido e alheio respondem o mesmo `404` —, e alheio no upsert é `403 PUSH_DESTINATION_OWNED_BY_ANOTHER_ACCOUNT`.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | A revisão **exata** da precondição da escrita: a do **controle de destinos** — `revision` e `ETag` de `getStudentPushDestinations` — no primeiro registro de uma instalação que a conta não conhece, e a do **destino** (`StudentPushDestinationView.revision`) em update e desativação. O curinga `*` não é elegível: é o valor que quem nunca leu o controle também conseguiria enviar, e derrubaria exatamente a precondição. O `pattern` o recusa com `422 VALIDATION_FAILED`; revisão divergente é `412`.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Desativar um destino de push do aluno
StudentPushAPI.deactivateStudentPushDestination(installationId: installationId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **installationId** | **String** | Instalação endereçada, na identidade opaca gerada pelo app e registrada por &#x60;upsertStudentPushDestination&#x60;. Existência fora do escopo da conta nunca é revelada pela desativação — desconhecido e alheio respondem o mesmo &#x60;404&#x60; —, e alheio no upsert é &#x60;403 PUSH_DESTINATION_OWNED_BY_ANOTHER_ACCOUNT&#x60;. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | A revisão **exata** da precondição da escrita: a do **controle de destinos** — &#x60;revision&#x60; e &#x60;ETag&#x60; de &#x60;getStudentPushDestinations&#x60; — no primeiro registro de uma instalação que a conta não conhece, e a do **destino** (&#x60;StudentPushDestinationView.revision&#x60;) em update e desativação. O curinga &#x60;*&#x60; não é elegível: é o valor que quem nunca leu o controle também conseguiria enviar, e derrubaria exatamente a precondição. O &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;; revisão divergente é &#x60;412&#x60;. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentPushDestinationView**](StudentPushDestinationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentPushDestinations**
```swift
    open class func getStudentPushDestinations(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentPushDestinationsView?, _ error: Error?) -> Void)
```

Ler os destinos de push do aluno e a revisão do controle

Leitura mínima da **própria conta**, publicada para viabilizar a exceção de push de esclarecimento da anamnese (`DOC-ANAMNESIS-BY-RELATIONSHIP` §5.3 e §5.4): a `revision` opaca do **controle de destinos** — o mesmo valor do `ETag` — e os destinos que a conta já registrou, `ACTIVE` e `INACTIVE`. É a leitura que produz a precondição de escrita: o `If-Match` do **primeiro registro** de uma instalação desconhecida da conta ecoa esta `revision`, e o de update e desativação ecoa a `revision` do destino endereçado. Sem ela não há precondição válida: `If-Match: *` é recusado com `422`. A operação não oferece `If-None-Match` nem `304` — o `ETag` é precondição de escrita, nunca validador de cache. O `token` de entrega é **write-only** e nunca aparece — nem nesta leitura, nem em nenhuma resposta de erro ou observabilidade. Nenhum nome, e-mail, `studentId`, identificador de vínculo ou metadado de saúde atravessa esta operação, e destinos de outra conta são invisíveis: a lista é sempre e somente a da conta do token. Nenhum vínculo é exigido: o destino pertence à conta, e a desativação tem de sobreviver à perda do vínculo. Consentimento (`getStudentNotificationConsent` — somente `GRANTED` é vigente) e vínculo são avaliados pelo servidor no ato do envio, nunca por esta leitura.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler os destinos de push do aluno e a revisão do controle
StudentPushAPI.getStudentPushDestinations(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentPushDestinationsView**](StudentPushDestinationsView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upsertStudentPushDestination**
```swift
    open class func upsertStudentPushDestination(installationId: String, idempotencyKey: String, ifMatch: String, upsertStudentPushDestinationRequest: UpsertStudentPushDestinationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentPushDestinationView?, _ error: Error?) -> Void)
```

Registrar ou atualizar um destino de push do aluno

Upsert da **instalação** na própria conta (`DOC-ANAMNESIS-BY-RELATIONSHIP` §5.3 e §5.4): `201` quando a conta não conhece `installationId`, `200` quando substitui o destino que já era dela — inclusive reativando um `INACTIVE` com token novo. Um único destino por `installationId`: repetir o upsert da mesma instalação substitui atomicamente o token ativo anterior e **nunca** cria destino duplicado; instalações distintas — aparelhos legítimos diferentes — são destinos distintos que não se confundem. `installationId` é identidade opaca **gerada pelo app**, nunca identificador físico do aparelho, e o dono deriva da sessão, nunca do corpo. `installationId` já registrado por **outra conta** é `403 PUSH_DESTINATION_OWNED_BY_ANOTHER_ACCOUNT`: logout ou troca de conta nunca reatribui destino alheio — sob a conta nova o app gera identidade de instalação nova e registra de novo, e a desativação autorizada é sempre da conta dona. `token` é credencial de entrega **write-only**: aceito na escrita, nunca devolvido em view, erro, `fieldErrors` ou observabilidade. `provider` é fechado (`FCM`, `APNS`); `apnsEnvironment` é obrigatório com `APNS` e proibido com `FCM`. `permissionState` só admite `GRANTED`: o app registra somente enquanto a permissão do SO está concedida e, ao perdê-la, **desativa** o destino em vez de escrever uma recusa — o relatado não é prova permanente e é reconciliado quando a permissão muda. Token novo ou ambiente novo é **nova intenção** e exige `Idempotency-Key` nova. Registrar destino não concede consentimento nem habilita aviso local (`ADR-0016`); o único envio possível é o payload genérico da tag `Student Push`, decidido no servidor. **Precondição:** primeiro registro de instalação desconhecida exige `If-Match` igual à `revision` do controle devolvida por `getStudentPushDestinations`; instalação que a conta já conhece exige `If-Match` igual à `revision` do destino. Revisão divergente é `412`, sem gravar nem mesclar; o curinga `*` é `422`. **Repetição:** a mesma `Idempotency-Key` com a mesma intenção devolve o resultado guardado, sem fato novo, depois de reautorizar a conta; a mesma chave com corpo, alvo ou precondição distintos é `409 IDEMPOTENCY_CONFLICT`, nunca segunda escrita. Sem rede não há registro confirmado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let installationId = "installationId_example" // String | Instalação endereçada, na identidade opaca gerada pelo app e registrada por `upsertStudentPushDestination`. Existência fora do escopo da conta nunca é revelada pela desativação — desconhecido e alheio respondem o mesmo `404` —, e alheio no upsert é `403 PUSH_DESTINATION_OWNED_BY_ANOTHER_ACCOUNT`.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | A revisão **exata** da precondição da escrita: a do **controle de destinos** — `revision` e `ETag` de `getStudentPushDestinations` — no primeiro registro de uma instalação que a conta não conhece, e a do **destino** (`StudentPushDestinationView.revision`) em update e desativação. O curinga `*` não é elegível: é o valor que quem nunca leu o controle também conseguiria enviar, e derrubaria exatamente a precondição. O `pattern` o recusa com `422 VALIDATION_FAILED`; revisão divergente é `412`.
let upsertStudentPushDestinationRequest = UpsertStudentPushDestinationRequest(provider: StudentPushDestinationProvider(), token: "token_example", apnsEnvironment: StudentPushDestinationApnsEnvironment(), permissionState: StudentPushDestinationPermissionState()) // UpsertStudentPushDestinationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Registrar ou atualizar um destino de push do aluno
StudentPushAPI.upsertStudentPushDestination(installationId: installationId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, upsertStudentPushDestinationRequest: upsertStudentPushDestinationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **installationId** | **String** | Instalação endereçada, na identidade opaca gerada pelo app e registrada por &#x60;upsertStudentPushDestination&#x60;. Existência fora do escopo da conta nunca é revelada pela desativação — desconhecido e alheio respondem o mesmo &#x60;404&#x60; —, e alheio no upsert é &#x60;403 PUSH_DESTINATION_OWNED_BY_ANOTHER_ACCOUNT&#x60;. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | A revisão **exata** da precondição da escrita: a do **controle de destinos** — &#x60;revision&#x60; e &#x60;ETag&#x60; de &#x60;getStudentPushDestinations&#x60; — no primeiro registro de uma instalação que a conta não conhece, e a do **destino** (&#x60;StudentPushDestinationView.revision&#x60;) em update e desativação. O curinga &#x60;*&#x60; não é elegível: é o valor que quem nunca leu o controle também conseguiria enviar, e derrubaria exatamente a precondição. O &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;; revisão divergente é &#x60;412&#x60;. |
 **upsertStudentPushDestinationRequest** | [**UpsertStudentPushDestinationRequest**](UpsertStudentPushDestinationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentPushDestinationView**](StudentPushDestinationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
