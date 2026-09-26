# StudentTrainingAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStudentOfflineWorkoutBundle**](StudentTrainingAPI.md#getstudentofflineworkoutbundle) | **GET** /student/workout-sessions/{sessionId}/bundle | Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor
[**getStudentSchedule**](StudentTrainingAPI.md#getstudentschedule) | **GET** /student/schedule | Obter a programação de treino do aluno num intervalo de datas
[**getStudentToday**](StudentTrainingAPI.md#getstudenttoday) | **GET** /student/today | Obter o dia de treino do aluno
[**getStudentTodayHeader**](StudentTrainingAPI.md#getstudenttodayheader) | **GET** /student/today/header | Obter o cabeçalho independente da tela Hoje
[**getStudentTodayLastSession**](StudentTrainingAPI.md#getstudenttodaylastsession) | **GET** /student/today/last-session | Obter o card independente da última sessão
[**getStudentTodayRelationship**](StudentTrainingAPI.md#getstudenttodayrelationship) | **GET** /student/today/relationship | Obter o card independente do vínculo ativo
[**getStudentTodayWorkout**](StudentTrainingAPI.md#getstudenttodayworkout) | **GET** /student/today/workout | Obter o card independente do treino de hoje
[**getStudentWorkoutSummary**](StudentTrainingAPI.md#getstudentworkoutsummary) | **GET** /student/workouts/{workoutId}/summary | Obter o resumo de um treino prescrito do aluno antes de iniciá-lo
[**startStudentWorkoutSession**](StudentTrainingAPI.md#startstudentworkoutsession) | **POST** /student/workout-sessions | Iniciar a sessão de treino do aluno


# **getStudentOfflineWorkoutBundle**
```swift
    open class func getStudentOfflineWorkoutBundle(sessionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: OfflineWorkoutBundle?, _ error: Error?) -> Void)
```

Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor

Composição da sessão **no momento da leitura**, reautorizada a cada leitura. Além do recorte da prescrição imutável fixada no início — assignment, versão, exercícios, séries, variantes, alternativas autorizadas, histórico comparável e manifesto de mídia —, o bundle inclui **todos os fatos de execução já aceitos pelo servidor** que a retomada precisa, dos tipos `EXERCISE_EXECUTION`, `SET_EXECUTION`, `SET_AMENDMENT`, `REST_PERIOD`, `SUBSTITUTION` e `DEFERRAL`. Cada `SET_EXECUTION` traz os valores em vigor depois das emendas, e a sua `revision` é a mesma que `getStudentSetExecution` publica e que `If-Match` exige. Cada `DEFERRAL`, aberto ou terminal, traz o `deferralId` que a retomada do exercício e a declaração de pendências no encerramento exigem. `DISCOMFORT_REPORT` **nunca** entra no bundle: o relato de desconforto é dado de saúde, dado de saúde não fica armazenado no aparelho, e ele não é necessário para retomar a execução. Esta versão não publica leitura do relato para o aluno; se uma vier a existir, será uma rota própria, nunca este bundle. **Com a capacidade `offline-sync` desligada, esta é a leitura autoritativa para retomar uma sessão `IN_PROGRESS`** — depois de relançar o app, de o processo morrer ou a partir de outro aparelho. O cliente exibe o progresso a partir dela, nunca do armazenamento local. `bundleRevision` é opaco e comparado somente por igualdade: muda **sempre** que qualquer item incluído muda, inclusive um fato de execução ou o estado da sessão, e o mesmo conteúdo produz a mesma `bundleRevision`. `generatedAt` é informativo: duas leituras com a mesma `bundleRevision` podem trazer `generatedAt` diferentes, e o cliente não trata isso como conflito. O cliente persiste os `items` pela mesma identidade `entityType/entityId` usada no delta. Nenhum binário de mídia, estado de rede ou command local atravessa a resposta.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado; existência fora do escopo nunca é revelada.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor
StudentTrainingAPI.getStudentOfflineWorkoutBundle(sessionId: sessionId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sessionId** | **String** | Sessão do aluno autenticado; existência fora do escopo nunca é revelada. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**OfflineWorkoutBundle**](OfflineWorkoutBundle.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentSchedule**
```swift
    open class func getStudentSchedule(from: Date, to: Date, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentScheduleView?, _ error: Error?) -> Void)
```

Obter a programação de treino do aluno num intervalo de datas

Projeção de leitura da tela \"Programação semanal\" do Lote 2. Devolve, para cada data civil do intervalo pedido, o que foi prescrito e o que já é fato registrado, sem reescrever histórico: um dia passado reflete o que foi registrado naquele dia e não é recalculado por uma prescrição publicada depois. Isto é **programação de treino, não agenda operacional**: não há horário, compromisso, slot, lembrete, reserva ou notificação — agenda é capacidade explicitamente excluída do MVP. A resposta é densa: há exatamente uma entrada por data civil entre `from` e `to`, inclusive, em ordem crescente. Um dia sem treino prescrito aparece como `REST_DAY`, nunca como buraco na lista. O servidor é a autoridade da data civil, do timezone efetivo e da noção de \"hoje\": `RECOMMENDED_TODAY` é a decisão de Smart Workout Scheduling, que o cliente não recalcula.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let from = Date() // Date | Primeira data civil do intervalo, inclusive, no timezone do aluno.
let to = Date() // Date | Última data civil do intervalo, inclusive. Nunca anterior a `from`. O servidor é a autoridade do intervalo máximo aceito e recusa um pedido maior com 422.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter a programação de treino do aluno num intervalo de datas
StudentTrainingAPI.getStudentSchedule(from: from, to: to, acceptLanguage: acceptLanguage) { (response, error) in
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
 **from** | **Date** | Primeira data civil do intervalo, inclusive, no timezone do aluno. |
 **to** | **Date** | Última data civil do intervalo, inclusive. Nunca anterior a &#x60;from&#x60;. O servidor é a autoridade do intervalo máximo aceito e recusa um pedido maior com 422. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentScheduleView**](StudentScheduleView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentToday**
```swift
    open class func getStudentToday(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentTodayView?, _ error: Error?) -> Void)
```

Obter o dia de treino do aluno

Projeção de leitura da tela \"Hoje\": o que o aluno tem para fazer hoje, com a autoria e o rótulo de versão da prescrição visíveis, e uma única decisão primária. O servidor é a autoridade da data civil, do timezone efetivo e da noção de \"hoje\"; o cliente não recalcula nenhum dos três. `status` é decidido pelo servidor e é o único estado do dia: o cliente **não** infere estado pela presença ou ausência de `prescribedWorkout`, `openSession` ou `lastSession`. A projeção TERMINA antes da execução: não transporta série, carga, repetição, alvo operacional, descanso, esforço, substituição, adiamento nem desconforto. Esses fatos pertencem ao Workout Core e têm transporte próprio em `/sync/commands`, `/sync/changes` e `/sync/snapshot`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o dia de treino do aluno
StudentTrainingAPI.getStudentToday(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentTodayView**](StudentTodayView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentTodayHeader**
```swift
    open class func getStudentTodayHeader(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentTodayHeaderView?, _ error: Error?) -> Void)
```

Obter o cabeçalho independente da tela Hoje

Projeção independente da saudação. Permite reservar e atualizar o cabeçalho sem depender dos cards de treino, última sessão ou vínculo. A data civil e o timezone são autoridade do servidor; o cliente não recalcula \"hoje\".

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o cabeçalho independente da tela Hoje
StudentTrainingAPI.getStudentTodayHeader(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentTodayHeaderView**](StudentTodayHeaderView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentTodayLastSession**
```swift
    open class func getStudentTodayLastSession(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentTodayLastSessionCardView?, _ error: Error?) -> Void)
```

Obter o card independente da última sessão

Projeção independente do último fato concluído. `EMPTY` representa ausência legítima; falha de transporte continua sendo erro e nunca é convertida em vazio.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o card independente da última sessão
StudentTrainingAPI.getStudentTodayLastSession(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentTodayLastSessionCardView**](StudentTodayLastSessionCardView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentTodayRelationship**
```swift
    open class func getStudentTodayRelationship(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentTodayRelationshipView?, _ error: Error?) -> Void)
```

Obter o card independente do vínculo ativo

Projeção independente do vínculo exibido em Hoje. Somente vínculo ativo é retornado; ausência ou inatividade falham fechadas sem confirmar identidades.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o card independente do vínculo ativo
StudentTrainingAPI.getStudentTodayRelationship(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentTodayRelationshipView**](StudentTodayRelationshipView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentTodayWorkout**
```swift
    open class func getStudentTodayWorkout(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentTodayWorkoutCardView?, _ error: Error?) -> Void)
```

Obter o card independente do treino de hoje

Projeção independente do card principal. `status` é a única autoridade do estado; o cliente não o infere da presença do treino ou da sessão aberta.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o card independente do treino de hoje
StudentTrainingAPI.getStudentTodayWorkout(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentTodayWorkoutCardView**](StudentTodayWorkoutCardView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentWorkoutSummary**
```swift
    open class func getStudentWorkoutSummary(workoutId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSummaryView?, _ error: Error?) -> Void)
```

Obter o resumo de um treino prescrito do aluno antes de iniciá-lo

Projeção de leitura da tela \"Detalhes do treino\" do Lote 2, consumida antes do início da sessão. Devolve o treino exatamente como o personal o prescreveu, ancorado numa versão publicada e imutável (`prescriptionVersionId`), mais as contagens que a tela exibe. A projeção TERMINA antes da execução: não há alvo operacional (`ExecutionTarget`), série, carga, repetição, tempo sob tensão, descanso, substituição, adiamento, esforço, desconforto ou qualquer fato realizado. Esses conceitos pertencem ao Lote 3 e ao Lote 4 e não possuem contrato público nesta versão. `workoutId` e `prescriptionVersionId` são opacos e não revelam chave interna, ordem ou versão de persistência.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let workoutId = "workoutId_example" // String | Identificador público opaco do treino prescrito atribuído ao aluno autenticado.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o resumo de um treino prescrito do aluno antes de iniciá-lo
StudentTrainingAPI.getStudentWorkoutSummary(workoutId: workoutId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **workoutId** | **String** | Identificador público opaco do treino prescrito atribuído ao aluno autenticado. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSummaryView**](WorkoutSummaryView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startStudentWorkoutSession**
```swift
    open class func startStudentWorkoutSession(idempotencyKey: String, startWorkoutSessionRequest: StartWorkoutSessionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionStartResponse?, _ error: Error?) -> Void)
```

Iniciar a sessão de treino do aluno

Command do CTA \"Iniciar treino\" do Lote 2, presente tanto na Home quanto na tela de detalhes do treino. **A identidade da sessão é criada pelo cliente.** `sessionId` é gerado no device e enviado no corpo, e o servidor **adota** a identidade recebida em vez de emitir outra — a mesma identidade vale em qualquer transporte. **A confirmação é o commit no backend**: enquanto a capacidade `offline-sync` estiver desligada, a sessão só existe depois desta resposta; sem rede a operação é bloqueada e o erro é dito como erro de rede, nunca como sucesso adiado. A operação é idempotente por identidade e por `Idempotency-Key`: reenviar o mesmo `sessionId` com o mesmo corpo devolve a sessão original sem criar outra. O mesmo `sessionId` com corpo diferente é conflito explícito (`SESSION_IDENTITY_DIVERGENT`), nunca sobrescrita silenciosa. A sessão fixa `prescriptionVersionId` no início e essa versão permanece imutável: publicar uma nova versão da prescrição depois não altera a sessão em andamento. `startedAt` é o instante declarado pelo device — o instante real do começo, não o instante em que o servidor recebeu o pedido. Esta resposta de início não devolve execução: série, carga, repetição, alvo operacional, descanso, orquestração e encerramento têm caminho HTTP próprio e autoritativo, publicado sob a tag `Workout Execution`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startWorkoutSessionRequest = StartWorkoutSessionRequest(sessionId: "sessionId_example", workoutId: "workoutId_example", prescriptionVersionId: "prescriptionVersionId_example", startedAt: Date(), source: WorkoutSessionStartSource()) // StartWorkoutSessionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Iniciar a sessão de treino do aluno
StudentTrainingAPI.startStudentWorkoutSession(idempotencyKey: idempotencyKey, startWorkoutSessionRequest: startWorkoutSessionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **startWorkoutSessionRequest** | [**StartWorkoutSessionRequest**](StartWorkoutSessionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSessionStartResponse**](WorkoutSessionStartResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
