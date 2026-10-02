# WorkoutExecutionAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**abandonStudentWorkoutSession**](WorkoutExecutionAPI.md#abandonstudentworkoutsession) | **POST** /student/workout-sessions/{sessionId}/abandonment | Abandonar a sessão preservando tudo o que já foi executado
[**amendStudentSetExecution**](WorkoutExecutionAPI.md#amendstudentsetexecution) | **POST** /student/workout-sessions/{sessionId}/set-executions/{setExecutionId}/amendments | Emendar os valores executados de uma série, preservando o valor anterior
[**completeStudentWorkoutSession**](WorkoutExecutionAPI.md#completestudentworkoutsession) | **POST** /student/workout-sessions/{sessionId}/completion | Encerrar a sessão declarando todas as pendências de orquestração
[**confirmStudentExerciseSkip**](WorkoutExecutionAPI.md#confirmstudentexerciseskip) | **POST** /student/workout-sessions/{sessionId}/skips | Confirmar explicitamente que um exercício não será realizado
[**deferStudentExerciseExecution**](WorkoutExecutionAPI.md#deferstudentexerciseexecution) | **POST** /student/workout-sessions/{sessionId}/deferrals | Adiar um exercício, preservando-o como pendência aberta
[**getStudentSetExecution**](WorkoutExecutionAPI.md#getstudentsetexecution) | **GET** /student/workout-sessions/{sessionId}/set-executions/{setExecutionId} | Ler a série executada e a revisão que as escritas revisionais exigem
[**recordStudentRestPeriod**](WorkoutExecutionAPI.md#recordstudentrestperiod) | **POST** /student/workout-sessions/{sessionId}/rest-periods | Registrar o descanso realmente medido entre séries
[**recordStudentSetExecution**](WorkoutExecutionAPI.md#recordstudentsetexecution) | **POST** /student/workout-sessions/{sessionId}/set-executions | Registrar a série executada
[**registerStudentSubstitution**](WorkoutExecutionAPI.md#registerstudentsubstitution) | **POST** /student/workout-sessions/{sessionId}/substitutions | Registrar a substituição autorizada de variante, equipamento ou exercício
[**reorderStudentExerciseExecution**](WorkoutExecutionAPI.md#reorderstudentexerciseexecution) | **POST** /student/workout-sessions/{sessionId}/reorders | Reordenar a fila executada da sessão dentro da política do personal
[**reportStudentDiscomfort**](WorkoutExecutionAPI.md#reportstudentdiscomfort) | **POST** /student/workout-sessions/{sessionId}/discomfort-reports | Relatar desconforto durante a execução
[**resumeStudentDeferredExercise**](WorkoutExecutionAPI.md#resumestudentdeferredexercise) | **POST** /student/workout-sessions/{sessionId}/deferrals/{deferralId}/resumption | Retomar um exercício adiado, sem apagar o fato do adiamento
[**startStudentExerciseExecution**](WorkoutExecutionAPI.md#startstudentexerciseexecution) | **POST** /student/workout-sessions/{sessionId}/exercise-executions | Iniciar a execução de um exercício da sessão
[**updateStudentSetExecutionObservation**](WorkoutExecutionAPI.md#updatestudentsetexecutionobservation) | **PUT** /student/workout-sessions/{sessionId}/set-executions/{setExecutionId}/observation | Atualizar a observação editável de uma série já registrada


# **abandonStudentWorkoutSession**
```swift
    open class func abandonStudentWorkoutSession(sessionId: String, idempotencyKey: String, executionSessionAbandonPayload: ExecutionSessionAbandonPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionSyncView?, _ error: Error?) -> Void)
```

Abandonar a sessão preservando tudo o que já foi executado

Caminho HTTP autoritativo do fato `execution.session.abandon`. O `sessionId` do corpo precisa ser igual ao do path: divergir é `422 EXECUTION_IDENTITY_MISMATCH`. **Abandonar não é concluir e não apaga nada**: séries, descansos, substituições, relatos e adiamentos já registrados permanecem íntegros e legíveis. Diferente do encerramento, o abandono **não** exige declarar as pendências: elas permanecem como estavam, sem serem convertidas em pulo por inferência.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionSessionAbandonPayload = ExecutionSessionAbandonPayload(sessionId: "sessionId_example", abandonedAt: Date(), reason: "reason_example") // ExecutionSessionAbandonPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abandonar a sessão preservando tudo o que já foi executado
WorkoutExecutionAPI.abandonStudentWorkoutSession(sessionId: sessionId, idempotencyKey: idempotencyKey, executionSessionAbandonPayload: executionSessionAbandonPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionSessionAbandonPayload** | [**ExecutionSessionAbandonPayload**](ExecutionSessionAbandonPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSessionSyncView**](WorkoutSessionSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **amendStudentSetExecution**
```swift
    open class func amendStudentSetExecution(sessionId: String, setExecutionId: String, idempotencyKey: String, ifMatch: String, executionSetAmendPayload: ExecutionSetAmendPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentSetAmendmentResponse?, _ error: Error?) -> Void)
```

Emendar os valores executados de uma série, preservando o valor anterior

Caminho HTTP autoritativo do fato `execution.set.amend`. Emendar **cria um fato novo** e preserva o anterior: `previous` e `replacement` coexistem na emenda e nenhuma série é reescrita em silêncio. `amendmentId` é criado no device e adotado pelo servidor. A escrita é compare-and-set sobre a **série**, não sobre a emenda: `If-Match` ecoa a mesma e única revisão de `SET_EXECUTION` que a leitura publica, e a resposta devolve a revisão nova da série junto com a emenda registrada. O `setExecutionId` do corpo precisa ser igual ao do path: divergir é `422 EXECUTION_IDENTITY_MISMATCH`. **Série por tempo.** `replacement.durationSeconds` só é aceito numa série por tempo, com `reps` nulas, e corrige a duração **realizada em vigor**: o valor anterior fica em `previous`, a `measuredDurationSeconds` da série **nunca muda**, e a série passa a publicar `adjustedDurationSeconds` com o valor novo — ou nenhum, se o valor novo é igual ao medido. `replacement` sem `durationSeconds` numa série por tempo é `DURATION_REQUIRED`, e com ele numa série que não é por tempo é `DURATION_NOT_APPLICABLE`, ambos `422 VALIDATION_FAILED` com o caminho em `fieldErrors`, sem gravar nada. O alvo (`target`) nunca é emendado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let setExecutionId = "setExecutionId_example" // String | Série executada dentro da sessão endereçada. É o único agregado revisional da execução: a `revision` que a leitura desta série publica é exatamente a que `If-Match` exige nas escritas revisionais.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let executionSetAmendPayload = ExecutionSetAmendPayload(amendmentId: "amendmentId_example", setExecutionId: "setExecutionId_example", replacement: WorkoutSetValues(loadValue: 123, loadUnit: "loadUnit_example", reps: 123, durationSeconds: 123, rpe: 123), reason: "reason_example", amendedAt: Date()) // ExecutionSetAmendPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Emendar os valores executados de uma série, preservando o valor anterior
WorkoutExecutionAPI.amendStudentSetExecution(sessionId: sessionId, setExecutionId: setExecutionId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, executionSetAmendPayload: executionSetAmendPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **setExecutionId** | **String** | Série executada dentro da sessão endereçada. É o único agregado revisional da execução: a &#x60;revision&#x60; que a leitura desta série publica é exatamente a que &#x60;If-Match&#x60; exige nas escritas revisionais. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **executionSetAmendPayload** | [**ExecutionSetAmendPayload**](ExecutionSetAmendPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentSetAmendmentResponse**](StudentSetAmendmentResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **completeStudentWorkoutSession**
```swift
    open class func completeStudentWorkoutSession(sessionId: String, idempotencyKey: String, executionSessionCompletePayload: ExecutionSessionCompletePayload, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionSyncView?, _ error: Error?) -> Void)
```

Encerrar a sessão declarando todas as pendências de orquestração

Caminho HTTP autoritativo do fato `execution.session.complete`. O corpo é exatamente `ExecutionSessionCompletePayload` e o `sessionId` do corpo precisa ser igual ao do path: divergir é `422 EXECUTION_IDENTITY_MISMATCH`. **Pendência de orquestração não é encerrada em silêncio.** Todo adiamento ainda aberto é declarado em `pendingDeferralResolutions` com a decisão que o aluno tomou; omitir um adiamento aberto é `409 SESSION_HAS_PENDING_DEFERRALS` e o fato do adiamento permanece recuperável. Lista vazia significa que não havia pendência, nunca que ela foi ignorada. O servidor nunca infere a resolução a partir do relógio. **A confirmação é o commit no backend.** Sem `200` a sessão não está encerrada: não existe conclusão local que valha, e uma falha de rede é dita como falha de rede.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionSessionCompletePayload = ExecutionSessionCompletePayload(sessionId: "sessionId_example", completedAt: Date(), pendingDeferralResolutions: [DeferralResolutionAtCompletion(deferralId: "deferralId_example", resolution: "resolution_example", skipId: "skipId_example")]) // ExecutionSessionCompletePayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Encerrar a sessão declarando todas as pendências de orquestração
WorkoutExecutionAPI.completeStudentWorkoutSession(sessionId: sessionId, idempotencyKey: idempotencyKey, executionSessionCompletePayload: executionSessionCompletePayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionSessionCompletePayload** | [**ExecutionSessionCompletePayload**](ExecutionSessionCompletePayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSessionSyncView**](WorkoutSessionSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **confirmStudentExerciseSkip**
```swift
    open class func confirmStudentExerciseSkip(sessionId: String, idempotencyKey: String, executionExerciseSkipConfirmPayload: ExecutionExerciseSkipConfirmPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentExerciseSkipResponse?, _ error: Error?) -> Void)
```

Confirmar explicitamente que um exercício não será realizado

Caminho HTTP autoritativo do fato `execution.exercise.skipConfirm`. `skipId` é criado no device e adotado pelo servidor. **Pular exige confirmação explícita** e é um fato diferente de adiar e de substituir. Quando o pulo encerra um adiamento aberto, `deferralId` liga os dois e a resposta devolve o adiamento já terminal, para que o encerramento da sessão possa declarar a pendência resolvida sem perder o fato.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionExerciseSkipConfirmPayload = ExecutionExerciseSkipConfirmPayload(skipId: "skipId_example", exerciseExecutionId: "exerciseExecutionId_example", deferralId: "deferralId_example", prescribedPosition: 123, executedPosition: 123, reason: "reason_example", skippedAt: Date()) // ExecutionExerciseSkipConfirmPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Confirmar explicitamente que um exercício não será realizado
WorkoutExecutionAPI.confirmStudentExerciseSkip(sessionId: sessionId, idempotencyKey: idempotencyKey, executionExerciseSkipConfirmPayload: executionExerciseSkipConfirmPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionExerciseSkipConfirmPayload** | [**ExecutionExerciseSkipConfirmPayload**](ExecutionExerciseSkipConfirmPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentExerciseSkipResponse**](StudentExerciseSkipResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deferStudentExerciseExecution**
```swift
    open class func deferStudentExerciseExecution(sessionId: String, idempotencyKey: String, executionExerciseDeferPayload: ExecutionExerciseDeferPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: DeferralSyncView?, _ error: Error?) -> Void)
```

Adiar um exercício, preservando-o como pendência aberta

Caminho HTTP autoritativo do fato `execution.exercise.defer`. `deferralId` é criado no device e adotado pelo servidor. **Adiar não é pular.** O exercício permanece como pendência aberta, visível e recuperável, e o encerramento da sessão recusa qualquer pendência não declarada. `EQUIPMENT_BUSY` (aparelho em uso, que volta a ficar livre) e `EQUIPMENT_UNAVAILABLE` (aparelho quebrado ou ausente, que não volta) são motivos distintos e não se substituem. Posição prescrita e posição executada coexistem: juntas formam a fila dinâmica e nenhuma sobrescreve a outra.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionExerciseDeferPayload = ExecutionExerciseDeferPayload(deferralId: "deferralId_example", exerciseExecutionId: "exerciseExecutionId_example", prescribedPosition: 123, executedPosition: 123, reason: "reason_example", deferredAt: Date()) // ExecutionExerciseDeferPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Adiar um exercício, preservando-o como pendência aberta
WorkoutExecutionAPI.deferStudentExerciseExecution(sessionId: sessionId, idempotencyKey: idempotencyKey, executionExerciseDeferPayload: executionExerciseDeferPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionExerciseDeferPayload** | [**ExecutionExerciseDeferPayload**](ExecutionExerciseDeferPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**DeferralSyncView**](DeferralSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentSetExecution**
```swift
    open class func getStudentSetExecution(sessionId: String, setExecutionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentSetExecutionResponse?, _ error: Error?) -> Void)
```

Ler a série executada e a revisão que as escritas revisionais exigem

Leitura autoritativa de uma série já registrada. **O `ETag` desta resposta é o validador da série**, idêntico a `revision` no corpo: é ele, e nenhum outro, que `If-Match` exige ao atualizar a observação e ao emendar. Um recurso, uma revisão, sem tradução entre leitura e escrita. Esta operação existe para que a precondição seja recuperável: com a capacidade `offline-sync` desligada, o cliente não guarda revisão em disco, e sem uma leitura autoritativa a escrita revisional ficaria irrecuperável depois de um relaunch. A operação **não** oferece `If-None-Match` nem `304`: aqui o `ETag` é precondição de escrita, não validador de cache.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let setExecutionId = "setExecutionId_example" // String | Série executada dentro da sessão endereçada. É o único agregado revisional da execução: a `revision` que a leitura desta série publica é exatamente a que `If-Match` exige nas escritas revisionais.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a série executada e a revisão que as escritas revisionais exigem
WorkoutExecutionAPI.getStudentSetExecution(sessionId: sessionId, setExecutionId: setExecutionId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **setExecutionId** | **String** | Série executada dentro da sessão endereçada. É o único agregado revisional da execução: a &#x60;revision&#x60; que a leitura desta série publica é exatamente a que &#x60;If-Match&#x60; exige nas escritas revisionais. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentSetExecutionResponse**](StudentSetExecutionResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recordStudentRestPeriod**
```swift
    open class func recordStudentRestPeriod(sessionId: String, idempotencyKey: String, executionRestRecordPayload: ExecutionRestRecordPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: RestPeriodSyncView?, _ error: Error?) -> Void)
```

Registrar o descanso realmente medido entre séries

Caminho HTTP autoritativo do fato `execution.rest.record`. `restPeriodId` é criado no device e adotado pelo servidor. Alvo, alvo ajustado, medido e pausas permanecem **quatro fatos distintos**: o servidor deriva `measuredSeconds` de início, fim e pausas, e nunca substitui o alvo pelo medido. Nenhum tick de timer atravessa esta operação: só o intervalo consolidado é registrado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionRestRecordPayload = ExecutionRestRecordPayload(restPeriodId: "restPeriodId_example", exerciseExecutionId: "exerciseExecutionId_example", afterSetExecutionId: "afterSetExecutionId_example", targetSeconds: 123, adjustedTargetSeconds: 123, startedAt: Date(), endedAt: Date(), pauses: [RestPauseInterval(pausedAt: Date(), resumedAt: Date())], observation: "observation_example") // ExecutionRestRecordPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Registrar o descanso realmente medido entre séries
WorkoutExecutionAPI.recordStudentRestPeriod(sessionId: sessionId, idempotencyKey: idempotencyKey, executionRestRecordPayload: executionRestRecordPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionRestRecordPayload** | [**ExecutionRestRecordPayload**](ExecutionRestRecordPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**RestPeriodSyncView**](RestPeriodSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recordStudentSetExecution**
```swift
    open class func recordStudentSetExecution(sessionId: String, idempotencyKey: String, executionSetRecordPayload: ExecutionSetRecordPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentSetExecutionResponse?, _ error: Error?) -> Void)
```

Registrar a série executada

Caminho HTTP autoritativo do fato `execution.set.record`. `setExecutionId` é **criado no device** e adotado pelo servidor; o corpo é exatamente `ExecutionSetRecordPayload`. `target` preserva o alvo operacional apresentado, com origem e `expectedRpe`; `actual` é o realizado e fica ausente somente em `SKIPPED`. Prescrito, alvo e realizado permanecem fatos distintos e o servidor nunca reescreve o prescrito. A resposta publica `revision`, a revisão opaca desta série — o **mesmo** valor do `ETag`, sem tradução — porque `SET_EXECUTION` é o único agregado revisional da execução: a observação e a emenda desta série exigem exatamente essa revisão em `If-Match`. Reenviar a mesma identidade com conteúdo diferente é `409 EXECUTION_IDENTITY_DIVERGENT`, nunca sobrescrita silenciosa. **Série por tempo.** `durationSeconds` só existe numa série cuja prescrição é por tempo (`PrescribedSetSyncView.target.durationSeconds`), e nela as `reps` são **nulas** no `target` e no `actual`: a série por tempo não tem repetição, e a ausência dela nunca vira zero. No `target`, `durationSeconds` é a duração alvo apresentada; no `actual`, é a duração realizada **em vigor**. A duração **medida pelo cronômetro da série** vai em `measuredDurationSeconds`, é obrigatória em série por tempo concluída ou parcial e **nunca é sobrescrita**: quando `actual.durationSeconds` difere dela o aluno a corrigiu, e a série passa a publicar `adjustedDurationSeconds` com o valor corrigido. Medido e ajustado são dois fatos, e o excedente sobre a duração alvo é fato, não erro. Série pulada não tem duração realizada nem medida. **Alvo em percentual.** `target.source: PERCENT_OF_REFERENCE` só vale numa série prescrita em percentual cujo alvo calculado da sessão (`WorkoutSessionSyncView.calculatedLoadTargets`) está `CALCULATED`, e então `target.loadValue` e `target.loadUnit` são exatamente os dele; o aluno que muda o valor registra `STUDENT_ADJUSTMENT`, e o prescrito em percentual nunca é reescrito. Cada violação é `422 VALIDATION_FAILED` com o caminho em `fieldErrors` e um destes códigos: `DURATION_NOT_APPLICABLE` (duração em série que não é por tempo), `DURATION_REQUIRED` (série por tempo sem duração alvo, ou concluída sem duração realizada), `REPS_NOT_APPLICABLE` (repetições numa série por tempo), `MEASURED_DURATION_REQUIRED`, `MEASURED_DURATION_NOT_APPLICABLE`, `PERCENT_TARGET_NOT_CALCULATED` e `PERCENT_TARGET_VALUE_MISMATCH`. Nada é gravado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionSetRecordPayload = ExecutionSetRecordPayload(setExecutionId: "setExecutionId_example", exerciseExecutionId: "exerciseExecutionId_example", prescribedSetId: "prescribedSetId_example", setIndex: 123, status: ExecutedSetStatus(), target: ExecutionTargetValues(loadValue: 123, loadUnit: "loadUnit_example", reps: 123, durationSeconds: 123, source: "source_example", expectedRpe: 123), actual: WorkoutSetValues(loadValue: 123, loadUnit: "loadUnit_example", reps: 123, durationSeconds: 123, rpe: 123), measuredDurationSeconds: 123, executedVariantId: "executedVariantId_example", equipmentInstanceId: "equipmentInstanceId_example", startedAt: Date(), completedAt: Date(), observation: "observation_example") // ExecutionSetRecordPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Registrar a série executada
WorkoutExecutionAPI.recordStudentSetExecution(sessionId: sessionId, idempotencyKey: idempotencyKey, executionSetRecordPayload: executionSetRecordPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionSetRecordPayload** | [**ExecutionSetRecordPayload**](ExecutionSetRecordPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentSetExecutionResponse**](StudentSetExecutionResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerStudentSubstitution**
```swift
    open class func registerStudentSubstitution(sessionId: String, idempotencyKey: String, executionSubstitutionRegisterPayload: ExecutionSubstitutionRegisterPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: SubstitutionSyncView?, _ error: Error?) -> Void)
```

Registrar a substituição autorizada de variante, equipamento ou exercício

Caminho HTTP autoritativo do fato `execution.substitution.register`. `substitutionId` é criado no device e adotado pelo servidor. Tipo, motivo, **fonte de autorização** e escopo são registrados separadamente e nenhum é inferido: `STUDENT_DECISION` nunca é promovido a autorização metodológica que não houve. Carga nunca é transportada automaticamente entre variantes ou equipamentos, qualquer que seja o escopo. Quando a substituição resolve um exercício adiado, `deferralId` liga os dois fatos sem colapsá-los.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionSubstitutionRegisterPayload = ExecutionSubstitutionRegisterPayload(substitutionId: "substitutionId_example", exerciseExecutionId: "exerciseExecutionId_example", prescribedExerciseId: "prescribedExerciseId_example", prescribedVariantId: "prescribedVariantId_example", executedExerciseId: "executedExerciseId_example", executedVariantId: "executedVariantId_example", equipmentInstanceId: "equipmentInstanceId_example", deferralId: "deferralId_example", type: SubstitutionType(), reason: SubstitutionReason(), authorizationSource: SubstitutionAuthorizationSource(), scope: SubstitutionScope(), registeredAt: Date()) // ExecutionSubstitutionRegisterPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Registrar a substituição autorizada de variante, equipamento ou exercício
WorkoutExecutionAPI.registerStudentSubstitution(sessionId: sessionId, idempotencyKey: idempotencyKey, executionSubstitutionRegisterPayload: executionSubstitutionRegisterPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionSubstitutionRegisterPayload** | [**ExecutionSubstitutionRegisterPayload**](ExecutionSubstitutionRegisterPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**SubstitutionSyncView**](SubstitutionSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reorderStudentExerciseExecution**
```swift
    open class func reorderStudentExerciseExecution(sessionId: String, idempotencyKey: String, executionExerciseReorderPayload: ExecutionExerciseReorderPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentExerciseOrderResponse?, _ error: Error?) -> Void)
```

Reordenar a fila executada da sessão dentro da política do personal

Caminho HTTP autoritativo do fato `execution.exercise.reorder`. `reorderId` é criado no device e adotado pelo servidor. **A `ExerciseOrderPolicy` publicada pelo personal é o teto**, e o servidor é quem a aplica: uma reordenação que a viole é `409 EXERCISE_ORDER_NOT_ALLOWED`, e a ordem no servidor permanece exatamente como estava. Reordenação sem registro não é reordenação: a ordem prescrita permanece íntegra ao lado da executada. A resposta devolve a **fila executada resultante inteira**, porque mover um exercício desloca os demais: o cliente adota a ordem do servidor em vez de recalculá-la localmente.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionExerciseReorderPayload = ExecutionExerciseReorderPayload(reorderId: "reorderId_example", exerciseExecutionId: "exerciseExecutionId_example", prescribedPosition: 123, fromExecutedPosition: 123, toExecutedPosition: 123, reorderedAt: Date()) // ExecutionExerciseReorderPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Reordenar a fila executada da sessão dentro da política do personal
WorkoutExecutionAPI.reorderStudentExerciseExecution(sessionId: sessionId, idempotencyKey: idempotencyKey, executionExerciseReorderPayload: executionExerciseReorderPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionExerciseReorderPayload** | [**ExecutionExerciseReorderPayload**](ExecutionExerciseReorderPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentExerciseOrderResponse**](StudentExerciseOrderResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportStudentDiscomfort**
```swift
    open class func reportStudentDiscomfort(sessionId: String, idempotencyKey: String, executionDiscomfortReportPayload: ExecutionDiscomfortReportPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: DiscomfortReportSyncView?, _ error: Error?) -> Void)
```

Relatar desconforto durante a execução

Caminho HTTP autoritativo do fato `execution.discomfort.report`. **Registro e notificação são decisões separadas**: o relato é sempre registrado e `notifyPersonal` é a escolha explícita do aluno, nunca inferida pelo servidor. A entrega real ao personal não é pós-condição desta operação e não é afirmada por ela. O relato é **operacional, não clínico**: não é triagem, não é laudo e o seu conteúdo nunca deve ser registrado em log.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionDiscomfortReportPayload = ExecutionDiscomfortReportPayload(discomfortReportId: "discomfortReportId_example", exerciseExecutionId: "exerciseExecutionId_example", setExecutionId: "setExecutionId_example", area: "area_example", sensation: "sensation_example", intensity: 123, description: "description_example", notifyPersonal: false, reportedAt: Date()) // ExecutionDiscomfortReportPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Relatar desconforto durante a execução
WorkoutExecutionAPI.reportStudentDiscomfort(sessionId: sessionId, idempotencyKey: idempotencyKey, executionDiscomfortReportPayload: executionDiscomfortReportPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionDiscomfortReportPayload** | [**ExecutionDiscomfortReportPayload**](ExecutionDiscomfortReportPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**DiscomfortReportSyncView**](DiscomfortReportSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resumeStudentDeferredExercise**
```swift
    open class func resumeStudentDeferredExercise(sessionId: String, deferralId: String, idempotencyKey: String, executionExerciseResumePayload: ExecutionExerciseResumePayload, acceptLanguage: String? = nil, completion: @escaping (_ data: DeferralSyncView?, _ error: Error?) -> Void)
```

Retomar um exercício adiado, sem apagar o fato do adiamento

Caminho HTTP autoritativo do fato `execution.exercise.resume`. Retomar transiciona o adiamento de `DEFERRED` para `RESUMED` e **preserva** o adiamento: o motivo, o instante e as duas posições continuam legíveis depois. Um adiamento já terminal não é retomado: a tentativa é `409 DEFERRAL_NOT_OPEN`, nunca reabertura silenciosa. O `deferralId` do corpo precisa ser igual ao do path: divergir é `422 EXECUTION_IDENTITY_MISMATCH`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let deferralId = "deferralId_example" // String | Adiamento dentro da sessão endereçada. Um adiamento já terminal não é reaberto por este endereçamento.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionExerciseResumePayload = ExecutionExerciseResumePayload(deferralId: "deferralId_example", exerciseExecutionId: "exerciseExecutionId_example", executedPosition: 123, resumedAt: Date()) // ExecutionExerciseResumePayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Retomar um exercício adiado, sem apagar o fato do adiamento
WorkoutExecutionAPI.resumeStudentDeferredExercise(sessionId: sessionId, deferralId: deferralId, idempotencyKey: idempotencyKey, executionExerciseResumePayload: executionExerciseResumePayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **deferralId** | **String** | Adiamento dentro da sessão endereçada. Um adiamento já terminal não é reaberto por este endereçamento. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionExerciseResumePayload** | [**ExecutionExerciseResumePayload**](ExecutionExerciseResumePayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**DeferralSyncView**](DeferralSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startStudentExerciseExecution**
```swift
    open class func startStudentExerciseExecution(sessionId: String, idempotencyKey: String, executionExerciseStartPayload: ExecutionExerciseStartPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseExecutionSyncView?, _ error: Error?) -> Void)
```

Iniciar a execução de um exercício da sessão

Caminho HTTP autoritativo do fato `execution.exercise.start`. A identidade `exerciseExecutionId` é **criada no device** e adotada pelo servidor, como em `POST /student/workout-sessions`: o servidor nunca reemite outra identidade. O corpo é exatamente `ExecutionExerciseStartPayload`, o mesmo payload fechado e versionado que o command preservado publica — uma única definição de fato, dois transportes, zero divergência. A sessão alvo está no path e não se repete no corpo. **A confirmação é o commit no backend.** Sem resposta `201` não existe execução de exercício: nada é prometido para envio posterior e nenhuma falha de rede vira sucesso local. Posição prescrita e posição executada coexistem e nenhuma sobrescreve a outra.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionExerciseStartPayload = ExecutionExerciseStartPayload(exerciseExecutionId: "exerciseExecutionId_example", prescribedExerciseId: "prescribedExerciseId_example", executedVariantId: "executedVariantId_example", equipmentInstanceId: "equipmentInstanceId_example", prescribedPosition: 123, executedPosition: 123, startedAt: Date()) // ExecutionExerciseStartPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Iniciar a execução de um exercício da sessão
WorkoutExecutionAPI.startStudentExerciseExecution(sessionId: sessionId, idempotencyKey: idempotencyKey, executionExerciseStartPayload: executionExerciseStartPayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **executionExerciseStartPayload** | [**ExecutionExerciseStartPayload**](ExecutionExerciseStartPayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**ExerciseExecutionSyncView**](ExerciseExecutionSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateStudentSetExecutionObservation**
```swift
    open class func updateStudentSetExecutionObservation(sessionId: String, setExecutionId: String, idempotencyKey: String, ifMatch: String, executionSetObservationUpdatePayload: ExecutionSetObservationUpdatePayload, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentSetExecutionResponse?, _ error: Error?) -> Void)
```

Atualizar a observação editável de uma série já registrada

Caminho HTTP autoritativo do fato `execution.set.observation.update`, a única parte editável de uma série. Os valores executados são imutáveis por esta operação: corrigi-los exige emenda, que preserva o valor anterior. A escrita é compare-and-set: `If-Match` com a revisão da série — publicada tanto em `revision` quanto no `ETag` da leitura, que são o mesmo valor — é obrigatório, e duas edições concorrentes **nunca** aplicam last-write-wins: a perdedora recebe `412 PRECONDITION_FAILED` e o servidor permanece exatamente como estava. O `setExecutionId` do corpo seleciona o mesmo fato do path e precisa ser igual a ele: divergir é `422 EXECUTION_IDENTITY_MISMATCH`, nunca escrita no fato errado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let setExecutionId = "setExecutionId_example" // String | Série executada dentro da sessão endereçada. É o único agregado revisional da execução: a `revision` que a leitura desta série publica é exatamente a que `If-Match` exige nas escritas revisionais.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let executionSetObservationUpdatePayload = ExecutionSetObservationUpdatePayload(setExecutionId: "setExecutionId_example", observation: "observation_example", updatedAt: Date()) // ExecutionSetObservationUpdatePayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Atualizar a observação editável de uma série já registrada
WorkoutExecutionAPI.updateStudentSetExecutionObservation(sessionId: sessionId, setExecutionId: setExecutionId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, executionSetObservationUpdatePayload: executionSetObservationUpdatePayload, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado, com a mesma identidade adotada em &#x60;POST /student/workout-sessions&#x60;. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível. |
 **setExecutionId** | **String** | Série executada dentro da sessão endereçada. É o único agregado revisional da execução: a &#x60;revision&#x60; que a leitura desta série publica é exatamente a que &#x60;If-Match&#x60; exige nas escritas revisionais. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **executionSetObservationUpdatePayload** | [**ExecutionSetObservationUpdatePayload**](ExecutionSetObservationUpdatePayload.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentSetExecutionResponse**](StudentSetExecutionResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
