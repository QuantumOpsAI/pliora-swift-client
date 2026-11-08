# WorkoutExecutionAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**abandonStudentWorkoutSession**](WorkoutExecutionAPI.md#abandonstudentworkoutsession) | **POST** /student/workout-sessions/{sessionId}/abandonment | Abandonar a sessão preservando tudo o que já foi executado
[**addStudentExerciseSetExecution**](WorkoutExecutionAPI.md#addstudentexercisesetexecution) | **POST** /student/workout-sessions/{sessionId}/exercises/{exerciseExecutionId}/sets | Acrescentar série ao exercício após o término da sessão
[**amendStudentSetExecution**](WorkoutExecutionAPI.md#amendstudentsetexecution) | **POST** /student/workout-sessions/{sessionId}/set-executions/{setExecutionId}/amendments | Emendar os valores executados de uma série, preservando o valor anterior
[**completeStudentWorkoutSession**](WorkoutExecutionAPI.md#completestudentworkoutsession) | **POST** /student/workout-sessions/{sessionId}/completion | Encerrar a sessão declarando todas as pendências de orquestração
[**confirmStudentExerciseSkip**](WorkoutExecutionAPI.md#confirmstudentexerciseskip) | **POST** /student/workout-sessions/{sessionId}/skips | Confirmar explicitamente que um exercício não será realizado
[**deferStudentExerciseExecution**](WorkoutExecutionAPI.md#deferstudentexerciseexecution) | **POST** /student/workout-sessions/{sessionId}/deferrals | Adiar um exercício, preservando-o como pendência aberta
[**executeStudentWorkoutControlAction**](WorkoutExecutionAPI.md#executestudentworkoutcontrolaction) | **POST** /student/workout-sessions/{sessionId}/control/actions | Aplicar uma intenção de controle e recuperar seu recibo confirmado
[**getStudentSetExecution**](WorkoutExecutionAPI.md#getstudentsetexecution) | **GET** /student/workout-sessions/{sessionId}/set-executions/{setExecutionId} | Ler a série executada e a revisão que as escritas revisionais exigem
[**getStudentWorkoutControl**](WorkoutExecutionAPI.md#getstudentworkoutcontrol) | **GET** /student/workout-sessions/{sessionId}/control | Ler o controle consistente da sessão e seus checkpoints
[**getStudentWorkoutControlOperation**](WorkoutExecutionAPI.md#getstudentworkoutcontroloperation) | **GET** /student/workout-sessions/{sessionId}/control/operations/{operationId} | Recuperar recibo confirmado com autorização atual
[**rateStudentWorkoutSessionEffort**](WorkoutExecutionAPI.md#ratestudentworkoutsessioneffort) | **PUT** /student/workout-sessions/{sessionId}/effort | Dar a nota de esforço do treino terminado
[**recordStudentRestPeriod**](WorkoutExecutionAPI.md#recordstudentrestperiod) | **POST** /student/workout-sessions/{sessionId}/rest-periods | Registrar o descanso realmente medido entre séries
[**recordStudentSetExecution**](WorkoutExecutionAPI.md#recordstudentsetexecution) | **POST** /student/workout-sessions/{sessionId}/set-executions | Registrar a série executada
[**registerStudentSubstitution**](WorkoutExecutionAPI.md#registerstudentsubstitution) | **POST** /student/workout-sessions/{sessionId}/substitutions | Registrar a substituição autorizada de variante, equipamento ou exercício
[**reorderStudentExerciseExecution**](WorkoutExecutionAPI.md#reorderstudentexerciseexecution) | **POST** /student/workout-sessions/{sessionId}/reorders | Reordenar a fila executada da sessão dentro da política do personal
[**reportStudentDiscomfort**](WorkoutExecutionAPI.md#reportstudentdiscomfort) | **POST** /student/workout-sessions/{sessionId}/discomfort-reports | Relatar desconforto durante a execução
[**resumeStudentDeferredExercise**](WorkoutExecutionAPI.md#resumestudentdeferredexercise) | **POST** /student/workout-sessions/{sessionId}/deferrals/{deferralId}/resumption | Retomar um exercício adiado, sem apagar o fato do adiamento
[**resumeStudentWorkoutSession**](WorkoutExecutionAPI.md#resumestudentworkoutsession) | **POST** /student/workout-sessions/{sessionId}/resumption | Retomar a sessão interrompida, voltando a &#x60;IN_PROGRESS&#x60;
[**startStudentExerciseExecution**](WorkoutExecutionAPI.md#startstudentexerciseexecution) | **POST** /student/workout-sessions/{sessionId}/exercise-executions | Iniciar a execução de um exercício da sessão
[**updateStudentSetExecutionObservation**](WorkoutExecutionAPI.md#updatestudentsetexecutionobservation) | **PUT** /student/workout-sessions/{sessionId}/set-executions/{setExecutionId}/observation | Atualizar a observação editável de uma série já registrada


# **abandonStudentWorkoutSession**
```swift
    open class func abandonStudentWorkoutSession(sessionId: String, idempotencyKey: String, executionSessionAbandonPayload: ExecutionSessionAbandonPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionSyncView?, _ error: Error?) -> Void)
```

Abandonar a sessão preservando tudo o que já foi executado

Caminho HTTP autoritativo do fato `execution.session.abandon`. O `sessionId` do corpo precisa ser igual ao do path: divergir é `422 EXECUTION_IDENTITY_MISMATCH`. **Abandonar não é concluir e não apaga nada**: séries, descansos, substituições, relatos e adiamentos já registrados permanecem íntegros e legíveis. Diferente do encerramento, o abandono **não** exige declarar as pendências: elas permanecem como estavam, sem serem convertidas em pulo por inferência. **Sessão interrompida.** A operação aceita a sessão `INTERRUPTED` — a que o servidor interrompe quando passam 12 horas sem registro — além da `IN_PROGRESS`, e nunca a recusa com `SESSION_INTERRUPTED`: descartar é uma das saídas da decisão do treino, com `reason: USER_REQUESTED`, e o desfecho tem `endedBy: STUDENT`. O abandono que o servidor faz sozinho, sete dias depois da interrupção e sem série executada, usa `reason: INTERRUPTED`; nenhum motivo novo existe.

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

# **addStudentExerciseSetExecution**
```swift
    open class func addStudentExerciseSetExecution(sessionId: String, exerciseExecutionId: String, idempotencyKey: String, addStudentExerciseSetExecutionRequest: AddStudentExerciseSetExecutionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentSetExecutionResponse?, _ error: Error?) -> Void)
```

Acrescentar série ao exercício após o término da sessão

Permite ao aluno acrescentar série a mais a um exercício mesmo com a sessão no estado terminal `COMPLETED` (`DOC-STUDENT-WORKOUT` §7.3; AL12 ações secundárias, §2.5.1). A série nasce como adicional (`isAdditional: true`), com os valores iniciais da série adicional (`DOC-UX-WORKOUT-CORE-SCREENS` §8). No resumo AL12 leva a marca `a mais` e, para o personal, `registrado depois` com o instante do registro na série. **Volume da sessão:** o volume é recalculado na leitura seguinte para incorporar carga × repetições da nova série (se informada em kg ou lb com repetições declaradas). **Recordes:** os recordes da sessão e da variante (§5) são reavaliados; superando a marca anterior, o recorde é consolidado com a data civil da sessão. **Consistência:** o dia já contava como treino concluído, mantendo o status do calendário e da consistência semanal inalterados; apenas a contagem de séries executadas (`setsDone`, `completedSetCount`) é incrementada. **Imutabilidade da sessão:** o instante de término (`endedAt`) e a nota de esforço do treino (`sessionEffort`) permanecem imutáveis (Q-15). Reenviar a mesma identidade (`setExecutionId`) com o mesmo corpo devolve a execução armazenada. Reenviar a mesma identidade com conteúdo diferente é `409 EXECUTION_IDENTITY_DIVERGENT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let exerciseExecutionId = "exerciseExecutionId_example" // String | Identidade da execução do exercício dentro da sessão de treino endereçada.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let addStudentExerciseSetExecutionRequest = AddStudentExerciseSetExecutionRequest(setExecutionId: "setExecutionId_example", actual: WorkoutSetValues(loadValue: 123, loadUnit: "loadUnit_example", reps: 123, durationSeconds: 123, rpe: 123), startedAt: Date(), completedAt: Date(), observation: "observation_example") // AddStudentExerciseSetExecutionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Acrescentar série ao exercício após o término da sessão
WorkoutExecutionAPI.addStudentExerciseSetExecution(sessionId: sessionId, exerciseExecutionId: exerciseExecutionId, idempotencyKey: idempotencyKey, addStudentExerciseSetExecutionRequest: addStudentExerciseSetExecutionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **exerciseExecutionId** | **String** | Identidade da execução do exercício dentro da sessão de treino endereçada. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **addStudentExerciseSetExecutionRequest** | [**AddStudentExerciseSetExecutionRequest**](AddStudentExerciseSetExecutionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentSetExecutionResponse**](StudentSetExecutionResponse.md)

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

Caminho HTTP autoritativo do fato `execution.set.amend`. Emendar **cria um fato novo** e preserva o anterior: `previous` e `replacement` coexistem na emenda e nenhuma série é reescrita em silêncio. `amendmentId` é criado no device e adotado pelo servidor. A escrita é compare-and-set sobre a **série**, não sobre a emenda: `If-Match` ecoa a mesma e única revisão de `SET_EXECUTION` que a leitura publica, e a resposta devolve a revisão nova da série junto com a emenda registrada. O `setExecutionId` do corpo precisa ser igual ao do path: divergir é `422 EXECUTION_IDENTITY_MISMATCH`. **Série por tempo.** `replacement.durationSeconds` só é aceito numa série por tempo, com `reps` nulas, e corrige a duração **realizada em vigor**: o valor anterior fica em `previous`, a `measuredDurationSeconds` da série **nunca muda**, e a série passa a publicar `adjustedDurationSeconds` com o valor novo — ou nenhum, se o valor novo é igual ao medido. Emendar é o **único** caminho de correção de uma série já registrada: um segundo registro da mesma série prescrita é `409 SET_ALREADY_EXECUTED` em `recordStudentSetExecution`. `replacement` sem `durationSeconds` numa série por tempo é `DURATION_REQUIRED`, e com ele numa série que não é por tempo é `DURATION_NOT_APPLICABLE`, ambos `422 VALIDATION_FAILED` com o caminho em `fieldErrors`, sem gravar nada. O alvo (`target`) nunca é emendado.

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

Caminho HTTP autoritativo do fato `execution.session.complete`. O corpo é exatamente `ExecutionSessionCompletePayload` e o `sessionId` do corpo precisa ser igual ao do path: divergir é `422 EXECUTION_IDENTITY_MISMATCH`. **Pendência de orquestração não é encerrada em silêncio.** Todo adiamento ainda aberto é declarado em `pendingDeferralResolutions` com a decisão que o aluno tomou; omitir um adiamento aberto é `409 SESSION_HAS_PENDING_DEFERRALS` e o fato do adiamento permanece recuperável. Lista vazia significa que não havia pendência, nunca que ela foi ignorada. O servidor nunca infere a resolução a partir do relógio. **A confirmação é o commit no backend.** Sem `200` a sessão não está encerrada: não existe conclusão local que valha, e uma falha de rede é dita como falha de rede. **Instantes.** O `completedAt` do corpo é o instante declarado pelo aparelho: é aceito, recusado com `CLOCK_SKEW` quando está à frente do relógio do servidor além da tolerância, e guardado para auditoria. O instante da conclusão é o do servidor que confirma o encerramento, e é ele que a resposta devolve — salvo no término pela decisão do treino, descrito abaixo. **Término sem série executada.** Terminar uma sessão em que nenhuma série foi executada é `409 SESSION_HAS_NO_EXECUTED_SET`, e nada é gravado: a sessão segue como estava e o app oferece descartá-la (`abandonStudentWorkoutSession`). \"Executada\" é a série com status `COMPLETED` ou `PARTIAL`; a série `SKIPPED` não conta. **Sessão interrompida.** A operação aceita a sessão `INTERRUPTED` — a que o servidor interrompe quando passam 12 horas sem registro — além da `IN_PROGRESS`, e nunca a recusa com `SESSION_INTERRUPTED`: terminar é uma das saídas da decisão do treino. O desfecho é `COMPLETED` com `endedBy: STUDENT`. **Término pela decisão do treino.** Quando o aluno escolhe terminar com o que foi feito na tela de decisão, o instante de término é o do **último registro** (`lastRecordedAt`) e não o do pedido: a duração não é inventada. A partir de `INTERRUPTED` a regra vale sempre. A partir de `IN_PROGRESS` — decisão aberta pelo aviso de treino parado, antes das 12 horas — o pedido diz a base com `endedAtBasis: LAST_RECORD`, enviado só por aquela tela. O **Terminar treino** de dentro da sessão não envia o campo e usa o instante do pedido. Nos dois casos de último registro, `completedAt` da resposta é o instante do último registro.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionSessionCompletePayload = ExecutionSessionCompletePayload(sessionId: "sessionId_example", completedAt: Date(), endedAtBasis: "endedAtBasis_example", pendingDeferralResolutions: [DeferralResolutionAtCompletion(deferralId: "deferralId_example", resolution: "resolution_example", skipId: "skipId_example")]) // ExecutionSessionCompletePayload |
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

Caminho HTTP autoritativo do fato `execution.exercise.defer`. `deferralId` é criado no device e adotado pelo servidor. **Adiar não é pular.** O exercício permanece como pendência aberta, visível e recuperável, e o encerramento da sessão recusa qualquer pendência não declarada. `EQUIPMENT_BUSY` (aparelho em uso, que volta a ficar livre) e `EQUIPMENT_UNAVAILABLE` (aparelho quebrado ou ausente, que não volta) são motivos distintos e não se substituem. Posição prescrita e posição executada coexistem: juntas formam a fila dinâmica e nenhuma sobrescreve a outra. A marca **Manter nesta posição** não impede o adiamento; o exercício de bloco combinado não é adiado sozinho.

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

# **executeStudentWorkoutControlAction**
```swift
    open class func executeStudentWorkoutControlAction(sessionId: String, idempotencyKey: UUID, ifMatch: String, workoutControlActionRequest: WorkoutControlActionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutControlReceipt?, _ error: Error?) -> Void)
```

Aplicar uma intenção de controle e recuperar seu recibo confirmado

Publica uma única intenção conforme DOC-WEARABLE-WORKOUT-CONTROL-TECH §§7.1–7.4/11 e binding D05 (R1–R5). Bearer do telefone atual determina o ator; revalidar STUDENT, dono da sessão e vínculo ativo em toda tentativa, inclusive replay. Sessão inexistente ou alheia: SESSION_NOT_FOUND uniforme, sem expor recibos. Acesso é consultado sem settlement antecipado. O interceptor de escrita do treino admite POST antes do caso de uso/replay; 429 não grava efeito/chave nesta tentativa e não prova ausência de commit anterior. JSON limitado a 32768 bytes UTF-8, sem chaves duplicadas, campos extras ou null fora do schema C02. operationId e Idempotency-Key são o mesmo UUIDv7 canônico lowercase. If-Match exige um ETag forte literal; header ausente/malformado e envelope inválido são 422 VALIDATION_FAILED com fieldErrors, nunca 428. IDs corpo/path ou chave divergentes: 422 EXECUTION_IDENTITY_MISMATCH. Fingerprint inclui ator, sessão, prescrição fixada, operationId, If-Match original literal, action, expiresAt, phaseId, occurrence e payload completo. Instantes são normalizados; preservar strings opacas e ausência/null permitidos. Reusar HttpIdempotency/execution.idempotency_record. Operation interna fixa execution.workout.control.action (32 bytes); key UUID(actor):UUID(session):UUIDv7(operationId) (110 bytes), sem action no namespace. Chave interna nunca vai ao cliente/log. messageId/associação/RTT não entram no fingerprint. Após validar envelope, serializar pela operação idempotente e reautorizar acesso atual antes de lookup. Recibo idêntico retorna antes de lifecycle/settlement, CAS e validade de efeito novo, mesmo com If-Match antigo, expiresAt vencido ou sessão terminal. Mesma chave com action/corpo/contexto/ETag/prazo diferente: 409 IDEMPOTENCY_CONFLICT sem escrita. Consulta/recuperação nunca executa outra intenção. Mesmo resultado e ETag originais são preservados; replay não incrementa revisão/atividade. Para efeito novo, locks sessão → controle → fatos em ordem estável. Reconciliar pausa/inatividade/settlement sob lock. Antes da primeira escrita revalidar autorização e serverNow < expiresAt <= serverNow+30s, CAS do controle, fase/ocorrência, CAS da série e domínio. Espera por locks não renova prazo; INTENT_EXPIRED/INTENT_WINDOW_EXCEEDED são 422. Controle ou revisão da série divergentes: 412, sem atingir outra série. Fatos, controle, atividade, change log e recibo são atômicos na ExecutionTransaction; falha tipada/exceção faz rollback total. Efeito novo incrementa controlRevision uma vez. Resposta e invalidação best effort só depois do commit; ACK/timeout não confirmam negócio. Reapresentação explícita em memória preserva bytes, chave, corpo, ETag e expiresAt enquanto válida; sem retry automático/fila. Depois do prazo só GET recibo; retenção expirada não torna intenção antiga nova. 5xx/timeout permanecem UNKNOWN até recuperação. Este contrato não implementa storage/locks/backend nem prova execução transacional.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = 987 // UUID | UUIDv7 canônico lowercase, idêntico byte a byte a operationId do corpo. Ausente/malformado: 422 VALIDATION_FAILED com fieldErrors; divergência corpo/header: 422 EXECUTION_IDENTITY_MISMATCH. A mesma chave não separa actions.
let ifMatch = "ifMatch_example" // String | Um único ETag forte literal do par control/ETag confirmado atual, preservando aspas e caixa. Sem weak tag, lista, *, vazio ou whitespace. Ausente/malformado: 422 VALIDATION_FAILED com fieldErrors, nunca 428. CAS divergente para efeito novo: 412 PRECONDITION_FAILED. Recibo idêntico conhecido é recuperado antes de CAS/validade. expectedSetRevision é revisão independente da série.
let workoutControlActionRequest = WorkoutControlActionRequest(operationId: 123, action: "action_example", expiresAt: Date(), phaseId: "phaseId_example", occurrence: WorkoutControlOccurrenceRef(occurrenceId: "occurrenceId_example", prescribedExerciseId: "prescribedExerciseId_example", prescribedSetId: "prescribedSetId_example"), payload: WorkoutControlAmendLastSetPayload(amendmentId: 123, setExecutionId: "setExecutionId_example", expectedSetRevision: "expectedSetRevision_example", replacement: WorkoutControlValues(loadValue: 123, loadUnit: "loadUnit_example", reps: WorkoutControlValues_reps(), durationSeconds: 123))) // WorkoutControlActionRequest | Envelope C02 fechado das nove ações; no máximo 32768 bytes UTF-8. expiresAt é obrigatório e nunca renovado no retry.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Aplicar uma intenção de controle e recuperar seu recibo confirmado
WorkoutExecutionAPI.executeStudentWorkoutControlAction(sessionId: sessionId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, workoutControlActionRequest: workoutControlActionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **idempotencyKey** | **UUID** | UUIDv7 canônico lowercase, idêntico byte a byte a operationId do corpo. Ausente/malformado: 422 VALIDATION_FAILED com fieldErrors; divergência corpo/header: 422 EXECUTION_IDENTITY_MISMATCH. A mesma chave não separa actions. |
 **ifMatch** | **String** | Um único ETag forte literal do par control/ETag confirmado atual, preservando aspas e caixa. Sem weak tag, lista, *, vazio ou whitespace. Ausente/malformado: 422 VALIDATION_FAILED com fieldErrors, nunca 428. CAS divergente para efeito novo: 412 PRECONDITION_FAILED. Recibo idêntico conhecido é recuperado antes de CAS/validade. expectedSetRevision é revisão independente da série. |
 **workoutControlActionRequest** | [**WorkoutControlActionRequest**](WorkoutControlActionRequest.md) | Envelope C02 fechado das nove ações; no máximo 32768 bytes UTF-8. expiresAt é obrigatório e nunca renovado no retry. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutControlReceipt**](WorkoutControlReceipt.md)

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

# **getStudentWorkoutControl**
```swift
    open class func getStudentWorkoutControl(sessionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutControlView?, _ error: Error?) -> Void)
```

Ler o controle consistente da sessão e seus checkpoints

Leitura autoritativa segundo DOC-WEARABLE-WORKOUT-CONTROL-TECH §§5–9 e binding D05. Reautoriza em toda leitura papel STUDENT, conta dona, vínculo ativo e sessão; sessão inexistente ou de outra conta responde SESSION_NOT_FOUND uniforme. allowedActions é projeção para apresentação e não concede autorização. Backend confirma todas as transições. Snapshot, fatos, revisões e checkpoints vêm de uma única transação consistente. GET não cria fato, recibo, revisão ou atividade por tick; eventual settlement usa o mesmo algoritmo autoritativo de inatividade. A sessão/prescrição fixada e a ocorrência real não são inferidas pelo consumidor. ETag forte entre aspas é o validador opaco literal dessa projeção; copiar o header intacto. controlRevision ordena somente o mesmo contexto, sessionRevision acompanha lifecycle, revisão da série protege o fato e bundleRevision só admite igualdade. Sem If-None-Match, 304 ou rate limit de escrita. Todas as respostas usam private, no-store, locale resolvido e correlation ID. Ancorar tempo no monotônico ao receber e registrar RTT como incerteza; processo reiniciado exige nova leitura. Tick e alvo atingido nunca concluem série/treino, renovam atividade nem escrevem. Pausa preserva fase e intervalo e congela o tempo operacional, inclusive depois do limite de 60 min da exclusão de inatividade. Sem alvo conta para cima; zero é alvo real. Este contrato parcial não libera consumidor produtivo, relay, outbox ou coleta de saúde.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o controle consistente da sessão e seus checkpoints
WorkoutExecutionAPI.getStudentWorkoutControl(sessionId: sessionId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutControlView**](WorkoutControlView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentWorkoutControlOperation**
```swift
    open class func getStudentWorkoutControlOperation(sessionId: String, operationId: UUID, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutControlReceipt?, _ error: Error?) -> Void)
```

Recuperar recibo confirmado com autorização atual

Recupera somente recibo confirmado já persistido, conforme DOC-WEARABLE-WORKOUT-CONTROL-TECH §§7.4/11 e binding D05. Reautoriza sessão atual do telefone, STUDENT, conta dona e vínculo ativo ANTES do lookup. Sessão ausente/alheia recebe SESSION_NOT_FOUND uniforme; revogação/pausa/inatividade impedem exposição mesmo com operação conhecida. Sessão terminal do dono permite lookup enquanto vínculo ativo. Leitura não bloqueante de recibo confirmado: operação em voo, nunca registrada ou expurgada são indistinguíveis como 404 OPERATION_NOT_RECOVERED, outcome UNKNOWN. Isso não prova nunca enviado/ausência de commit e não autoriza reapresentação automática nem outra chave. GET não executa intenção, cria recibo, incrementa revisão/atividade ou faz bootstrap/settlement de retenção. Não exige Idempotency-Key/If-Match, não usa If-None-Match/304 nem rate limit de escrita. operationId malformado: 422 VALIDATION_FAILED com fieldErrors. 200 devolve o mesmo recibo e ETag forte original do commit. control pode ser anterior ao estado atual; registrar CONFIRMED sem substituir estado/ETag de controlRevision superior. Nunca usar o ETag latest para recibo antigo. 5xx mantêm UNKNOWN até recuperação. Reter enquanto sessão aberta e, após terminal, pelo menos até max(receipt.committedAt,terminalRetentionAnchorAt)+604800s. Âncora interna persistida e imutável usa Clock do servidor na primeira transição terminal (TERMINAL_TRANSITION), ou observação real de legado terminal (FIRST_TERMINAL_OBSERVATION); nunca inferir de endedAt/updatedAt/lastRecordedAt. Sem âncora/proveniência conhecida, reter; GET não a cria nem renova. A retenção é mínimo, não SLA de expurgo, e expurgo não renova expiresAt. Todas as respostas são private, no-store, variam por Authorization/Accept-Language e usam locale resolvido/correlation ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let operationId = 987 // UUID | Identidade UUIDv7 canônica lowercase da intenção original. Consultar não executa nem reenvia a ação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Recuperar recibo confirmado com autorização atual
WorkoutExecutionAPI.getStudentWorkoutControlOperation(sessionId: sessionId, operationId: operationId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **operationId** | **UUID** | Identidade UUIDv7 canônica lowercase da intenção original. Consultar não executa nem reenvia a ação. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutControlReceipt**](WorkoutControlReceipt.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rateStudentWorkoutSessionEffort**
```swift
    open class func rateStudentWorkoutSessionEffort(sessionId: String, rateWorkoutSessionEffortRequest: RateWorkoutSessionEffortRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionEffort?, _ error: Error?) -> Void)
```

Dar a nota de esforço do treino terminado

A nota de esforço do treino inteiro, de 0 a 10, opcional, em um toque. O corpo é `{ effort }`, inteiro, e não tem campo de texto: comentário, pergunta e mensagem não existem. É declaração do aluno sobre o treino todo, e não a média das séries. **A nota é dada uma vez.** O primeiro `PUT` da sessão grava a nota e responde `200`; o **mesmo** pedido repetido — o mesmo valor — é idempotente e responde `200` com a mesma nota, sem novo efeito; um valor **diferente** depois de a nota existir é `409 EFFORT_ALREADY_RATED`, e a nota gravada permanece. **Não há `DELETE`**: a nota não é alterada nem removida depois, e **não há prazo** — nem janela de tempo, nem campo de prazo, nem `EFFORT_WINDOW_CLOSED`. O servidor aceita o primeiro `PUT` da sessão venha quando vier; quem só oferece a nota na tela que aparece ao terminar é o app. Se o app é encerrado antes dessa tela, a sessão fica sem nota. **Só para a sessão concluída pelo aluno.** Na ordem em que são avaliados: sessão que não é `COMPLETED` — aberta, interrompida ou descartada — é `409 SESSION_NOT_COMPLETED`; sessão `COMPLETED` cujo `endedBy` não é `STUDENT` — a encerrada automaticamente e a encerrada pela pausa ou pelo encerramento do vínculo, em que o aluno não passou pela tela — é `409 EFFORT_NOT_AVAILABLE`; nota que já existe com valor diferente é `409 EFFORT_ALREADY_RATED`. Sessão de outra conta ou inexistente é `404 SESSION_NOT_FOUND`, e valor fora de 0 a 10 ou corpo com outro campo é `422 VALIDATION_FAILED`. **A confirmação é o commit no backend.** Sem `200` a nota não existe: o app reenvia a mesma nota, o que é idempotente, ou segue para o resumo sem ela. **O `403` é só o de conta** (`FORBIDDEN`: a identidade não tem o contexto de aluno). A spec não condiciona a nota ao vínculo, então esta operação nunca responde `RELATIONSHIP_PAUSED` nem `RELATIONSHIP_INACTIVE`: a sessão terminada é fato da conta, como a leitura do resultado. A nota é declaração do aluno, selo `DECLARED`: não gera item de atenção, o personal a lê junto do treino feito, e nenhuma tela a interpreta.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let rateWorkoutSessionEffortRequest = RateWorkoutSessionEffortRequest(effort: 123) // RateWorkoutSessionEffortRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Dar a nota de esforço do treino terminado
WorkoutExecutionAPI.rateStudentWorkoutSessionEffort(sessionId: sessionId, rateWorkoutSessionEffortRequest: rateWorkoutSessionEffortRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **rateWorkoutSessionEffortRequest** | [**RateWorkoutSessionEffortRequest**](RateWorkoutSessionEffortRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSessionEffort**](WorkoutSessionEffort.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **recordStudentRestPeriod**
```swift
    open class func recordStudentRestPeriod(sessionId: String, idempotencyKey: String, executionRestRecordPayload: ExecutionRestRecordPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: RestPeriodSyncView?, _ error: Error?) -> Void)
```

Registrar o descanso realmente medido entre séries

Caminho HTTP autoritativo do fato `execution.rest.record`. `restPeriodId` é criado no device e adotado pelo servidor. Alvo, alvo ajustado, medido e pausas permanecem **quatro fatos distintos**: o servidor deriva `measuredSeconds` de início, fim e pausas, e nunca substitui o alvo pelo medido. Nenhum tick de timer atravessa esta operação: só o intervalo consolidado é registrado. **`targetSeconds` é anulável.** Ele é o descanso prescrito depois da série (`PrescribedSetSyncView.restSeconds`) e fica **ausente** quando não há descanso prescrito: a ausência nunca vira zero, e `targetSeconds: 0` só diz um descanso prescrito de zero segundo. Sem alvo não há ajuste (`adjustedTargetSeconds` só existe com `targetSeconds`) e não há excedente. O **alvo efetivo** é `adjustedTargetSeconds` quando presente, senão `targetSeconds`. O excedente não é gravado nem publicado aqui: é derivado na leitura do resultado da sessão.

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
    open class func recordStudentSetExecution(sessionId: String, idempotencyKey: String, executionSetRecordPayload: ExecutionSetRecordPayload, acceptLanguage: String? = nil, ifMatch: String? = nil, completion: @escaping (_ data: StudentSetExecutionResponse?, _ error: Error?) -> Void)
```

Registrar a série executada

Caminho HTTP autoritativo do fato `execution.set.record`. `setExecutionId` é **criado no device** e adotado pelo servidor; o corpo é exatamente `ExecutionSetRecordPayload`. `target` preserva o alvo operacional apresentado, com origem e `expectedRpe`; `actual` é o realizado e fica ausente somente em `SKIPPED`. Prescrito, alvo e realizado permanecem fatos distintos e o servidor nunca reescreve o prescrito. A resposta publica `revision`, a revisão opaca desta série — o **mesmo** valor do `ETag`, sem tradução. O fechamento de uma OPEN, a observação e a emenda desta série exigem exatamente essa revisão em `If-Match`. Ela não é `controlRevision` (inteiro operacional por sessão), `sessionRevision` (ciclo de vida) nem `bundleRevision` (token opaco de igualdade do pacote). Reenviar a mesma identidade com conteúdo diferente é `409 EXECUTION_IDENTITY_DIVERGENT`, nunca sobrescrita silenciosa. **Uma execução por série prescrita por sessão.** Cada `prescribedSetId` admite uma única execução na sessão. Registrar **outra identidade** (`setExecutionId` diferente) para uma série prescrita que já tem execução é `409 SET_ALREADY_EXECUTED`, e nenhuma segunda execução nasce: o app recarrega o bundle da sessão e segue na série seguinte. **Corrigir é emenda**, nunca um segundo registro: `amendStudentSetExecution`. O replay da mesma identidade com o mesmo corpo devolve a execução armazenada. **Fechar a mesma OPEN.** Quando o fato canônico já está OPEN, esta rota exige `If-Match` com a revisão pública exata **da série**, pela convenção existente de `ExecutionRevisionHeader`. Ausência ou header malformado é `422 VALIDATION_FAILED`; revisão apresentada divergente é `412 PRECONDITION_FAILED`, sem efeito. O replay idêntico autorizado é resolvido antes da precondição. O servidor fecha a mesma `setExecutionId`, preserva o alvo capturado e reconcilia o controle na mesma transação; não cria outra série nem incrementa contagem no replay. Criar o primeiro fato terminal sem OPEN continua sem exigir esse header. O estado OPEN é canônico: não há flag no corpo, e o schema JSON não consulta o banco para decidir essa condição. Todo chamador HTTP/online/sync respeita essa política. Um chamador interno sem precondição pública só fecha OPEN pelo coordenador após CAS e ocorrência do controle validados sob os mesmos locks de sessão/controle/fato, passando `expectedRevision` não nulo ao `RecordSet`. Nunca preencher a versão atual cegamente para contornar uma intenção antiga; `RecordSet(null)` não autoriza ignorar CAS. `BEGIN_SET` abre a série e não equivale ao início de exercício (`startStudentExerciseExecution`) nem à conclusão. **Alvo × executado.** `target` é o **alvo de partida**, fixado quando a tela da série abriu, e **o servidor o grava**, junto do `actual`, para o resultado mostrar prescrito × alvo × executado. `target.source` é `PRESCRIPTION`, `PREVIOUS_COMPARABLE_EXECUTION` (primeira série do tipo, a partir do histórico comparável), `PERCENT_OF_REFERENCE` ou `STUDENT_ADJUSTMENT`: a série seguinte da **mesma sessão** nasce do **executado** na série anterior do mesmo tipo, com a origem `STUDENT_ADJUSTMENT`. `actual` são os números da tela no toque em **Concluir série**; mudar um número antes disso muda só o `actual`. Exemplo canônico (`canonicalFirstSet` e `canonicalSecondSet`): a série 1 tem alvo 20×12 (`PRESCRIPTION`) e executado 25×12; a série 2 tem alvo 25×12 (`STUDENT_ADJUSTMENT`) e executado 25×10. **Série por tempo.** `durationSeconds` só existe numa série cuja prescrição é por tempo (`PrescribedSetSyncView.target.durationSeconds`), e nela as `reps` são **nulas** no `target` e no `actual`: a série por tempo não tem repetição, e a ausência dela nunca vira zero. No `target`, `durationSeconds` é a duração alvo apresentada; no `actual`, é a duração realizada **em vigor**. No registro terminal direto sem OPEN, a duração **medida pelo cronômetro da série** vai em `measuredDurationSeconds`, é obrigatória em série por tempo concluída ou parcial e **nunca é sobrescrita**: quando `actual.durationSeconds` difere dela o aluno a corrigiu, e a série passa a publicar `adjustedDurationSeconds` com o valor corrigido. Medido e ajustado são dois fatos, e o excedente sobre a duração alvo é fato, não erro. Série pulada não tem duração realizada nem medida. **OPEN por tempo controlada.** Neste contexto, o request omite tanto `actual.durationSeconds` quanto `measuredDurationSeconds`; `actual` mantém carga/unidade e `reps: null`. O servidor deriva medida e duração realizada iguais, positivas (>= 1), de floor(checkpoint ativo no commit/1000), preservando o alvo capturado e sem `adjustedDurationSeconds`. Duração explícita nesse caminho é `422 VALIDATION_FAILED`, com `fieldErrors[].code` igual a `DURATION_FROM_CONTROL_REQUIRED` associado a cada campo de duração fornecido. A mesma forma JSON pode ser legítima no registro terminal direto sem OPEN, que conserva a medida/realizada declaradas anteriores. A decisão depende do contexto canônico, não de uma união ou campo novo. Se a tela mostrava 10 s e o commit mede 11 s, a resposta traz medida/realizada/ativa 11 s; somente uma emenda deliberada pode corrigir a realizada para 12 s mantendo medida/ativa 11 s. `startedAt`/`completedAt` declarados não comandam a duração operacional. **Alvo em percentual.** `target.source: PERCENT_OF_REFERENCE` só vale numa série prescrita em percentual cujo alvo calculado da sessão (`WorkoutSessionSyncView.calculatedLoadTargets`) está `CALCULATED`, e então `target.loadValue` e `target.loadUnit` são exatamente os dele; o aluno que muda o valor registra `STUDENT_ADJUSTMENT`, e o prescrito em percentual nunca é reescrito. Cada violação é `422 VALIDATION_FAILED` com o caminho em `fieldErrors` e um destes códigos: `DURATION_NOT_APPLICABLE` (duração em série que não é por tempo), `DURATION_REQUIRED` (série por tempo sem duração alvo, ou concluída sem duração realizada), `REPS_NOT_APPLICABLE` (repetições numa série por tempo), `MEASURED_DURATION_REQUIRED`, `MEASURED_DURATION_NOT_APPLICABLE`, `PERCENT_TARGET_NOT_CALCULATED` e `PERCENT_TARGET_VALUE_MISMATCH`. Nada é gravado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let executionSetRecordPayload = ExecutionSetRecordPayload(setExecutionId: "setExecutionId_example", exerciseExecutionId: "exerciseExecutionId_example", prescribedSetId: "prescribedSetId_example", setIndex: 123, status: ExecutedSetStatus(), target: ExecutionTargetValues(loadValue: 123, loadUnit: "loadUnit_example", reps: 123, durationSeconds: 123, source: "source_example", expectedRpe: 123), actual: WorkoutSetValues(loadValue: 123, loadUnit: "loadUnit_example", reps: 123, durationSeconds: 123, rpe: 123), measuredDurationSeconds: 123, executedVariantId: "executedVariantId_example", equipmentInstanceId: "equipmentInstanceId_example", startedAt: Date(), completedAt: Date(), observation: "observation_example") // ExecutionSetRecordPayload |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let ifMatch = "ifMatch_example" // String | Condicionalmente obrigatório ao fechar fato canônico OPEN: revisão pública da série, ecoada da leitura pela convenção de ExecutionRevisionHeader. Ausente/malformado nesse contexto é 422 VALIDATION_FAILED; apresentado e divergente é 412 PRECONDITION_FAILED. O primeiro registro terminal sem OPEN não exige o header. Replay idêntico autorizado precede CAS; o schema do corpo não conhece o estado canônico. Nunca usar a revisão do controle/sessão/pacote. (optional)

// Registrar a série executada
WorkoutExecutionAPI.recordStudentSetExecution(sessionId: sessionId, idempotencyKey: idempotencyKey, executionSetRecordPayload: executionSetRecordPayload, acceptLanguage: acceptLanguage, ifMatch: ifMatch) { (response, error) in
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
 **ifMatch** | **String** | Condicionalmente obrigatório ao fechar fato canônico OPEN: revisão pública da série, ecoada da leitura pela convenção de ExecutionRevisionHeader. Ausente/malformado nesse contexto é 422 VALIDATION_FAILED; apresentado e divergente é 412 PRECONDITION_FAILED. O primeiro registro terminal sem OPEN não exige o header. Replay idêntico autorizado precede CAS; o schema do corpo não conhece o estado canônico. Nunca usar a revisão do controle/sessão/pacote. | [optional]

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

Caminho HTTP autoritativo do fato `execution.exercise.reorder`. `reorderId` é criado no device e adotado pelo servidor. A marca **Manter nesta posição** (`orderPolicy: LOCKED` fora de bloco) é orientação e nunca recusa a reordenação. O servidor recusa com `409 EXERCISE_ORDER_NOT_ALLOWED`, e a ordem permanece exatamente como estava, só o que a estrutura do treino impede: mover sozinho um exercício de bloco combinado, tirá-lo do bloco ou passá-lo à frente do exercício de que ele depende. Reordenação sem registro não é reordenação: a ordem prescrita permanece íntegra ao lado da executada. A resposta devolve a **fila executada resultante inteira**, porque mover um exercício desloca os demais: o cliente adota a ordem do servidor em vez de recalculá-la localmente.

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

# **resumeStudentWorkoutSession**
```swift
    open class func resumeStudentWorkoutSession(sessionId: String, idempotencyKey: String, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionSyncView?, _ error: Error?) -> Void)
```

Retomar a sessão interrompida, voltando a `IN_PROGRESS`

Saída da decisão do treino que **continua** o treino. O servidor interrompe a sessão quando passam **12 horas de inatividade efetiva**, contadas de lastRecordedAt com exclusão dos primeiros 3600 s de cada pausa confirmada conforme R5, e a encerra sozinho **sete dias depois da interrupção**, sem decisão do aluno (`endedBy: AUTO_AFTER_INTERRUPTION`). Entre as duas, esta operação leva a sessão de `INTERRUPTED` para `IN_PROGRESS` e `lastRecordedAt` passa a ser o instante do servidor que confirma a retomada. **Em sessão já `IN_PROGRESS` responde `200` sem efeito**: o app que abriu a decisão pelo aviso de treino parado, antes das 12 horas, não retoma nada, e se chamar não perde nem muda nada. **Em sessão terminal responde `409 SESSION_TERMINAL`.** A retomada não tem corpo: a identidade da sessão é a do path. Enquanto a sessão está `INTERRUPTED`, toda escrita de fato — série, descanso, início de exercício, substituição, desconforto, adiamento, pulo, reordenação — é recusada com `409 SESSION_INTERRUPTED`, e o app leva à decisão; só esta operação, `completeStudentWorkoutSession` e `abandonStudentWorkoutSession` agem sobre ela. O path **não** é o de `resumeStudentDeferredExercise` (`…/deferrals/{deferralId}/resumption`), que retoma um exercício adiado e não a sessão.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Retomar a sessão interrompida, voltando a `IN_PROGRESS`
WorkoutExecutionAPI.resumeStudentWorkoutSession(sessionId: sessionId, idempotencyKey: idempotencyKey, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSessionSyncView**](WorkoutSessionSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startStudentExerciseExecution**
```swift
    open class func startStudentExerciseExecution(sessionId: String, idempotencyKey: String, executionExerciseStartPayload: ExecutionExerciseStartPayload, acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseExecutionSyncView?, _ error: Error?) -> Void)
```

Iniciar a execução de um exercício da sessão

Caminho HTTP autoritativo do fato `execution.exercise.start`. A identidade `exerciseExecutionId` é **criada no device** e adotada pelo servidor, como em `POST /student/workout-sessions`: o servidor nunca reemite outra identidade. O corpo é exatamente `ExecutionExerciseStartPayload`, o mesmo payload fechado e versionado que o command preservado publica — uma única definição de fato, dois transportes, zero divergência. A sessão alvo está no path e não se repete no corpo. **A confirmação é o commit no backend.** Sem resposta `201` não existe **início** do exercício: nada é prometido para envio posterior e nenhuma falha de rede vira sucesso local. **A identidade e o início são fatos separados.** A identidade nasce no aparelho e o servidor a adota na primeira ação que a usa, que pode ser este início ou uma ação sobre o exercício ainda não começado — trocar, adiar, reordenar ou pular. Nessa ação o corpo endereça o exercício prescrito: a troca pelo `prescribedExerciseId`; o adiamento, a reordenação e o pulo pelo `prescribedPosition`. Essa ação não grava início: a execução existe sem ele, `PENDING` — `DEFERRED` depois de adiar, `SKIPPED` depois de pular. O início só é gravado quando o aluno de fato começa, e uma vez só. Posição prescrita e posição executada coexistem e nenhuma sobrescreve a outra.

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
