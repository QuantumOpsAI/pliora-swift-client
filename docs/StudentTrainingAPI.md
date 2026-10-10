# StudentTrainingAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStudentConsistency**](StudentTrainingAPI.md#getstudentconsistency) | **GET** /student/progress/consistency | Ler a consistência semanal do aluno
[**getStudentExerciseDemonstration**](StudentTrainingAPI.md#getstudentexercisedemonstration) | **GET** /student/exercises/{exerciseId}/demonstration | Obter a demonstração em vídeo de um exercício do catálogo prescrito ao aluno
[**getStudentExerciseProgress**](StudentTrainingAPI.md#getstudentexerciseprogress) | **GET** /student/exercise-progress/{exerciseId} | Ler a evolução de um exercício numa variante
[**getStudentNotificationConsent**](StudentTrainingAPI.md#getstudentnotificationconsent) | **GET** /student/notification-consent | Ler o consentimento de notificações vigente do aluno
[**getStudentOfflineWorkoutBundle**](StudentTrainingAPI.md#getstudentofflineworkoutbundle) | **GET** /student/workout-sessions/{sessionId}/bundle | Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor
[**getStudentSchedule**](StudentTrainingAPI.md#getstudentschedule) | **GET** /student/schedule | Obter a programação de treino do aluno num intervalo de datas
[**getStudentToday**](StudentTrainingAPI.md#getstudenttoday) | **GET** /student/today | Obter o dia de treino do aluno
[**getStudentTodayHeader**](StudentTrainingAPI.md#getstudenttodayheader) | **GET** /student/today/header | Obter o cabeçalho independente da tela Hoje
[**getStudentTodayLastSession**](StudentTrainingAPI.md#getstudenttodaylastsession) | **GET** /student/today/last-session | Obter o card independente da última sessão
[**getStudentTodayRelationship**](StudentTrainingAPI.md#getstudenttodayrelationship) | **GET** /student/today/relationship | Obter o card independente do vínculo do aluno
[**getStudentTodayWorkout**](StudentTrainingAPI.md#getstudenttodayworkout) | **GET** /student/today/workout | Obter o card independente do treino de hoje
[**getStudentWorkoutSessionResult**](StudentTrainingAPI.md#getstudentworkoutsessionresult) | **GET** /student/workout-sessions/{sessionId}/result | Ler o resultado de uma sessão de treino terminada
[**getStudentWorkoutSummary**](StudentTrainingAPI.md#getstudentworkoutsummary) | **GET** /student/workouts/{workoutId}/summary | Obter o resumo de um treino prescrito do aluno antes de iniciá-lo
[**listStudentExerciseProgress**](StudentTrainingAPI.md#liststudentexerciseprogress) | **GET** /student/exercise-progress | Listar os exercícios que o aluno já executou
[**listStudentWorkoutSessions**](StudentTrainingAPI.md#liststudentworkoutsessions) | **GET** /student/workout-sessions | Ler o histórico de treinos feitos do aluno
[**startStudentWorkoutSession**](StudentTrainingAPI.md#startstudentworkoutsession) | **POST** /student/workout-sessions | Iniciar a sessão de treino do aluno


# **getStudentConsistency**
```swift
    open class func getStudentConsistency(acceptLanguage: String? = nil, weeks: Int? = nil, completion: @escaping (_ data: StudentConsistencyView?, _ error: Error?) -> Void)
```

Ler a consistência semanal do aluno

A consistência das últimas semanas, para as barras da aba Progresso: por semana, de segunda a domingo no fuso do vínculo, quantos treinos o aluno concluiu e — quando o plano diz — quantos o plano previa. `weeks` de 1 a 12, padrão 8: a resposta traz exatamente essa quantidade de semanas seguidas, da mais antiga à corrente, que é a última. **`sessionsCompleted`** conta as sessões `COMPLETED` com `localDate` na semana, inclusive a encerrada automaticamente como concluída; a descartada não conta. É um fato lido, e a semana sem treino concluído é `0` — não é ausência de leitura. **`workoutsPlanned`** vem dos dias da ativação vigente na semana, e não das atribuições já geradas, que em dias da semana só nascem por leitura e nunca para o dia passado. Por isso o campo se chama `workoutsPlanned`, e não `workoutsAssigned`. É **ausente** em sequência livre e em semana sem ativação vigente, e **nunca zero**. `planMode` é o modo da ativação vigente em `asOf` (`WEEKDAYS` ou `SEQUENCE`) e é **ausente** quando não há ativação vigente. `partialWeek` marca a semana que ainda não terminou em `asOf`, que é a corrente. **Fuso e semana corrente.** O fuso é o do vínculo vigente (ativo ou pausado) em `asOf`; sem vínculo vigente, é o do último vínculo que o aluno teve, o mesmo sob o qual o `localDate` das sessões foi gravado; o aluno que nunca teve vínculo não tem sessão, e as semanas saem com `sessionsCompleted` `0`, calculadas em UTC. A semana corrente é a que contém a data civil de `asOf` nesse fuso, e `asOf` traz o deslocamento dele. **O que esta leitura nunca publica, e a proibição é de contrato, não de tela:** escore, percentual e sequência de dias. Nenhum campo, em nenhuma forma, traz nota, taxa, razão entre treinos feitos e previstos, contagem de dias seguidos, de dias sem treinar ou de semanas perdidas, nem meta criada pelo produto. `2 de 4` são dois números, e a tela os diz sem os dividir. Isto é leitura do aluno sobre si, e não o motivo \"baixa aderência\" da fila do personal. **Leitura de treino feito.** Autoriza pela conta dona dos fatos, e não pelo vínculo: responde com o vínculo pausado, encerrado ou trocado — e sem ativação vigente, que então não tem `planMode` nem denominador. O `403` só responde a conta sem o contexto de aluno (`FORBIDDEN`). Nada desta leitura é publicado ao personal. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let weeks = 987 // Int | Quantas semanas ler, terminando na corrente, de 1 a 12; o padrão é 8. (optional) (default to 8)

// Ler a consistência semanal do aluno
StudentTrainingAPI.getStudentConsistency(acceptLanguage: acceptLanguage, weeks: weeks) { (response, error) in
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
 **weeks** | **Int** | Quantas semanas ler, terminando na corrente, de 1 a 12; o padrão é 8. | [optional] [default to 8]

### Return type

[**StudentConsistencyView**](StudentConsistencyView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentExerciseDemonstration**
```swift
    open class func getStudentExerciseDemonstration(exerciseId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentExerciseDemonstrationView?, _ error: Error?) -> Void)
```

Obter a demonstração em vídeo de um exercício do catálogo prescrito ao aluno

A demonstração de um exercício do **catálogo** que está na prescrição do aluno, para a tela do exercício durante a execução (decisão do dono de 2026-10-04, `pliora-contracts#261`). A mídia é resolvida **na hora**, do mesmo registro que o personal lê em `getExerciseCatalogItem` (`ADR-0014` §4): o servidor não guarda o catálogo, nem a URL da origem, nem a mídia. Cada asset traz a mesma identidade `assetId` + `mediaVersion` que o personal vê no detalhe, e `url` é uma capacidade de **curta duração** com `expiresAt`, nunca identidade. **Só para quem recebe o exercício.** Responde apenas ao aluno com vínculo **ativo** cuja prescrição, na **versão publicada em vigor**, contém o exercício — como variante prescrita ou como alternativa autorizada. Um exercício que não existe, que não está na versão em vigor do aluno, de um vínculo **pausado ou encerrado** ou de outro aluno respondem de forma indistinguível, `404 EXERCISE_NOT_FOUND`: com o vínculo pausado ou encerrado o vídeo **não chega** ao aluno de jeito nenhum — **nenhuma URL de vídeo, poster, miniatura ou quadro**; o `404` só carrega o problema (decisão do dono de 2026-10-04, reforçada pela decisão do dono de 09/10, registrada na pliora-docs, PR em aberto). O histórico do que ele executou continua nas leituras de treino feito. A operação aceita só o `exerciseId` que o aluno recebeu no treino: não aceita `catalogRef`, texto nem filtro, e não é um meio de navegar no catálogo. Nenhum identificador, nome ou registro da origem atravessa a resposta; só a URL de entrega. **`media` vazio** é resposta válida: a origem não lista vídeo para o exercício, ou já não o conhece, ou o exercício é **próprio do personal** — cujo vídeo chega pelo manifesto de mídia do bundle da sessão (`ADR-0015`) e não por esta leitura. Esses casos não consomem cota. **Quando chamar.** Só no toque em reproduzir (`DOC-PRESCRIPTION-AUTHORING-TECH` §2.5): nunca ao abrir o treino ou a tela do exercício, nunca em pré-carga, nunca em laço. Repetir o vídeo usa o buffer do player; uma `url` vencida pede nova leitura. O app chama esta operação para um exercício cuja variante não tem asset `DEMONSTRATION` disponível no manifesto do bundle. **Cota.** Cada leitura que entrega vídeo do catálogo consome a cota mensal da origem e conta no limite de leituras por conta. Excedido esse limite, ou esgotada a cota, a resposta é `503 EXERCISE_CATALOG_UNAVAILABLE` com `reason: QUOTA_EXHAUSTED` e, quando houver, `Retry-After`; a origem fora do ar é `reason: SOURCE_UNAVAILABLE`. Nos dois casos o app mostra \"vídeo indisponível agora\" e **o treino segue**: nenhum estado da sessão depende desta leitura. Online-only: nenhum `commandType` de sync a transporta, o bundle não a inclui, e a resposta é `private, no-store`. `Content-Language` é o locale negociado: o corpo não tem texto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let exerciseId = "exerciseId_example" // String | Exercício como o aluno o recebe no treino (o `exerciseId` do item `EXERCISE` do bundle). Malformado, inexistente ou não recebido respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter a demonstração em vídeo de um exercício do catálogo prescrito ao aluno
StudentTrainingAPI.getStudentExerciseDemonstration(exerciseId: exerciseId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **exerciseId** | **String** | Exercício como o aluno o recebe no treino (o &#x60;exerciseId&#x60; do item &#x60;EXERCISE&#x60; do bundle). Malformado, inexistente ou não recebido respondem de forma indistinguível. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentExerciseDemonstrationView**](StudentExerciseDemonstrationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentExerciseProgress**
```swift
    open class func getStudentExerciseProgress(exerciseId: String, acceptLanguage: String? = nil, variantId: String? = nil, equipmentContextKey: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: StudentExerciseProgressView?, _ error: Error?) -> Void)
```

Ler a evolução de um exercício numa variante

A evolução do exercício na variante pedida, para a tela de evolução (o mesmo conteúdo da Tela A da sessão, fora dela): as execuções por data, do mais recente ao mais antigo, e os recordes da variante. Cada execução é uma sessão, com as séries **executadas** nela — tipo, repetições ou duração, carga e unidade, exatamente como foram gravadas; a série pulada não aparece. **Um par de variante e contexto por leitura.** A chave de comparabilidade é o par `variantId` mais `equipmentContextKey`. `variantId` ausente resolve o **par inteiro** — variante e contexto — de execução mais recente, e a resposta diz qual leu em `variant`. **Desempate do par mais recente:** vence o de `lastExecutedOn` mais recente; com a mesma data, o de `startedAt` mais recente na última sessão do par; depois decide o `variantId` e, por fim, o contexto, ambos em ordem decrescente, com o par sem contexto depois de todo par com contexto. O desempate só torna a escolha determinística e não expressa desempenho. Com `variantId`, `equipmentContextKey` fecha o par e, ausente, não é curinga: lê o par sem contexto. `equipmentContextKey` sem `variantId` é `422 VALIDATION_FAILED`. **Nenhuma leitura soma, compara ou ordena variantes diferentes**: a lista de execuções e os recordes são só da variante lida, e a resposta não traz total, média, tendência nem veredicto de melhor execução. **Unidade gravada, sem conversão.** Cada série traz o valor e a unidade em que foi gravada (`KG`, `LB`, `LEVEL` ou `BODYWEIGHT`), e o servidor **não converte nem compara por massa**: a mesma variante em `KG` e em `LB` são séries separadas por unidade gravada. A preferência kg/lb do aluno é só de exibição, não existe no contrato e não aparece em nenhum parâmetro; quem converte, só para exibir, é o app. **Recordes da variante** (`records`) são projeção com `origin: PROJECTION`, sobre as séries elegíveis da variante — `WORKING` e `TO_FAILURE`, tratadas juntas; `WARM_UP`, `DROP_SET` e a série pulada ficam fora —, o melhor de cada critério e de cada unidade gravada, e são devolvidos inteiros em toda página, não só pelas sessões dela. `BODYWEIGHT` só produz `MAX_REPS_AT_LOAD` e `MAX_DURATION`, nunca `MAX_LOAD`; `LEVEL` produz `MAX_LOAD` na unidade `LEVEL`, nunca convertido nem somado a kg. **Página de até 20 sessões**, por cursor opaco: `limit` de 1 a 20, padrão 20, e `nextCursor` nulo na última página. **Recurso de outra conta responde como inexistente.** Exercício que o aluno nunca executou, de outra conta, ou **par** que não é um par executado dele para este exercício — variante que ele não executou desse exercício, ou `variantId` executado com um `equipmentContextKey`, presente ou ausente, que não fecha com ela um par executado — respondem o mesmo `404 EXERCISE_PROGRESS_NOT_FOUND`, de forma indistinguível. Autoriza pela conta dona dos fatos, e não pelo vínculo; o `403` só responde a conta sem o contexto de aluno (`FORBIDDEN`). Nada desta leitura é publicado ao personal, e ela não devolve texto livre nem relato de desconforto. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let exerciseId = "exerciseId_example" // String | O exercício, como `listStudentExerciseProgress` o devolve. Um exercício que o aluno não executou é inexistente para ele.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let variantId = "variantId_example" // String | A variante a ler. Ausente, resolve o par inteiro — variante e contexto — de execução mais recente do exercício, e então `equipmentContextKey` não pode vir. (optional)
let equipmentContextKey = "equipmentContextKey_example" // String | O contexto de equipamento da variante, exatamente como `variants[]` de `listStudentExerciseProgress` o devolve. Código de máquina estável, nunca nome de aparelho exibível. Só vale com `variantId`: sem ele é `422 VALIDATION_FAILED`. Ausente, com `variantId`, lê o par sem contexto — não é curinga —, e o par que não foi executado é `404 EXERCISE_PROGRESS_NOT_FOUND`. (optional)
let cursor = "cursor_example" // String | Cursor opaco retornado por uma coleção paginada. (optional)
let limit = 987 // Int | Quantidade de sessões da página, de 1 a 20; o padrão é 20. (optional) (default to 20)

// Ler a evolução de um exercício numa variante
StudentTrainingAPI.getStudentExerciseProgress(exerciseId: exerciseId, acceptLanguage: acceptLanguage, variantId: variantId, equipmentContextKey: equipmentContextKey, cursor: cursor, limit: limit) { (response, error) in
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
 **exerciseId** | **String** | O exercício, como &#x60;listStudentExerciseProgress&#x60; o devolve. Um exercício que o aluno não executou é inexistente para ele. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **variantId** | **String** | A variante a ler. Ausente, resolve o par inteiro — variante e contexto — de execução mais recente do exercício, e então &#x60;equipmentContextKey&#x60; não pode vir. | [optional]
 **equipmentContextKey** | **String** | O contexto de equipamento da variante, exatamente como &#x60;variants[]&#x60; de &#x60;listStudentExerciseProgress&#x60; o devolve. Código de máquina estável, nunca nome de aparelho exibível. Só vale com &#x60;variantId&#x60;: sem ele é &#x60;422 VALIDATION_FAILED&#x60;. Ausente, com &#x60;variantId&#x60;, lê o par sem contexto — não é curinga —, e o par que não foi executado é &#x60;404 EXERCISE_PROGRESS_NOT_FOUND&#x60;. | [optional]
 **cursor** | **String** | Cursor opaco retornado por uma coleção paginada. | [optional]
 **limit** | **Int** | Quantidade de sessões da página, de 1 a 20; o padrão é 20. | [optional] [default to 20]

### Return type

[**StudentExerciseProgressView**](StudentExerciseProgressView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentNotificationConsent**
```swift
    open class func getStudentNotificationConsent(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentNotificationConsentView?, _ error: Error?) -> Void)
```

Ler o consentimento de notificações vigente do aluno

Leitura mínima do consentimento `SEND_NOTIFICATIONS` **vigente** da conta do aluno (decisão do dono de 2026-10-05, `DEC-ALUNO-7` de `DOC-STUDENT-WORKOUT` §2.1; desenho em `DOC-STUDENT-WORKOUT-TECH` §7.3.1, `pliora-contracts#271`). O app a lê para saber se pode agendar o lembrete de treino e o aviso de treino parado (`ADR-0016` §6); o aparelho não guarda nem espelha a resposta. Responde **só** a decisão sobre `SEND_NOTIFICATIONS` gravada no aceite da **relação atual** da conta, com o enum já publicado `StudentConsentDecision`. A relação atual é a `ACTIVE`; sem ela, a `PAUSED` pausada mais recentemente; relação encerrada nunca responde. **Vigente se e só se `decision` é `GRANTED`.** `decision` **ausente** significa que a relação atual não tem decisão gravada para o termo, e vale como **não vigente**, com o mesmo efeito de `DECLINED`; o servidor não preenche o campo com `DECLINED`, porque nenhuma recusa foi gravada. A resposta não traz o tipo do termo, a versão do texto, data, autoria, identidade da relação, texto jurídico, os outros termos nem dado de terceiros, e a leitura não compara a versão gravada com a versão corrente do catálogo. **Não cria nem altera nada.** Não grava consentimento novo, não toca nos termos jurídicos, não desbloqueia `saveStudentOnboardingConsents` e não muda o formato dos consentimentos do aceite. Só a própria conta lê: a operação não aceita identidade de aluno, e nenhuma leitura do personal transporta esta decisão. **Vínculo.** Vínculo ativo ou pausado responde `200`: a pausa não muda o consentimento, e o lembrete já fica suspenso pela leitura do plano. Vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`, como `getStudentTodayRelationship`: não há relação atual, e o lembrete fica **suspenso**. Identidade sem o contexto de aluno responde `403 FORBIDDEN`. Nenhum dos dois `403` confirma existência de aluno, personal ou relação. Os apps leem esta operação ao entrar na tela do lembrete e na seção de avisos, e no máximo uma vez por abertura do app para reconciliar; a resposta fica só em memória. Se a leitura falha, nada do que já está agendado muda e nada novo é agendado. A resposta declara `Cache-Control: private, no-store` e não tem `ETag`, porque nenhuma escrita a usa. `Content-Language` é o locale negociado: o corpo não tem texto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o consentimento de notificações vigente do aluno
StudentTrainingAPI.getStudentNotificationConsent(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentNotificationConsentView**](StudentNotificationConsentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentOfflineWorkoutBundle**
```swift
    open class func getStudentOfflineWorkoutBundle(sessionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: OfflineWorkoutBundle?, _ error: Error?) -> Void)
```

Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor

Composição da sessão **no momento da leitura**, reautorizada a cada leitura. Além do recorte da prescrição imutável fixada no início — assignment, versão, exercícios, séries, variantes, alternativas autorizadas, histórico comparável e manifesto de mídia —, o bundle inclui **todos os fatos de execução já aceitos pelo servidor** que a retomada precisa, dos tipos `EXERCISE_EXECUTION`, `SET_EXECUTION`, `SET_AMENDMENT`, `REST_PERIOD`, `SUBSTITUTION` e `DEFERRAL`. Cada `SET_EXECUTION` traz os valores em vigor depois das emendas, e a sua `revision` é a mesma que `getStudentSetExecution` publica e que `If-Match` exige. Cada `DEFERRAL`, aberto ou terminal, traz o `deferralId` que a retomada do exercício e a declaração de pendências no encerramento exigem. `DISCOMFORT_REPORT` **nunca** entra no bundle: o relato de desconforto é dado de saúde, dado de saúde não fica armazenado no aparelho, e ele não é necessário para retomar a execução. A única leitura do relato para o aluno é `getStudentWorkoutSessionResult`, que devolve só a região e a intensidade e nunca o texto livre; é uma rota própria, nunca este bundle. **Com a capacidade `offline-sync` desligada, esta é a leitura autoritativa para retomar uma sessão `IN_PROGRESS`** — depois de relançar o app, de o processo morrer ou a partir de outro aparelho. O cliente exibe o progresso a partir dela, nunca do armazenamento local. `bundleRevision` é opaco e comparado somente por igualdade: muda **sempre** que qualquer item incluído muda, inclusive um fato de execução ou o estado da sessão, e o mesmo conteúdo produz a mesma `bundleRevision`. `generatedAt` é informativo: duas leituras com a mesma `bundleRevision` podem trazer `generatedAt` diferentes, e o cliente não trata isso como conflito. O cliente persiste os `items` pela mesma identidade `entityType/entityId` usada no delta. Nenhum binário de mídia, estado de rede ou command local atravessa a resposta. O manifesto de mídia traz só o vídeo próprio do personal (`ADR-0015`). A demonstração de um exercício do **catálogo** nunca entra no bundle — a URL dela é de curta duração e cada uma consome cota da origem —: o app a pede em `getStudentExerciseDemonstration`, no toque em reproduzir. **Histórico comparável.** O bundle inclui um item `READ_MODEL_EXERCISE_HISTORY` (`ExerciseHistorySyncView`) por **variante prescrita** do treino da sessão e por **variante de alternativa autorizada**, com **até 3 entradas** cada um: é o que a série mostra como \"última vez\". É projeção (`origin: PROJECTION`, com `asOf`) na chave exercício + variante + contexto de equipamento, e a variante que não tem execução comparável **também** tem o seu item, com `comparisonStatus` explícito e `entries` vazio — a ausência nunca é zero. **Unidade divergente nunca é convertida**: cada entrada traz a carga na unidade em que foi registrada, e a conversão de exibição é do app. O histórico completo, por data, não é deste bundle. **Esforço prescrito.** Cada série prescrita (`PrescribedSetSyncView`) traz `effortType` (`RPE` ou `RIR`) e `effortValue` quando o personal prescreveu esforço para ela, e nenhum dos dois quando não prescreveu. O app mostra o prescrito como o personal o escreveu — `RPE 8` ou `2 repetições em reserva` — e **nunca o converte** no RPE declarado pelo aluno (`actual.rpe`) nem em `expectedRpe`.

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

Projeção de leitura da tela \"Programação semanal\" do Lote 2. Devolve, para cada data civil do intervalo pedido, o que foi prescrito e o que já é fato registrado, sem reescrever histórico: um dia passado reflete o que foi registrado naquele dia e não é recalculado por uma prescrição publicada depois. Isto é **programação de treino, não agenda operacional**: não há horário, compromisso, slot, lembrete, reserva ou notificação — agenda é capacidade explicitamente excluída do MVP. A resposta é densa: há exatamente uma entrada por data civil entre `from` e `to`, inclusive, em ordem crescente. Um dia sem treino prescrito aparece como `REST_DAY`, nunca como buraco na lista. O servidor é a autoridade da data civil, do timezone efetivo e da noção de \"hoje\": `RECOMMENDED_TODAY` é a decisão de Smart Workout Scheduling, que o cliente não recalcula. **Plano em sequência livre.** Com `planMode: SEQUENCE` o plano não tem dia: nenhum dia futuro é `SCHEDULED` e o dia sem sessão é `REST_DAY` só no sentido de \"sem treino prescrito para a data\" — o app **não** o apresenta como descanso prescrito nem como atraso, e leva ao plano em sequência. O cliente decide pelo `planMode` **antes** de desenhar `REST_DAY`: com `SEQUENCE` ele não o desenha como descanso. O dia em que o aluno iniciou um treino da sequência é o dia daquele treino, com o estado do fato. `planMode` só existe a partir de `startDate` da ativação: antes dele a semana segue as atribuições que já existem. **Dia passado.** Com treino atribuído e **sem sessão** iniciada, o dia é `PENDING`; com sessão iniciada e não concluída, `INCOMPLETE`. **Vínculo pausado** responde `200` com `planState: TRAINING_PAUSED`, sem `planMode` e com `days` vazio: durante a pausa a programação não mostra treino, e a resposta não diz motivo, autoria nem data. Vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`.

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

Projeção independente da saudação. Permite reservar e atualizar o cabeçalho sem depender dos cards de treino, última sessão ou vínculo. A data civil e o timezone são autoridade do servidor; o cliente não recalcula \"hoje\". `greeting` é a saudação do **período do dia no fuso do vínculo** — `Bom dia`, `Boa tarde` ou `Boa noite` —, **sem pontuação**, e `displayName` é o nome que o próprio aluno informou no perfil, ou nulo enquanto ele não informou; o cliente compõe a linha com os dois como componentes separados. Vínculo pausado responde `200` como o ativo. Vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`, sem confirmar aluno, personal ou prescrição. A resposta declara `Cache-Control: private, no-store`: nenhuma leitura da tela Hoje é servida de cache HTTP como leitura corrente.

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

Projeção independente do último treino feito: a **última sessão concluída antes de hoje** — a sessão concluída hoje é do cartão do treino. É leitura de treino feito: exige só que a conta seja a dona dos fatos, responde **sem vínculo** ativo — com o vínculo pausado, encerrado ou depois de trocar de personal — e procura **por conta, em qualquer relação**: quem trocou de personal vê o último treino que fez com o anterior. `EMPTY` representa ausência legítima; falha de transporte continua sendo erro e nunca é convertida em vazio. O `403` só responde a conta sem o contexto de aluno (`FORBIDDEN`): esta leitura nunca responde `RELATIONSHIP_INACTIVE`. A resposta declara `Cache-Control: private, no-store`.

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
    open class func getStudentTodayRelationship(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentTodayCardRelationshipView?, _ error: Error?) -> Void)
```

Obter o card independente do vínculo do aluno

Projeção independente do vínculo exibido em Hoje. Vínculo ativo responde `ACTIVE`; vínculo **pausado** responde `200` com `PAUSED` e o mesmo personal — a pausa suspende o treino, não quem acompanha o aluno —, sem motivo, autoria nem data da pausa. Vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`, sem confirmar identidades. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o card independente do vínculo do aluno
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

[**StudentTodayCardRelationshipView**](StudentTodayCardRelationshipView.md)

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

Projeção independente do card principal. `status` é a única autoridade do estado; o cliente não o infere da presença do treino ou da sessão aberta, e não combina esta leitura com outra para inventar estado. **Os oito estados.** `AWAITING_FIRST_PLAN`: vínculo ativo e **nenhuma ativação jamais** nesta relação — publicar uma versão sem ativá-la não sai daqui, e a troca de personal cria relação nova, que começa aqui. `PLAN_NOT_STARTED`: nenhuma ativação vigente hoje, uma ativação com início posterior a hoje (`planStartsOn`) e nenhuma atribuição avulsa para hoje; a ativação vigente — mesmo em dia sem treino — sempre vence a futura. `NO_WORKOUT_ASSIGNED`: já houve ativação nesta relação e nenhuma está vigente nem por começar, ou a sequência vigente não tem treino. `REST_DAY`: ativação por dias da semana vigente e hoje sem treino. `WORKOUT_AVAILABLE`, `SESSION_IN_PROGRESS` e `WORKOUT_COMPLETED`: o treino de hoje a iniciar, com sessão aberta e concluído. `TRAINING_PAUSED`: vínculo pausado, sem treino, motivo, autoria nem data da pausa. Nenhum estado diz que o dia já foi usado: a sessão descartada não ocupa o dia. **Sessão aberta.** Com sessão aberta o estado é `SESSION_IN_PROGRESS`, esteja ela em andamento ou interrompida; quem diz qual das duas é `openSession.status` (`IN_PROGRESS` ou `INTERRUPTED`), com as séries feitas, as previstas e o último registro. Em andamento e com um descanso correndo, a sessão aberta traz o início dele (`restStartedAt`) e, havendo descanso prescrito, o alvo (`restDurationSeconds`), derivados pelo servidor dos fatos já registrados, para a barra de treino em andamento; ausentes, não há linha de descanso. **Primeiro treino.** `firstWorkout` é decidido pelo servidor: `true` se e somente se a conta nunca concluiu sessão alguma, em nenhuma relação, e só com `WORKOUT_AVAILABLE`; em qualquer outro estado é `false`. O cliente não o deriva de outra leitura. **Próximo treino.** `nextScheduledWorkout` é a próxima data, depois de hoje, com treino na ativação por dias da semana vigente, entre as atribuições já materializadas; existe só em `REST_DAY` e `WORKOUT_COMPLETED`, e é ausente em sequência livre, sem ativação e quando não há próxima. **Plano em sequência livre.** Quando a ativação vigente do aluno é `SEQUENCE`, a resposta traz `sequencePlan`: o plano, os treinos dele em ordem, o próximo e, em cada treino, o dia civil em que o aluno o concluiu pela última vez. O cartão do dia é então o **próximo treino** — o seguinte, em ordem circular, ao último treino do plano que o aluno concluiu, ou o primeiro quando ainda não concluiu nenhum — e o estado nunca é `REST_DAY`: a sequência não tem dia certo. Com treino do dia já iniciado ou concluído, `prescribedWorkout` é esse treino, `status` é `SESSION_IN_PROGRESS` ou `WORKOUT_COMPLETED`, e `sequencePlan.nextWorkoutId` segue apontando o próximo: **um treino concluído por dia**, como nos dias da semana. A sessão **abandonada** hoje não ocupa o dia: sem sessão aberta nem concluída hoje, o cartão continua `WORKOUT_AVAILABLE` com o próximo treino, e o início é aceito. A validade da ativação **não aparece ao aluno**: nem `endDate`, nem `validity`, nem dias para vencer; um plano vencido continua servindo treinos, e vencer é assunto do personal. Sem treino algum na sequência o estado é `NO_WORKOUT_ASSIGNED` e `sequencePlan` vem com `workouts` vazio, sem `nextWorkoutId`. Vínculo pausado ou encerrado encerra a ativação: com o vínculo pausado a leitura responde `200` com `TRAINING_PAUSED`, e com o vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`, sem expor o motivo administrativo. **A ativação só serve a partir de `startDate`.** Antes desse dia civil — por exemplo a ativação criada hoje com início daqui a quatro dias — o cartão, a semana e o início de sessão seguem as atribuições que já existem, e `sequencePlan` **não aparece**: ele existe só a partir do início de uma ativação `SEQUENCE`. Sem ativação vigente e sem atribuição para hoje, o estado é `PLAN_NOT_STARTED`, com o dia do início em `planStartsOn`. Com treino do dia ocupado por uma atribuição à mão, o cartão é o dele, e a regra de uma atribuição por data vale para a sequência como para os dias da semana. A resposta declara `Cache-Control: private, no-store`.

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

# **getStudentWorkoutSessionResult**
```swift
    open class func getStudentWorkoutSessionResult(sessionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentWorkoutSessionResultView?, _ error: Error?) -> Void)
```

Ler o resultado de uma sessão de treino terminada

O resumo do treino feito: o que foi feito, como fato, e os recordes da sessão. O app o abre ao terminar, depois da nota de esforço, e o reabre depois pelo cartão de Hoje (**Ver resumo** e a linha do último treino) e pelo histórico. **Só existe para sessão terminada.** `COMPLETED` e `ABANDONED` têm resultado, qualquer que seja `endedBy`: o treino concluído, o descartado, o encerrado automaticamente e o encerrado pela pausa ou pelo encerramento do vínculo. Sessão aberta — `IN_PROGRESS` ou `INTERRUPTED` — é `409 SESSION_NOT_ENDED`: ainda não há resultado a ler. Sessão que não existe ou que é de outra conta é `404 SESSION_NOT_FOUND`, de forma indistinguível. **Derivado dos fatos e da versão fixada na sessão.** O resultado é calculado dos fatos da sessão e do recorte da prescrição que a originou: não muda quando o personal publica outra versão, e os recordes de uma sessão terminada não mudam mais. Prescrito, alvo e executado de cada série permanecem três fatos separados. Todo dado ausente é ausente, nunca zero. **Leitura de treino feito.** Autoriza pela conta dona dos fatos, e não pelo vínculo: responde com o vínculo pausado, encerrado ou trocado, como a linha do último treino de Hoje, que abre esta leitura. O `403` só responde a conta sem o contexto de aluno (`FORBIDDEN`). **Do resumo à evolução.** Cada exercício traz `exerciseId`, a mesma identidade que `getStudentExerciseProgress` recebe no caminho, para o resumo abrir a evolução do exercício; a evolução autoriza do mesmo modo, só pela conta dona dos fatos. **O que o resultado nunca traz.** Nenhum campo de carga máxima estimada, de percentual de aderência ou de escore: o volume é fato da sessão, e a nota de esforço é a declaração do aluno, sem interpretação. Do desconforto só a região e a intensidade; o texto livre do relato nunca é devolvido por esta leitura. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado, com a mesma identidade adotada em `POST /student/workout-sessions`. Existência fora do escopo do ator nunca é revelada: ausência e falta de autorização respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o resultado de uma sessão de treino terminada
StudentTrainingAPI.getStudentWorkoutSessionResult(sessionId: sessionId, acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentWorkoutSessionResultView**](StudentWorkoutSessionResultView.md)

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

Projeção de leitura da tela \"Detalhes do treino\" do Lote 2, consumida antes do início da sessão. Devolve o treino exatamente como o personal o prescreveu, ancorado numa versão publicada e imutável (`prescriptionVersionId`), mais as contagens que a tela exibe: os blocos combinados, e por exercício a variante, o bloco, a observação, a cadência, a técnica e as **séries prescritas**, no mesmo vocabulário do bundle da sessão. Nada aqui é alvo operacional (`ExecutionTarget`): a série prescrita em percentual chega em percentual, e o alvo calculado (`calculatedLoadTargets`) só existe depois do início, na sessão. Por exercício, `lastComparable` é a última execução do aluno na mesma chave comparável, projeção dos fatos (`origin: PROJECTION`), **ausente** quando não há execução comparável — nunca zero. `workoutId` e `prescriptionVersionId` são opacos e não revelam chave interna, ordem ou versão de persistência. Em plano em sequência livre o resumo lê **qualquer treino da sequência vigente**, atribuído ou não a uma data: é o resumo pré-início que a tela do plano abre antes de iniciar, e a atribuição só nasce no início da sessão. Vínculo pausado responde `200` com `planState: TRAINING_PAUSED` e sem treino — a resposta é só o estado; vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let workoutId = "workoutId_example" // String | Identificador público opaco do treino prescrito atribuído ao aluno autenticado ou, em plano em sequência livre, pertencente à sequência vigente dele.
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
 **workoutId** | **String** | Identificador público opaco do treino prescrito atribuído ao aluno autenticado ou, em plano em sequência livre, pertencente à sequência vigente dele. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSummaryView**](WorkoutSummaryView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStudentExerciseProgress**
```swift
    open class func listStudentExerciseProgress(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: StudentExerciseProgressPage?, _ error: Error?) -> Void)
```

Listar os exercícios que o aluno já executou

A lista de exercícios da aba Progresso: um item por exercício que o aluno já executou, com o rótulo mais recente que uma prescrição deu a ele (`displayName`) e, por variante executada, a data da última execução e quantas execuções houve. Cada item abre `getStudentExerciseProgress`. Lista vazia é \"nenhum exercício registrado ainda\" — nunca erro, nunca indisponibilidade. **Variante e contexto são a chave.** A chave de comparabilidade é a variante executada mais o contexto de equipamento, e cada par `variantId` e `equipmentContextKey` é um item de `variants[]`. `executionCount` conta as sessões em que o par teve ao menos uma série executada, e `lastExecutedOn` é a data civil (`localDate`) da mais recente. Variantes diferentes nunca são somadas, comparadas nem ordenadas por desempenho: nenhuma leitura soma, compara ou ordena variantes diferentes, e esta não traz carga, repetição nem recorde. **Paginação por cursor opaco**, `limit` de 1 a 100, padrão 20, `nextCursor` nulo na última página. A ordem é do servidor, estável entre páginas, da execução mais recente à mais antiga; ela não expressa desempenho. **Leitura de treino feito.** Autoriza pela conta dona dos fatos, e não pelo vínculo: responde com o vínculo pausado, encerrado ou trocado. O `403` só responde a conta sem o contexto de aluno (`FORBIDDEN`). Nada desta leitura é publicado ao personal. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco retornado por uma coleção paginada. (optional)
let limit = 987 // Int | Tamanho da página, de 1 a 100; o padrão é 20. (optional) (default to 20)

// Listar os exercícios que o aluno já executou
StudentTrainingAPI.listStudentExerciseProgress(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **cursor** | **String** | Cursor opaco retornado por uma coleção paginada. | [optional]
 **limit** | **Int** | Tamanho da página, de 1 a 100; o padrão é 20. | [optional] [default to 20]

### Return type

[**StudentExerciseProgressPage**](StudentExerciseProgressPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStudentWorkoutSessions**
```swift
    open class func listStudentWorkoutSessions(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, from: Date? = nil, to: Date? = nil, completion: @escaping (_ data: StudentWorkoutSessionHistoryPage?, _ error: Error?) -> Void)
```

Ler o histórico de treinos feitos do aluno

O histórico do aluno: os treinos que ele terminou, do mais recente ao mais antigo, para a aba Progresso (os treinos e os recordes recentes) e para o calendário do histórico. **Entram** as sessões `COMPLETED` e `ABANDONED` com ao menos uma série executada — o treino concluído, o encerrado automaticamente, o encerrado pelo servidor por pausa, encerramento ou troca de vínculo e o descartado com série feita, este com `status: ABANDONED`. **Não entram** a sessão aberta (`IN_PROGRESS` ou `INTERRUPTED`) nem a terminada sem nenhuma série executada. A ordem é a do início da sessão (`startedAt`), do mais recente ao mais antigo, e é total: o empate é desfeito pelo `sessionId`, decrescente. **Dois modos, que não se misturam.** Sem `from` e `to`, a leitura pagina por cursor opaco: `limit` de 1 a 50, padrão 20, e `nextCursor` nulo na última página. Com `from` e `to` — datas civis, que vêm juntas —, ela devolve **todas** as sessões do intervalo, sem cursor: é o calendário do histórico (`Q-19`, decisão do owner), **um mês por leitura**, e a tela deriva dos itens os dias marcados e a lista do mês. Não há leitura própria de dias do mês. O intervalo tem no máximo 62 dias entre `from` e `to`, os dois extremos incluídos nos itens: `to` menos `from` é de no máximo 62 dias, isto é, até 63 dias de calendário; acima disso é `422 HISTORY_RANGE_TOO_LARGE`. Também é `422 VALIDATION_FAILED` `to` anterior a `from`, só um dos dois, ou `cursor` ou `limit` junto de `from` e `to`. **O filtro compara com a data civil gravada na sessão.** `from` e `to` (os dois extremos entram) comparam com `localDate`, fixada no início da sessão, e **não** com o fuso do vínculo atual: a sessão não muda de dia porque o aluno trocou de personal ou de fuso. Um dia pode ter mais de uma sessão, e cada uma é um item; a marca do dia é decisão da tela. **`firstSessionOn`** é a data civil da primeira sessão do aluno que entra neste histórico, em qualquer dos dois modos e sem depender de `from`, `to` nem do cursor. Serve de limite inferior da navegação de mês. **Nulo** quer dizer que o aluno nunca terminou um treino com série executada: é o estado de quem nunca treinou, e não um erro nem um zero. **Leitura de treino feito.** Autoriza pela conta dona dos fatos, e não pelo vínculo: responde com o vínculo pausado, encerrado ou trocado, e a troca de personal não apaga nem esconde o passado do aluno. O histórico é só o da conta autenticada: não existe parâmetro que aponte outra conta, e o `403` só responde a conta sem o contexto de aluno (`FORBIDDEN`). **O que o item nunca traz.** Do treino, a linha do histórico e os recordes recentes: o nome, o dia, a duração, as séries feitas de previstas, os recordes resumidos. Não traz volume, nota de esforço, relato de desconforto nem texto livre; nenhum percentual de aderência, escore, sequência de dias ou marca de falta. O resultado completo de cada sessão é `getStudentWorkoutSessionResult`. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco retornado por uma coleção paginada. (optional)
let limit = 987 // Int | Tamanho da página no modo por cursor, de 1 a 50; o padrão é 20. Não se combina com `from` e `to`. (optional) (default to 20)
let from = Date() // Date | Início do intervalo do calendário, data civil (inclusive), comparada com o `localDate` gravado na sessão. Vem junto de `to`. (optional)
let to = Date() // Date | Fim do intervalo do calendário, data civil (inclusive), comparada com o `localDate` gravado na sessão. Vem junto de `from`, não antes dele e a no máximo 62 dias dele. (optional)

// Ler o histórico de treinos feitos do aluno
StudentTrainingAPI.listStudentWorkoutSessions(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit, from: from, to: to) { (response, error) in
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
 **cursor** | **String** | Cursor opaco retornado por uma coleção paginada. | [optional]
 **limit** | **Int** | Tamanho da página no modo por cursor, de 1 a 50; o padrão é 20. Não se combina com &#x60;from&#x60; e &#x60;to&#x60;. | [optional] [default to 20]
 **from** | **Date** | Início do intervalo do calendário, data civil (inclusive), comparada com o &#x60;localDate&#x60; gravado na sessão. Vem junto de &#x60;to&#x60;. | [optional]
 **to** | **Date** | Fim do intervalo do calendário, data civil (inclusive), comparada com o &#x60;localDate&#x60; gravado na sessão. Vem junto de &#x60;from&#x60;, não antes dele e a no máximo 62 dias dele. | [optional]

### Return type

[**StudentWorkoutSessionHistoryPage**](StudentWorkoutSessionHistoryPage.md)

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

Command do CTA \"Iniciar treino\" do Lote 2, presente tanto na Home quanto na tela de detalhes do treino. **A identidade da sessão é criada pelo cliente.** `sessionId` é gerado no device e enviado no corpo, e o servidor **adota** a identidade recebida em vez de emitir outra — a mesma identidade vale em qualquer transporte. **A confirmação é o commit no backend**: enquanto a capacidade `offline-sync` estiver desligada, a sessão só existe depois desta resposta; sem rede a operação é bloqueada e o erro é dito como erro de rede, nunca como sucesso adiado. A operação é idempotente pela identidade da sessão: reenviar o mesmo `sessionId` com o mesmo corpo devolve a sessão original sem criar outra. O mesmo `sessionId` com corpo diferente é conflito explícito (`SESSION_IDENTITY_DIVERGENT`), nunca sobrescrita silenciosa. A `Idempotency-Key` é obrigatória e validada — ausente, em branco ou acima do limite é `422 VALIDATION_FAILED` —, mas não decide o replay: quem decide é o `sessionId`. O aluno tem no máximo uma sessão aberta: iniciar com outra aberta é `409 SESSION_ALREADY_EXISTS`, que carrega o `sessionId` canônico da aberta para o app levar à retomada em vez de criar outra. A sessão fixa `prescriptionVersionId` no início e essa versão permanece imutável: publicar uma nova versão da prescrição depois não altera a sessão em andamento. **Instantes.** O instante da sessão é o do servidor: o `startedAt` da resposta é o instante em que o servidor confirmou o início, e o dia civil da sessão sai dele, no fuso do vínculo. O `startedAt` do pedido é o instante declarado pelo aparelho: é aceito, recusado com `CLOCK_SKEW` quando está à frente do relógio do servidor além da tolerância, e guardado para auditoria, nunca usado para ordenar sessões nem para decidir o dia. **Vínculo.** Com o vínculo pausado o início responde `403 RELATIONSHIP_PAUSED`; com o vínculo encerrado ou inexistente, `403 RELATIONSHIP_INACTIVE`. Esta resposta de início não devolve execução: série, carga, repetição, alvo operacional, descanso, orquestração e encerramento têm caminho HTTP próprio e autoritativo, publicado sob a tag `Workout Execution`. **Plano em sequência livre.** Em ativação `SEQUENCE` não há atribuição antecipada: `workoutId` é **qualquer** treino da sequência — o próximo ou outro, o aluno escolhe —, `prescriptionVersionId` é a versão da ativação, e a atribuição daquela data civil é materializada pelo servidor **neste início**, no fuso do vínculo. A regra de uma atribuição por data permanece, e vale **um treino concluído por dia**: `409 DAILY_WORKOUT_ALREADY_ASSIGNED` só acontece quando a atribuição do dia tem sessão **aberta ou concluída**, ou quando é a atribuição que o personal fez à mão para **outro** treino naquela data, que **também** bloqueia o início da sequência naquele dia; o app leva à retomada ou mostra que o próximo treino fica para amanhã. A sessão **abandonada** hoje **não ocupa o dia**: sem sessão aberta nem concluída hoje, iniciar o mesmo treino ou outro da sequência é aceito, e a atribuição daquele dia passa a ser a do treino escolhido. A ativação só serve a partir de `startDate`: antes dele não há treino de sequência a iniciar, e o início de um treino que só a sequência nomearia é o mesmo `404`. Treino fora da sequência, ativação encerrada ou de outro aluno respondem o mesmo `404`, sem distinguir. O início registra qual treino foi iniciado, mas a fila continua a partir do último treino **concluído**: iniciar e abandonar não a move.

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
