# RelationshipLifecycleAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**endPersonalStudentRelationship**](RelationshipLifecycleAPI.md#endpersonalstudentrelationship) | **POST** /personal/relationships/{relationshipId}/end | Encerrar o vínculo com o aluno
[**endStudentRelationship**](RelationshipLifecycleAPI.md#endstudentrelationship) | **POST** /student/relationships/{relationshipId}/end | Encerrar o vínculo com o personal
[**getPersonalStudentRelationship**](RelationshipLifecycleAPI.md#getpersonalstudentrelationship) | **GET** /personal/relationships/{relationshipId} | Ler o estado do vínculo com o aluno
[**getStudentRelationship**](RelationshipLifecycleAPI.md#getstudentrelationship) | **GET** /student/relationship | Ler o estado do vínculo atual do aluno
[**pausePersonalStudentRelationship**](RelationshipLifecycleAPI.md#pausepersonalstudentrelationship) | **POST** /personal/relationships/{relationshipId}/pause | Pausar o vínculo com o aluno
[**pauseStudentRelationship**](RelationshipLifecycleAPI.md#pausestudentrelationship) | **POST** /student/relationships/{relationshipId}/pause | Pausar o vínculo com o personal
[**resumePersonalStudentRelationship**](RelationshipLifecycleAPI.md#resumepersonalstudentrelationship) | **POST** /personal/relationships/{relationshipId}/resumption | Retomar o vínculo com o aluno
[**resumeStudentRelationship**](RelationshipLifecycleAPI.md#resumestudentrelationship) | **POST** /student/relationships/{relationshipId}/resumption | Retomar o vínculo com o personal


# **endPersonalStudentRelationship**
```swift
    open class func endPersonalStudentRelationship(relationshipId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentRelationshipView?, _ error: Error?) -> Void)
```

Encerrar o vínculo com o aluno

**Encerrar vínculo**, pelo personal (`DOC-RELATIONSHIP-LIFECYCLE` §4 e §6.1). De `ACTIVE` ou de `PAUSED` — **inclusive quando foi o aluno quem pausou** —, para `ENDED`. **É definitivo:** não existe transição a partir de `ENDED`, nenhuma operação desfaz o encerramento e reconectar exige um novo convite. O histórico do período é preservado. Encerrar um vínculo ativo termina a ativação do plano e encerra a sessão aberta, como a pausa; encerrar um já pausado não tem o que terminar. Regras comuns dos comandos — repetição, `If-Match`, ordem das recusas e corrida — na tag `Relationship Lifecycle`. **Pedido:** `POST /api/v1/personal/relationships/{relationshipId}/end` com `Idempotency-Key` e `If-Match` e **sem corpo**.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | O `ETag` **exato** da última leitura ou resposta de comando deste vínculo (`getPersonalStudentRelationship` ou `getStudentRelationship`), enviado verbatim; é o mesmo valor de `revision`. Não é derivado de `revision` pelo cliente nem de outra leitura. O **curinga `*` não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou `*`: `428 PRECONDITION_REQUIRED`. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: `412 PRECONDITION_FAILED`, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Encerrar o vínculo com o aluno
RelationshipLifecycleAPI.endPersonalStudentRelationship(relationshipId: relationshipId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | O &#x60;ETag&#x60; **exato** da última leitura ou resposta de comando deste vínculo (&#x60;getPersonalStudentRelationship&#x60; ou &#x60;getStudentRelationship&#x60;), enviado verbatim; é o mesmo valor de &#x60;revision&#x60;. Não é derivado de &#x60;revision&#x60; pelo cliente nem de outra leitura. O **curinga &#x60;*&#x60; não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou &#x60;*&#x60;: &#x60;428 PRECONDITION_REQUIRED&#x60;. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: &#x60;412 PRECONDITION_FAILED&#x60;, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentRelationshipView**](PersonalStudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **endStudentRelationship**
```swift
    open class func endStudentRelationship(relationshipId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentRelationshipView?, _ error: Error?) -> Void)
```

Encerrar o vínculo com o personal

**Encerrar vínculo**, pelo aluno (`DOC-RELATIONSHIP-LIFECYCLE` §4 e §7.2). De `ACTIVE` ou de `PAUSED` — **inclusive quando foi o personal quem pausou** —, para `ENDED`. **É definitivo:** não existe transição a partir de `ENDED`, e voltar a treinar com qualquer personal, inclusive o mesmo, exige um novo convite. O que o aluno registrou continua guardado. Depois do `200` a `AL19` fecha e a próxima `getStudentRelationship` responde `403 RELATIONSHIP_INACTIVE`; a resposta deste comando é a única leitura em que o aluno vê `ENDED`, e ela não traz o nome do personal. Regras comuns dos comandos — repetição, `If-Match`, ordem das recusas e corrida — na tag `Relationship Lifecycle`. **Pedido:** `POST /api/v1/student/relationships/{relationshipId}/end` com `Idempotency-Key` e `If-Match` e **sem corpo**.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | O `ETag` **exato** da última leitura ou resposta de comando deste vínculo (`getPersonalStudentRelationship` ou `getStudentRelationship`), enviado verbatim; é o mesmo valor de `revision`. Não é derivado de `revision` pelo cliente nem de outra leitura. O **curinga `*` não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou `*`: `428 PRECONDITION_REQUIRED`. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: `412 PRECONDITION_FAILED`, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Encerrar o vínculo com o personal
RelationshipLifecycleAPI.endStudentRelationship(relationshipId: relationshipId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | O &#x60;ETag&#x60; **exato** da última leitura ou resposta de comando deste vínculo (&#x60;getPersonalStudentRelationship&#x60; ou &#x60;getStudentRelationship&#x60;), enviado verbatim; é o mesmo valor de &#x60;revision&#x60;. Não é derivado de &#x60;revision&#x60; pelo cliente nem de outra leitura. O **curinga &#x60;*&#x60; não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou &#x60;*&#x60;: &#x60;428 PRECONDITION_REQUIRED&#x60;. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: &#x60;412 PRECONDITION_FAILED&#x60;, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentRelationshipView**](StudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentRelationship**
```swift
    open class func getPersonalStudentRelationship(relationshipId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentRelationshipView?, _ error: Error?) -> Void)
```

Ler o estado do vínculo com o aluno

Leitura própria da tela `Vínculo com o aluno` (`PERSONAL_STUDENT_RELATIONSHIP`, `DOC-RELATIONSHIP-LIFECYCLE` §6.1): o estado de **um** vínculo do personal autenticado, endereçado por `relationshipId` — o mesmo da carteira (`listPersonalStudents`). O app relê a cada entrada na tela; não há estado guardado que substitua esta leitura. **Em qualquer estado, inclusive `PAUSED` e `ENDED`**, porque a resposta não carrega dado nenhum do aluno além do nome que a carteira já publica: só o estado do vínculo. `studentName` e `studentLabel` seguem exatamente a regra da carteira — `studentName` presente e nunca nulo em `ACTIVE` e `PAUSED`, sempre `null` em `ENDED`; o nome do aluno não entra em nenhuma frase da tela. `pausedBy` diz **de que lado** veio a pausa e `canResume` diz se **este** personal pode retomar; o `ETag` da resposta, igual a `revision`, é o que o `If-Match` dos três comandos ecoa. **Negação uniforme:** vínculo inexistente, de outro personal ou em que esta conta é o aluno responde o mesmo `404 RELATIONSHIP_NOT_FOUND`, que nunca confirma existência; conta sem o espaço de personal é `403 FORBIDDEN`. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o estado do vínculo com o aluno
RelationshipLifecycleAPI.getPersonalStudentRelationship(relationshipId: relationshipId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentRelationshipView**](PersonalStudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentRelationship**
```swift
    open class func getStudentRelationship(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentRelationshipView?, _ error: Error?) -> Void)
```

Ler o estado do vínculo atual do aluno

Leitura própria da `AL19` `Vínculo com seu personal` (`STUDENT_RELATIONSHIP`) e da linha `Vínculo` do Perfil (`AL18`), `DOC-RELATIONSHIP-LIFECYCLE` §7.1 e §7.2: o estado do vínculo **atual** do aluno autenticado — `ACTIVE` ou `PAUSED` —, relido a cada entrada na tela. Não é a leitura de Hoje: `getStudentToday` e `getStudentTodayRelationship` não mudam — a reserva FIT-0073 intacta e a região do personal sem autoria — e quem pausou é dito pelo `pausedBy` do cartão do treino (`getStudentTodayWorkout`, só em `TRAINING_PAUSED`, `P4`). Devolve `relationshipId`, o estado, `pausedBy` (só em `PAUSED`), `canResume`, o nome de exibição do personal e o validador da versão (`ETag`, igual a `revision`) que o `If-Match` dos três comandos do aluno ecoa. **Sem vínculo atual** — encerrado ou inexistente — é `403 RELATIONSHIP_INACTIVE`, como as demais leituras do aluno, sem confirmar personal nem vínculo: o app mostra `Sem vínculo` (Hoje, `DOC-STUDENT-HOME` §7.11), e a linha `Vínculo` do Perfil não existe. Conta sem o espaço de aluno é `403 FORBIDDEN`. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o estado do vínculo atual do aluno
RelationshipLifecycleAPI.getStudentRelationship(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentRelationshipView**](StudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pausePersonalStudentRelationship**
```swift
    open class func pausePersonalStudentRelationship(relationshipId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentRelationshipView?, _ error: Error?) -> Void)
```

Pausar o vínculo com o aluno

**Pausar vínculo**, pelo personal (`DOC-RELATIONSHIP-LIFECYCLE` §4 e §6.1). Só de `ACTIVE`; o vínculo vai a `PAUSED` com `pausedBy: PERSONAL`, e **só o personal** poderá retomá-lo. Na mesma transação a ativação do plano termina, as atribuições futuras sem sessão são retiradas e a sessão aberta do aluno é encerrada (concluída, se há série registrada; descartada, se não há). O aluno sai da aba Alunos e da fila; a Orientação, relida, responde `403 RELATIONSHIP_PAUSED`. O aluno não é avisado (`P1`). Regras comuns dos comandos — repetição, `If-Match`, ordem das recusas e corrida — na tag `Relationship Lifecycle`. **Pedido:** `POST /api/v1/personal/relationships/{relationshipId}/pause` com `Idempotency-Key` e `If-Match` (o `ETag` da última leitura) e **sem corpo**.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | O `ETag` **exato** da última leitura ou resposta de comando deste vínculo (`getPersonalStudentRelationship` ou `getStudentRelationship`), enviado verbatim; é o mesmo valor de `revision`. Não é derivado de `revision` pelo cliente nem de outra leitura. O **curinga `*` não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou `*`: `428 PRECONDITION_REQUIRED`. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: `412 PRECONDITION_FAILED`, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Pausar o vínculo com o aluno
RelationshipLifecycleAPI.pausePersonalStudentRelationship(relationshipId: relationshipId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | O &#x60;ETag&#x60; **exato** da última leitura ou resposta de comando deste vínculo (&#x60;getPersonalStudentRelationship&#x60; ou &#x60;getStudentRelationship&#x60;), enviado verbatim; é o mesmo valor de &#x60;revision&#x60;. Não é derivado de &#x60;revision&#x60; pelo cliente nem de outra leitura. O **curinga &#x60;*&#x60; não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou &#x60;*&#x60;: &#x60;428 PRECONDITION_REQUIRED&#x60;. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: &#x60;412 PRECONDITION_FAILED&#x60;, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentRelationshipView**](PersonalStudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pauseStudentRelationship**
```swift
    open class func pauseStudentRelationship(relationshipId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentRelationshipView?, _ error: Error?) -> Void)
```

Pausar o vínculo com o personal

**Pausar vínculo**, pelo aluno (`DOC-RELATIONSHIP-LIFECYCLE` §4 e §7.2). Só de `ACTIVE`; o vínculo vai a `PAUSED` com `pausedBy: STUDENT`, e **só o aluno** poderá retomá-lo. Na mesma transação a ativação do plano termina, as atribuições futuras sem sessão são retiradas e a sessão aberta é encerrada (concluída, se há série registrada; descartada, se não há). O personal deixa de ver os dados do aluno e não é avisado (`P1`). `relationshipId` é o da última `getStudentRelationship`. Regras comuns dos comandos — repetição, `If-Match`, ordem das recusas e corrida — na tag `Relationship Lifecycle`. **Pedido:** `POST /api/v1/student/relationships/{relationshipId}/pause` com `Idempotency-Key` e `If-Match` (o `ETag` da última leitura) e **sem corpo**.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | O `ETag` **exato** da última leitura ou resposta de comando deste vínculo (`getPersonalStudentRelationship` ou `getStudentRelationship`), enviado verbatim; é o mesmo valor de `revision`. Não é derivado de `revision` pelo cliente nem de outra leitura. O **curinga `*` não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou `*`: `428 PRECONDITION_REQUIRED`. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: `412 PRECONDITION_FAILED`, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Pausar o vínculo com o personal
RelationshipLifecycleAPI.pauseStudentRelationship(relationshipId: relationshipId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | O &#x60;ETag&#x60; **exato** da última leitura ou resposta de comando deste vínculo (&#x60;getPersonalStudentRelationship&#x60; ou &#x60;getStudentRelationship&#x60;), enviado verbatim; é o mesmo valor de &#x60;revision&#x60;. Não é derivado de &#x60;revision&#x60; pelo cliente nem de outra leitura. O **curinga &#x60;*&#x60; não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou &#x60;*&#x60;: &#x60;428 PRECONDITION_REQUIRED&#x60;. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: &#x60;412 PRECONDITION_FAILED&#x60;, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentRelationshipView**](StudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resumePersonalStudentRelationship**
```swift
    open class func resumePersonalStudentRelationship(relationshipId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentRelationshipView?, _ error: Error?) -> Void)
```

Retomar o vínculo com o aluno

**Retomar vínculo**, pelo personal (`DOC-RELATIONSHIP-LIFECYCLE` §4 e §6.1). Só de `PAUSED` e **só quando o personal pausou** (`pausedBy: PERSONAL`, `canResume: true` na leitura): o vínculo volta a `ACTIVE` e `pausedBy` some. Pausa feita pelo aluno é `403 RELATIONSHIP_RESUME_NOT_ALLOWED` — só quem pausou retoma (`D2`). **Retomar não restaura o plano**: a ativação que terminou na pausa não volta, e o personal ativa um plano de novo; a anamnese do vínculo é a mesma, sem ficha nova. Regras comuns dos comandos — repetição, `If-Match`, ordem das recusas e corrida — na tag `Relationship Lifecycle`. **Pedido:** `POST /api/v1/personal/relationships/{relationshipId}/resumption` com `Idempotency-Key` e `If-Match` e **sem corpo**.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | O `ETag` **exato** da última leitura ou resposta de comando deste vínculo (`getPersonalStudentRelationship` ou `getStudentRelationship`), enviado verbatim; é o mesmo valor de `revision`. Não é derivado de `revision` pelo cliente nem de outra leitura. O **curinga `*` não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou `*`: `428 PRECONDITION_REQUIRED`. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: `412 PRECONDITION_FAILED`, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Retomar o vínculo com o aluno
RelationshipLifecycleAPI.resumePersonalStudentRelationship(relationshipId: relationshipId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | O &#x60;ETag&#x60; **exato** da última leitura ou resposta de comando deste vínculo (&#x60;getPersonalStudentRelationship&#x60; ou &#x60;getStudentRelationship&#x60;), enviado verbatim; é o mesmo valor de &#x60;revision&#x60;. Não é derivado de &#x60;revision&#x60; pelo cliente nem de outra leitura. O **curinga &#x60;*&#x60; não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou &#x60;*&#x60;: &#x60;428 PRECONDITION_REQUIRED&#x60;. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: &#x60;412 PRECONDITION_FAILED&#x60;, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentRelationshipView**](PersonalStudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resumeStudentRelationship**
```swift
    open class func resumeStudentRelationship(relationshipId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentRelationshipView?, _ error: Error?) -> Void)
```

Retomar o vínculo com o personal

**Retomar vínculo**, pelo aluno (`DOC-RELATIONSHIP-LIFECYCLE` §4 e §7.2). Só de `PAUSED` e **só quando o aluno pausou** (`pausedBy: STUDENT`, `canResume: true` na leitura): o vínculo volta a `ACTIVE` e `pausedBy` some. Pausa feita pelo personal é `403 RELATIONSHIP_RESUME_NOT_ALLOWED` — só quem pausou retoma (`D2`). **Retomar não restaura o plano**: o aluno volta a treinar quando o personal ativar um plano, e a Hoje mostra `Sem plano` até lá. A anamnese do vínculo é a mesma, sem ficha nova. Regras comuns dos comandos — repetição, `If-Match`, ordem das recusas e corrida — na tag `Relationship Lifecycle`. **Pedido:** `POST /api/v1/student/relationships/{relationshipId}/resumption` com `Idempotency-Key` e `If-Match` e **sem corpo**.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | O `ETag` **exato** da última leitura ou resposta de comando deste vínculo (`getPersonalStudentRelationship` ou `getStudentRelationship`), enviado verbatim; é o mesmo valor de `revision`. Não é derivado de `revision` pelo cliente nem de outra leitura. O **curinga `*` não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou `*`: `428 PRECONDITION_REQUIRED`. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: `412 PRECONDITION_FAILED`, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Retomar o vínculo com o personal
RelationshipLifecycleAPI.resumeStudentRelationship(relationshipId: relationshipId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | O &#x60;ETag&#x60; **exato** da última leitura ou resposta de comando deste vínculo (&#x60;getPersonalStudentRelationship&#x60; ou &#x60;getStudentRelationship&#x60;), enviado verbatim; é o mesmo valor de &#x60;revision&#x60;. Não é derivado de &#x60;revision&#x60; pelo cliente nem de outra leitura. O **curinga &#x60;*&#x60; não é elegível**, porque quem nunca leu o vínculo conseguiria enviá-lo. Ausente, vazio ou &#x60;*&#x60;: &#x60;428 PRECONDITION_REQUIRED&#x60;. Diferente da versão atual — o outro lado agiu, ou este lado agiu em outro aparelho —: &#x60;412 PRECONDITION_FAILED&#x60;, sem gravar nada; o app relê e a pessoa decide de novo, nunca repete sozinho. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentRelationshipView**](StudentRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
