# StudentTrainingAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStudentConsistency**](StudentTrainingAPI.md#getstudentconsistency) | **GET** /student/progress/consistency | Ler a consistência semanal do aluno
[**getStudentExerciseDemonstration**](StudentTrainingAPI.md#getstudentexercisedemonstration) | **GET** /student/exercises/{exerciseId}/demonstration | Obter a demonstração de um exercício do catálogo prescrito ao aluno
[**getStudentExerciseProgress**](StudentTrainingAPI.md#getstudentexerciseprogress) | **GET** /student/exercise-progress/{exerciseId} | Ler a evolução de um exercício numa variante
[**getStudentNotificationConsent**](StudentTrainingAPI.md#getstudentnotificationconsent) | **GET** /student/notification-consent | Ler o consentimento de notificações vigente do aluno
[**getStudentOfflineWorkoutBundle**](StudentTrainingAPI.md#getstudentofflineworkoutbundle) | **GET** /student/workout-sessions/{sessionId}/bundle | Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor
[**getStudentSchedule**](StudentTrainingAPI.md#getstudentschedule) | **GET** /student/schedule | Obter a programação de treino do aluno num intervalo de datas
[**getStudentToday**](StudentTrainingAPI.md#getstudenttoday) | **GET** /student/today | Obter o dia de treino do aluno
[**getStudentTodayHeader**](StudentTrainingAPI.md#getstudenttodayheader) | **GET** /student/today/header | Obter o cabeçalho independente da tela Hoje
[**getStudentTodayLastSession**](StudentTrainingAPI.md#getstudenttodaylastsession) | **GET** /student/today/last-session | Obter o card independente da última sessão
[**getStudentTodayRelationship**](StudentTrainingAPI.md#getstudenttodayrelationship) | **GET** /student/today/relationship | Obter o card independente do vínculo do aluno
[**getStudentTodayWorkout**](StudentTrainingAPI.md#getstudenttodayworkout) | **GET** /student/today/workout | Obter o card independente do treino de hoje
[**getStudentWeekArrangement**](StudentTrainingAPI.md#getstudentweekarrangement) | **GET** /student/week-arrangement | Ler o arranjo da semana do aluno
[**getStudentWorkoutSessionResult**](StudentTrainingAPI.md#getstudentworkoutsessionresult) | **GET** /student/workout-sessions/{sessionId}/result | Ler o resultado de uma sessão de treino terminada
[**getStudentWorkoutSummary**](StudentTrainingAPI.md#getstudentworkoutsummary) | **GET** /student/workouts/{workoutId}/summary | Obter o resumo de um treino prescrito do aluno antes de iniciá-lo
[**listStudentExerciseProgress**](StudentTrainingAPI.md#liststudentexerciseprogress) | **GET** /student/exercise-progress | Listar os exercícios que o aluno já executou
[**listStudentWorkoutSessions**](StudentTrainingAPI.md#liststudentworkoutsessions) | **GET** /student/workout-sessions | Ler o histórico de treinos feitos do aluno
[**recordStudentWorkoutSessionRetroactively**](StudentTrainingAPI.md#recordstudentworkoutsessionretroactively) | **POST** /student/workout-sessions/retroactive | Marcar treino como feito depois
[**resetStudentWeekArrangement**](StudentTrainingAPI.md#resetstudentweekarrangement) | **DELETE** /student/week-arrangement | Voltar à sugestão do personal
[**saveStudentWeekArrangement**](StudentTrainingAPI.md#savestudentweekarrangement) | **PUT** /student/week-arrangement | Mover treinos da semana do aluno
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

Obter a demonstração de um exercício do catálogo prescrito ao aluno

A demonstração de um exercício do **catálogo** que está na prescrição do aluno, para a tela do exercício durante a execução (decisão do dono de 2026-10-04, `pliora-contracts#261`). A mídia é resolvida **na hora**, do mesmo registro que o personal lê em `getExerciseCatalogItem` (`ADR-0014` §4): o servidor não guarda o catálogo, nem a URL da origem, nem a mídia. Cada asset traz a mesma identidade `assetId` + `mediaVersion` que o personal vê no detalhe, e `url` é uma capacidade de **curta duração** com `expiresAt`, nunca identidade. **As imagens licenciadas da origem vêm ao lado dos vídeos** (decisão do dono de 2026-11-09, `pliora-contracts#433`): a capa de cada vídeo (`mediaType: IMAGE`, `usage: POSTER`, com o mesmo `angle` e `demonstrator` do vídeo a que pertence) e o mapa corporal do exercício (`usage: BODY_MAP`, emitido por `demonstrator`). A licença autoriza a imagem **só no aparelho, por conta, por até 24 horas e com a marca intacta**: os dois papéis saem com `offlinePolicy: TEMPORARY_CACHE_ALLOWED` e `offlineValidUntil` de no máximo 24 horas da emissão — nunca `STREAM_ONLY`, que proibiria a retenção, nem `OFFLINE_DOWNLOAD_ALLOWED`, que a excederia — e o aparelho as apaga ao vencer, ao sair da conta e quando o vínculo deixa de ser ativo. Vídeo segue `STREAM_ONLY`. Cada requisição à entrega — vídeo ou imagem — conta na mesma cota da origem. **Só para quem recebe o exercício.** Responde apenas ao aluno com vínculo **ativo** cuja prescrição, na **versão publicada em vigor**, contém o exercício — como variante prescrita ou como alternativa autorizada. Um exercício que não existe, que não está na versão em vigor do aluno, de um vínculo **pausado ou encerrado** ou de outro aluno respondem de forma indistinguível, `404 EXERCISE_NOT_FOUND`: com o vínculo pausado ou encerrado o vídeo **não chega** ao aluno de jeito nenhum — **nenhuma URL de vídeo, poster, miniatura ou quadro**; o `404` só carrega o problema (decisão do dono de 2026-10-04, reforçada pela decisão do dono de 09/10, registrada na pliora-docs, PR em aberto). O histórico do que ele executou continua nas leituras de treino feito. A operação aceita só o `exerciseId` que o aluno recebeu no treino: não aceita `catalogRef`, texto nem filtro, e não é um meio de navegar no catálogo. Nenhum identificador, nome ou registro da origem atravessa a resposta; só a URL de entrega. **`media` vazio** é resposta válida: a origem não lista vídeo para o exercício, ou já não o conhece, ou o exercício é **próprio do personal** — cujo vídeo chega pelo manifesto de mídia do bundle da sessão (`ADR-0015`) e não por esta leitura. Esses casos não consomem cota. **Quando chamar.** Só no toque em reproduzir (`DOC-PRESCRIPTION-AUTHORING-TECH` §2.5): nunca ao abrir o treino ou a tela do exercício, nunca em pré-carga, nunca em laço. Repetir o vídeo usa o buffer do player; uma `url` vencida pede nova leitura. O app chama esta operação para um exercício cuja variante não tem asset `DEMONSTRATION` disponível no manifesto do bundle. **Cota.** Cada leitura que entrega vídeo do catálogo consome a cota mensal da origem e conta no limite de leituras por conta. Excedido esse limite, ou esgotada a cota, a resposta é `503 EXERCISE_CATALOG_UNAVAILABLE` com `reason: QUOTA_EXHAUSTED` e, quando houver, `Retry-After`; a origem fora do ar é `reason: SOURCE_UNAVAILABLE`. Nos dois casos o app mostra \"vídeo indisponível agora\" e **o treino segue**: nenhum estado da sessão depende desta leitura. Online-only: nenhum `commandType` de sync a transporta, o bundle não a inclui, e a resposta é `private, no-store`. `Content-Language` é o locale negociado: o corpo não tem texto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let exerciseId = "exerciseId_example" // String | Exercício como o aluno o recebe no treino (o `exerciseId` do item `EXERCISE` do bundle). Malformado, inexistente ou não recebido respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter a demonstração de um exercício do catálogo prescrito ao aluno
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

Projeção de leitura da tela \"Programação semanal\" do Lote 2. Devolve, para cada data civil do intervalo pedido, o que foi prescrito e o que já é fato registrado, sem reescrever histórico: um dia passado reflete o que foi registrado naquele dia e não é recalculado por uma prescrição publicada depois. Isto é **programação de treino, não agenda operacional**: não há horário, compromisso, slot, lembrete, reserva ou notificação — agenda é capacidade explicitamente excluída do MVP. A resposta é densa: há exatamente uma entrada por data civil entre `from` e `to`, inclusive, em ordem crescente. Um dia sem treino prescrito aparece como `REST_DAY` — ou `REST_REQUIRED`, quando é descanso obrigatório em vigor e não há sessão na data —, nunca como buraco na lista. O servidor é a autoridade da data civil, do timezone efetivo e da noção de \"hoje\": `RECOMMENDED_TODAY` é a decisão de Smart Workout Scheduling, que o cliente não recalcula. **Plano em sequência livre.** Com `planMode: SEQUENCE` o plano não tem dia: nenhum dia futuro é `SCHEDULED` e o dia sem sessão é `REST_DAY` só no sentido de \"sem treino prescrito para a data\" — o app **não** o apresenta como descanso prescrito nem como atraso, e leva ao plano em sequência. O cliente decide pelo `planMode` **antes** de desenhar `REST_DAY`: com `SEQUENCE` ele não o desenha como descanso. O dia em que o aluno iniciou um treino da sequência é o dia daquele treino, com o estado do fato. `planMode` só existe a partir de `startDate` da ativação: antes dele a semana segue as atribuições que já existem. **Minha semana** (`DOC-STUDENT-WEEK` §4 e §6.1). Em `WEEKDAYS` o treino de cada dia é o **arranjado** pelo aluno (`getStudentWeekArrangement`): `suggestedWeekdays` mostra a sugestão do personal só onde o dia arranjado difere, `unscheduled` lista os treinos **Sem dia** da semana, e `arrangementRevision` é o `If-Match` para mover. Em `SEQUENCE` a Minha semana não se aplica: `unscheduled` vem vazia e nenhum dia traz `suggestedWeekdays`. **Dia passado.** Com treino atribuído e **sem sessão** iniciada, o dia é `PENDING`; com sessão iniciada e não concluída, `INCOMPLETE`. **Vínculo pausado** responde `200` com `planState: TRAINING_PAUSED`, sem `planMode` e com `days` vazio: durante a pausa a programação não mostra treino, e a resposta não diz motivo, autoria nem data. Vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`.

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

Projeção independente do card principal. `status` é a única autoridade do estado; o cliente não o infere da presença do treino ou da sessão aberta, e não combina esta leitura com outra para inventar estado. **Os dez estados.** `AWAITING_FIRST_PLAN`: vínculo ativo e **nenhuma ativação jamais** nesta relação — publicar uma versão sem ativá-la não sai daqui, e a troca de personal cria relação nova, que começa aqui. `PLAN_NOT_STARTED`: nenhuma ativação vigente hoje, uma ativação com início posterior a hoje (`planStartsOn`) e nenhuma atribuição avulsa para hoje; a ativação vigente — mesmo em dia sem treino — sempre vence a futura. `NO_WORKOUT_ASSIGNED`: já houve ativação nesta relação e nenhuma está vigente nem por começar, ou a sequência vigente não tem treino. `REST_DAY`: ativação por dias da semana vigente e hoje sem treino: hoje não há treino arranjado; `offers` lista o que pode ser iniciado hoje. `WEEK_SLOT_SATISFIED`: ativação por dias da semana vigente e o treino de hoje já foi feito em outro dia desta semana, que satisfez o slot de hoje (`satisfiedOn`, com o treino em `satisfiedWorkout`), sem sessão aberta e sem treino concluído hoje; `offers` lista o que pode ser iniciado hoje. `REST_REQUIRED`: ativação por dias da semana vigente e hoje é dia de descanso obrigatório em vigor, marcado pelo personal (`DOC-STUDENT-WEEK` §5.1): sem treino, sem sessão, sem `offers` e sem próximo treino, e nenhum início é aceito hoje. Fato é fato: com sessão aberta ou concluída hoje o cartão é `SESSION_IN_PROGRESS` ou `WORKOUT_COMPLETED`, e `REST_REQUIRED` é só o dia obrigatório sem sessão. `WORKOUT_AVAILABLE`, `SESSION_IN_PROGRESS` e `WORKOUT_COMPLETED`: o treino de hoje a iniciar, com sessão aberta e concluído. `TRAINING_PAUSED`: vínculo pausado, sem treino, motivo nem data da pausa, e `pausedBy` diz de que lado ela veio (`P4` de `DOC-RELATIONSHIP-LIFECYCLE` §7.4): `STUDENT` liga a variante `C10b` do cartão (`Você pausou o vínculo com seu personal.`, com `Retomar vínculo`); `PERSONAL`, a ausência do campo ou um valor desconhecido mantêm a `Q-18`, sem a palavra pausa. Em plano por dias da semana não existe limite de um treino por dia: o treino concluído não ocupa o dia, e a sessão descartada também não. A sequência livre segue a regra própria, descrita abaixo. **Oferta do dia.** `offers` existe **só** em `REST_DAY`, `WEEK_SLOT_SATISFIED` e `WORKOUT_COMPLETED`, e é ausente nos demais estados — inclusive em `REST_REQUIRED`: é a lista, decidida pelo servidor, do que o aluno pode iniciar hoje — os slots ainda pendentes da semana corrente (segunda a domingo, no fuso do vínculo), sem o de hoje e em ordem de data, cada um com a colocação que o início teria (`ANTICIPATED` para um slot futuro, `POSTPONED` para um slot passado) e a data do slot em `slotDate`; depois, os treinos **Sem dia** da semana, com `UNSCHEDULED` (`LS-7`). Lista vazia é a semana sem slot pendente; em sequência livre não há slot, e a lista vem vazia. O cliente não calcula semana, slot nem casamento. **Pendente para trás** (`DOC-STUDENT-WEEK-TECH` §3.4, `DEC-SEMANA-27`). `pendingBehind` existe **só** em `WORKOUT_AVAILABLE`, com ativação por dias da semana em vigor, e é **ausente** sem gatilho, nos demais estados e **sempre na sequência livre**. Gatilho: há treino pendente cujo dia, nesta semana, já passou, e hoje tem treino arranjado **elegível** — nem atribuído à mão (`LS-16`), nem de vários dias (`LS-10`), nem feito; sem ele, `pendingBehind` é ausente. O cálculo é pelo **arranjo** (o dia efetivo de cada treino), não pelos slots nem por `offers`: por isso, depois do PUT, a releitura do cartão não traz mais `pendingBehind`. O servidor calcula **Empurrar a semana** sobre o arranjo lido: os pendentes de dias passados entram numa fila, em ordem de data, à frente do treino de hoje e dos dias seguintes; a fila ocupa, em ordem, os dias que tinham treino arranjado de hoje em diante — dia empilhado continua empilhado (`LS-12`), dia de descanso livre continua descanso, **dia de descanso obrigatório é pulado** e o dia de um treino atribuído à mão fica fixo (`LS-16`); o treino cujo intervalo mínimo não fecharia no dia vai para Sem dia e a fila segue (`LS-15`); o que não cabe até domingo vai para **Sem dia**. Ficam fora da rotação o treino feito nesta semana, o que já está em Sem dia, o que vale em mais de um dia (`LS-10`) e o atribuído à mão. Sem pendente que caiba hoje, `pendingBehind` é ausente (`LS-11`); o pendente citado é o mais antigo que cabe hoje (`LS-9`). O alcance é sempre `THIS_WEEK` e o arranjo padrão nunca muda. **A proposta só se grava com a confirmação do aluno, pelo `saveStudentWeekArrangement`**: o app envia `If-Match` = `pendingBehind.arrangementRevision`, uma `Idempotency-Key` nova e o corpo `{weekStart, scope, collision, moves}` copiado de `pendingBehind.proposal`; abrir o app nunca reorganiza nada. **Ao confirmar**, no mesmo dia civil da leitura e sem sessão nova entre a prévia e o Confirmar, a proposta aplicada com a `arrangementRevision` lida devolve `200`; `412` (a revisão mudou), `409` (`WORKOUT_DONE_THIS_WEEK` ou `MIN_REST_INTERVAL_NOT_MET`, por sessão iniciada no meio) ou `422` (`WEEKDAY_ALREADY_PASSED` ou `WEEK_START_IN_THE_PAST`, na virada do dia ou da semana) fazem o app reler o cartão e descartar a prévia. **Sessão aberta.** Com sessão aberta o estado é `SESSION_IN_PROGRESS`, esteja ela em andamento ou interrompida; quem diz qual das duas é `openSession.status` (`IN_PROGRESS` ou `INTERRUPTED`), com as séries feitas, as previstas e o último registro. Em andamento e com um descanso correndo, a sessão aberta traz o início dele (`restStartedAt`) e, havendo descanso prescrito, o alvo (`restDurationSeconds`), derivados pelo servidor dos fatos já registrados, para a barra de treino em andamento; ausentes, não há linha de descanso. **Primeiro treino.** `firstWorkout` é decidido pelo servidor: `true` se e somente se a conta nunca concluiu sessão alguma, em nenhuma relação, e só com `WORKOUT_AVAILABLE`; em qualquer outro estado é `false`. O cliente não o deriva de outra leitura. **Próximo treino.** `nextScheduledWorkout` é a próxima data, depois de hoje, com treino na ativação por dias da semana vigente, entre as atribuições já materializadas; existe só em `REST_DAY` e `WORKOUT_COMPLETED`, e é ausente em sequência livre, sem ativação e quando não há próxima. **Plano em sequência livre.** Quando a ativação vigente do aluno é `SEQUENCE`, a resposta traz `sequencePlan`: o plano, os treinos dele em ordem, o próximo e, em cada treino, o dia civil em que o aluno o concluiu pela última vez. O cartão do dia é então o **próximo treino** — o seguinte, em ordem circular, ao último treino do plano que o aluno concluiu, ou o primeiro quando ainda não concluiu nenhum — e o estado nunca é `REST_DAY`: a sequência não tem dia certo. Com treino do dia já iniciado ou concluído, `prescribedWorkout` é esse treino, `status` é `SESSION_IN_PROGRESS` ou `WORKOUT_COMPLETED`, e `sequencePlan.nextWorkoutId` segue apontando o próximo: em sequência livre continua valendo **um só treino concluído no dia** (`Q-09`) entre os treinos da sequência, e o próximo fica para outro dia. O extra não ocupa o dia: quando o único fato de hoje é uma sessão de extra, o cartão fica `WORKOUT_AVAILABLE` com o treino da sequência, e `WORKOUT_COMPLETED` só quando o treino da sequência foi concluído. A sessão **abandonada** hoje não ocupa o dia: sem sessão aberta nem concluída hoje, o cartão continua `WORKOUT_AVAILABLE` com o próximo treino, e o início é aceito. A validade da ativação **não aparece ao aluno**: nem `endDate`, nem `validity`, nem dias para vencer; um plano vencido continua servindo treinos, e vencer é assunto do personal. Sem treino algum na sequência o estado é `NO_WORKOUT_ASSIGNED` e `sequencePlan` vem com `workouts` vazio, sem `nextWorkoutId`. Vínculo pausado ou encerrado encerra a ativação: com o vínculo pausado a leitura responde `200` com `TRAINING_PAUSED`, e com o vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`, sem expor o motivo administrativo. **A ativação só serve a partir de `startDate`.** Antes desse dia civil — por exemplo a ativação criada hoje com início daqui a quatro dias — o cartão, a semana e o início de sessão seguem as atribuições que já existem, e `sequencePlan` **não aparece**: ele existe só a partir do início de uma ativação `SEQUENCE`. Sem ativação vigente e sem atribuição para hoje, o estado é `PLAN_NOT_STARTED`, com o dia do início em `planStartsOn`. Com treino do dia ocupado por uma atribuição à mão, o cartão é o dele, e a regra de uma atribuição por data vale só para a sequência livre: em dias da semana a sessão feita fora do dia nasce como atribuição do aluno ao lado do slot da mesma data. A resposta declara `Cache-Control: private, no-store`.

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

# **getStudentWeekArrangement**
```swift
    open class func getStudentWeekArrangement(weekStart: Date, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentWeekArrangementView?, _ error: Error?) -> Void)
```

Ler o arranjo da semana do aluno

**Minha semana** (`DOC-STUDENT-WEEK` §4): para cada treino do conjunto semanal da ativação por dias da semana em vigor, a sugestão do personal (`suggestedWeekdays`), o dia efetivo na semana pedida (`weekday`, `null` é **Sem dia**), de onde ele vem (`weekdaySource`) e se o treino já foi feito nesta semana (`doneThisWeek`, que não se move). A resolução do dia é a do servidor (`DOC-STUDENT-WEEK-TECH` §2.3): o ajuste da semana, se existir; senão o arranjo padrão, se existir; senão os dias sugeridos. O arranjo nasce igual à sugestão (`DOC-STUDENT-WEEK` §4.1) e a sugestão nunca é alterada pelo aluno. `weekStart` é a segunda-feira da semana pedida, no fuso do vínculo; outra data é `422 VALIDATION_FAILED`. Uma semana passada pode ser lida; só a gravação a recusa (`WEEK_START_IN_THE_PAST`). `revision` é o `ETag` da resposta e o `If-Match` de `saveStudentWeekArrangement` e `resetStudentWeekArrangement`. **A Minha semana vale só no modo dias da semana** (`DEC-SEMANA-26`): sem ativação por dias da semana em vigor — sequência livre, nenhuma ativação, ou o vínculo pausado, que encerra a ativação — a resposta é `404 WEEK_ARRANGEMENT_NOT_AVAILABLE`. Vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`. A resposta declara `Cache-Control: private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let weekStart = Date() // Date | A segunda-feira da semana pedida, no fuso do vínculo.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o arranjo da semana do aluno
StudentTrainingAPI.getStudentWeekArrangement(weekStart: weekStart, acceptLanguage: acceptLanguage) { (response, error) in
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
 **weekStart** | **Date** | A segunda-feira da semana pedida, no fuso do vínculo. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentWeekArrangementView**](StudentWeekArrangementView.md)

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

Projeção de leitura da tela \"Detalhes do treino\" do Lote 2, consumida antes do início da sessão. Devolve o treino exatamente como o personal o prescreveu, ancorado numa versão publicada e imutável (`prescriptionVersionId`), mais as contagens que a tela exibe: os blocos combinados, e por exercício a variante, o bloco, a observação, a cadência, a técnica e as **séries prescritas**, no mesmo vocabulário do bundle da sessão. Nada aqui é alvo operacional (`ExecutionTarget`): a série prescrita em percentual chega em percentual, e o alvo calculado (`calculatedLoadTargets`) só existe depois do início, na sessão. Por exercício, `lastComparable` é a última execução do aluno na mesma chave comparável, projeção dos fatos (`origin: PROJECTION`), **ausente** quando não há execução comparável — nunca zero. `workoutId` e `prescriptionVersionId` são opacos e não revelam chave interna, ordem ou versão de persistência. Em plano em sequência livre o resumo lê **qualquer treino da sequência vigente**, atribuído ou não a uma data: é o resumo pré-início que a tela do plano abre antes de iniciar, e a atribuição só nasce no início da sessão. **Treino extra.** Nos dois modos o resumo lê também o extra da versão em vigor (`role: EXTRA`), com `placementToday` `EXTRA` (`Treino extra. Não faz parte dos dias da sua semana.`); `role` diz o papel do treino em toda leitura com treino. **Qualquer treino da versão em vigor.** Em plano por dias da semana o resumo lê qualquer treino da versão em vigor, do dia ou de outro dia, e diz como seria o início hoje, para a tela avisar sem calcular nada: `placementToday` é a colocação que o casamento de `startStudentWorkoutSession` daria agora, com a data do slot em `slotDate` quando é `ANTICIPATED` ou `POSTPONED`; `doneThisWeekOn` é o dia desta semana em que o aluno já concluiu este treino, para o aviso de repetição; `secondWorkoutToday` diz se o aluno já concluiu algum treino hoje, para o aviso de segundo treino. Em sequência livre `placementToday` é `ON_SCHEDULE`. `restRequiredToday` diz se hoje é dia de descanso obrigatório em vigor: então o início é recusado (`409 REST_REQUIRED_TODAY`) e a tela mostra o aviso no lugar do botão. `blockedBy` e `availableFrom` dizem que o intervalo mínimo entre repetições do mesmo treino recusaria o início hoje (`MIN_REST_INTERVAL`) e o primeiro dia em que ele é aceito, nos dois modos; `minDaysBetweenSameWorkout` é o intervalo do plano em vigor, obrigatório com `blockedBy`, e a tela compõe com ele o aviso `Seu personal pede N dias entre repetições deste treino. Libera <data>.` Vínculo pausado responde `200` com `planState: TRAINING_PAUSED` e sem treino — a resposta é só o estado; vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let workoutId = "workoutId_example" // String | Identificador público opaco de um treino da versão em vigor do aluno autenticado: em plano por dias da semana, qualquer treino da versão, e em plano em sequência livre, qualquer treino da sequência vigente dele.
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
 **workoutId** | **String** | Identificador público opaco de um treino da versão em vigor do aluno autenticado: em plano por dias da semana, qualquer treino da versão, e em plano em sequência livre, qualquer treino da sequência vigente dele. |
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

# **recordStudentWorkoutSessionRetroactively**
```swift
    open class func recordStudentWorkoutSessionRetroactively(idempotencyKey: String, recordStudentWorkoutSessionRetroactivelyRequest: RecordStudentWorkoutSessionRetroactivelyRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionSyncView?, _ error: Error?) -> Void)
```

Marcar treino como feito depois

Command do CTA \"Marcar como feito\" no histórico (AL14, §3.5; `DOC-STUDENT-WORKOUT` §6.7). Permite ao aluno registrar retroativamente um treino previsto em data civil passada que não possui sessão concluída. **Regra LE-9 (data já concluída).** Para treino **semanal** (`role: WEEKLY`), se a data informada já possuir uma sessão de treino semanal no estado `COMPLETED`, a operação é recusada com `409 SESSION_ALREADY_COMPLETED_FOR_DATE`. A interface não oferece a ação para dias já concluídos. **A LE-9 não se aplica ao extra** (`DEC-SEMANA-5`): o extra não ocupa o dia, então a sessão de um extra na data não conta para ela. **Treino extra** (`role: EXTRA`, `DEC-SEMANA-19`). `workoutId` pode ser um extra da versão em vigor na data informada, em **qualquer data**, nos dois modos: a sessão nasce com a colocação `EXTRA` — é assim que `placedSessions` e o fato executado a mostram —, **nunca satisfaz slot** e não move a programação nem a fila da sequência. Ele é aceito também em data que já tem sessão concluída; o **mesmo** extra já concluído ou aberto na data é `409 WORKOUT_ALREADY_DONE_TODAY` (`LS-2`), e valem as recusas de descanso obrigatório e de intervalo mínimo abaixo. **Descanso obrigatório e intervalo mínimo** (`DOC-STUDENT-WEEK` §5, `DEC-SEMANA-19`). Valem também aqui, com a data informada no lugar de hoje: data de descanso obrigatório em vigor é `409 REST_REQUIRED_TODAY`, e sessão do mesmo treino, aberta ou concluída, a menos do intervalo mínimo da data informada é `409 MIN_REST_INTERVAL_NOT_MET`, com o primeiro dia aceito em `availableFrom` e o intervalo do plano em vigor em `minDaysBetweenSameWorkout`. **Sessão aberta.** Se o aluno já tiver uma sessão aberta no momento da chamada, a operação é recusada com `409 ACTIVE_SESSION_EXISTS`, carregando o `sessionId` da sessão aberta para o app levar à retomada. **Prescrição ativa.** Exige relacionamento ativo e versão de prescrição vigente na data solicitada; com vínculo inativo ou pausado responde `403 RELATIONSHIP_INACTIVE` ou `403 RELATIONSHIP_PAUSED`, e sem prescrição ativa `409 NO_ACTIVE_PRESCRIPTION`. **Validação temporal.** `date` no futuro responde `422 DATE_IN_FUTURE`; data anterior ao início do vínculo ativo responde `422 DATE_BEFORE_RELATIONSHIP_START`. **Idempotência.** O header `Idempotency-Key` é obrigatório. O reenvio com a mesma chave responde `200 OK` com a representação da sessão já gravada (`WorkoutSessionSyncView`). **Sessão prévia descartada ou interrompida.** Se o dia já possuía sessão `ABANDONED` ou `AUTO_AFTER_INTERRUPTION`, fatos já registrados (séries concluídas/parciais) são integralmente preservados com seus valores; séries prescritas sem fato recebem os valores prescritos marcados como não digitados (`DOC-WORKOUT-EXECUTION-SEMANTICS` §5); a sessão transiciona para `COMPLETED` com `recordedLater: true`. **Dia sem sessão prévia.** Uma nova sessão nasce diretamente no estado terminal `COMPLETED`, com `recordedLater: true`, vinculada à versão da prescrição vigente em `date`. **Sem duração inventada.** `durationSeconds` é nulo/ausente. Nenhum descanso é registrado (`rest_period` vazio, exibido como `—`). Séries com valores não digitados da prescrição ficam fora do volume e de recordes até que sejam eventualmente editadas pelo aluno.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let recordStudentWorkoutSessionRetroactivelyRequest = RecordStudentWorkoutSessionRetroactivelyRequest(date: Date(), workoutId: "workoutId_example", effort: 123) // RecordStudentWorkoutSessionRetroactivelyRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Marcar treino como feito depois
StudentTrainingAPI.recordStudentWorkoutSessionRetroactively(idempotencyKey: idempotencyKey, recordStudentWorkoutSessionRetroactivelyRequest: recordStudentWorkoutSessionRetroactivelyRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **recordStudentWorkoutSessionRetroactivelyRequest** | [**RecordStudentWorkoutSessionRetroactivelyRequest**](RecordStudentWorkoutSessionRetroactivelyRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutSessionSyncView**](WorkoutSessionSyncView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resetStudentWeekArrangement**
```swift
    open class func resetStudentWeekArrangement(idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentWeekArrangementView?, _ error: Error?) -> Void)
```

Voltar à sugestão do personal

**Voltar à sugestão do personal** (`DOC-STUDENT-WEEK` §4.1, `LS-5`): sem corpo e sem `weekStart`, vale sempre a partir da semana de hoje, no fuso do vínculo, então não há semana passada a recusar; apaga o arranjo padrão e os ajustes de semana a partir da semana de hoje, e refaz a programação de hoje em diante pela sugestão; a semana corrente volta à sugestão só nos dias futuros, e semanas passadas e sessões feitas não mudam. A resposta `200` é o arranjo da semana de hoje, igual à sugestão, com a revisão nova. `If-Match` é obrigatório e ecoa o `ETag` lido; ausente, malformado ou divergente é `412 PRECONDITION_FAILED`, sem gravar. `Idempotency-Key` é obrigatória: ausente, em branco ou acima do limite é `422 VALIDATION_FAILED`; a mesma chave com o mesmo `If-Match` devolve o resultado guardado, sem novo efeito. Sem ativação por dias da semana em vigor a resposta é `404 WEEK_ARRANGEMENT_NOT_AVAILABLE`; vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Voltar à sugestão do personal
StudentTrainingAPI.resetStudentWeekArrangement(idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentWeekArrangementView**](StudentWeekArrangementView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveStudentWeekArrangement**
```swift
    open class func saveStudentWeekArrangement(idempotencyKey: String, ifMatch: String, saveStudentWeekArrangementRequest: SaveStudentWeekArrangementRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentWeekArrangementView?, _ error: Error?) -> Void)
```

Mover treinos da semana do aluno

**Mover para…**, arrastar e **Organizar semana** (`DOC-STUDENT-WEEK` §4.2 e §4.3): cada item de `moves` leva um treino do conjunto semanal a um dia da semana ou a **Sem dia** (`weekday` nulo ou ausente). `scope` é o alcance (`DEC-SEMANA-22`): `THIS_WEEK` (`Só nesta semana`) grava um ajuste só da semana de `weekStart`; `FROM_THIS_WEEK_ON` (`Nesta e nas próximas`) grava o arranjo padrão e apaga os ajustes de semanas a partir de `weekStart`. `collision` resolve o dia de destino que já tem treino (`DEC-SEMANA-24`): `SWAP` (`Trocar com …`) leva o ocupante para o dia de origem, no mesmo alcance; `STACK` (`Fazer os dois nesse dia`, o padrão) não move ninguém. **Ordem de avaliação.** Primeiro o replay: a mesma `Idempotency-Key` com o mesmo corpo e o mesmo `If-Match` devolve a resposta guardada antes de qualquer validação; depois o `If-Match` (`412`); depois o pedido (`422`); por fim as regras do arranjo (`409`). **`SWAP`.** A origem é o dia **arranjado** do treino na semana de `weekStart` — um só, o `weekday` da leitura (`DOC-STUDENT-WEEK-TECH` §2.3). O ocupante do destino é o treino cujo **`weekday` da leitura é o destino**: um treino sugerido em vários dias ocupa só o seu `weekday`, o dia efetivo, e não os outros dias sugeridos. Sem ocupante, `SWAP` é um movimento simples, e o destino Sem dia não tem ocupante. Treino que vem de Sem dia não tem dia de origem: `SWAP` com destino ocupado é `422 VALIDATION_FAILED` com `fieldErrors` `{field: moves[i], code: SWAP_WITHOUT_ORIGIN}`; destino com mais de um ocupante também não troca: `422 VALIDATION_FAILED` com `{field: moves[i], code: SWAP_WITH_SEVERAL_OCCUPANTS}` — só `STACK`. Na semana corrente, origem anterior a hoje (o pendente de um dia que já passou, `LS-4`) também não troca, porque o ocupante cairia num dia passado: `422 VALIDATION_FAILED` com `{field: moves[i], code: WEEKDAY_ALREADY_PASSED}` — só `STACK`. **`SWAP` que não se aplica é `422` antes de qualquer `409`.** O ocupante segue as mesmas regras do treino que se move: ocupante já feito nesta semana não se move (`409 WORKOUT_DONE_THIS_WEEK`), e ocupante que iria para dia de descanso obrigatório é `409 REST_REQUIRED_DAY`, os dois apontando o ocupante. **Recusas, sem gravar nada:** treino fora do conjunto semanal da ativação em vigor é `409 WORKOUT_NOT_IN_WEEKLY_SET`; destino que é descanso obrigatório em vigor é `409 REST_REQUIRED_DAY`; arranjo que viola o intervalo mínimo entre repetições é `409 MIN_REST_INTERVAL_NOT_MET`, com o primeiro dia aceito em `availableFrom` e o intervalo do plano em `minDaysBetweenSameWorkout`; treino já feito nesta semana não se move (`409 WORKOUT_DONE_THIS_WEEK`). O treino cujo dia já passou e segue pendente pode ir para um dia futuro desta semana ou para Sem dia (`LS-4`). **Ordem das recusas `409`.** Cada movimento é avaliado contra o arranjo lido (a revisão do `If-Match`), e o servidor percorre `moves` em ordem e recusa pelo **primeiro** que falha, na ordem da §3.6: treino fora do conjunto → descanso obrigatório no destino → intervalo mínimo → treino já feito; com `SWAP`, o ocupante vem logo depois do treino que se move, pelas mesmas regras. O problema aponta o movimento recusado em `workoutId` (o treino que se move, ou o ocupante) e `weekday` (o destino dele; `null` é Sem dia). **Intervalo mínimo no arranjo.** É medido contra as **sessões** do mesmo treino, abertas ou concluídas (`DOC-STUDENT-WEEK-TECH` §5.2), e não contra os dias arranjados: `availableFrom` é o dia da última sessão mais `minDaysBetweenSameWorkout`. Um arranjo `FROM_THIS_WEEK_ON` só é avaliado na semana de `weekStart`; as semanas seguintes são avaliadas no início de cada sessão. **Datas que já passaram, antes de qualquer recusa `409`:** dias passados não mudam (`DOC-STUDENT-WEEK-TECH` §3.6), então `weekStart` anterior à segunda-feira da semana corrente, no fuso do vínculo, é `422 VALIDATION_FAILED` com `fieldErrors` `{field: weekStart, code: WEEK_START_IN_THE_PAST}`; na semana corrente, um `move` para um `weekday` anterior a hoje é `422 VALIDATION_FAILED` com `fieldErrors` `{field: moves[i].weekday, code: WEEKDAY_ALREADY_PASSED}`, nos dois alcances. Hoje e os dias seguintes são aceitos, e Sem dia também. Para `Nesta e nas próximas` num dia que já passou na semana corrente, o app envia `weekStart` da próxima segunda-feira, e o arranjo vale a partir dela. O teto é de 8 semanas depois da semana corrente: `weekStart` além dele é `422 VALIDATION_FAILED` com `fieldErrors` `{field: weekStart, code: WEEK_START_TOO_FAR}`. **Compare-and-set.** `If-Match` é obrigatório e ecoa o `ETag` lido, o mesmo valor de `revision`; ausente, malformado ou divergente é `412 PRECONDITION_FAILED`, sem gravar. `Idempotency-Key` é obrigatória: ausente, em branco ou acima do limite é `422 VALIDATION_FAILED`. A mesma chave com o mesmo corpo e o mesmo `If-Match` devolve o resultado guardado, sem novo efeito; com outro corpo é `409 IDEMPOTENCY_CONFLICT`. **Efeito.** Na mesma transação o servidor grava o arranjo e refaz a programação de hoje em diante: as atribuições futuras da programação sem sessão e não satisfeitas saem e nascem de novo pela resolução nova; atribuições à mão e sessões colocadas não mudam, dias passados não mudam, e fato é fato. A resposta `200` é o arranjo da semana de `weekStart` com a revisão nova. **A Minha semana vale só no modo dias da semana**: sem ativação por dias da semana em vigor a resposta é `404 WEEK_ARRANGEMENT_NOT_AVAILABLE`; vínculo encerrado ou inexistente responde `403 RELATIONSHIP_INACTIVE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let saveStudentWeekArrangementRequest = SaveStudentWeekArrangementRequest(weekStart: Date(), scope: "scope_example", collision: "collision_example", moves: [StudentWeekArrangementMove(workoutId: "workoutId_example", weekday: PlanWeekday())]) // SaveStudentWeekArrangementRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Mover treinos da semana do aluno
StudentTrainingAPI.saveStudentWeekArrangement(idempotencyKey: idempotencyKey, ifMatch: ifMatch, saveStudentWeekArrangementRequest: saveStudentWeekArrangementRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **saveStudentWeekArrangementRequest** | [**SaveStudentWeekArrangementRequest**](SaveStudentWeekArrangementRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentWeekArrangementView**](StudentWeekArrangementView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startStudentWorkoutSession**
```swift
    open class func startStudentWorkoutSession(idempotencyKey: String, startWorkoutSessionRequest: StartWorkoutSessionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutSessionStartResponse?, _ error: Error?) -> Void)
```

Iniciar a sessão de treino do aluno

Command do CTA \"Iniciar treino\" do Lote 2, presente tanto na Home quanto na tela de detalhes do treino. **A identidade da sessão é criada pelo cliente.** `sessionId` é gerado no device e enviado no corpo, e o servidor **adota** a identidade recebida em vez de emitir outra — a mesma identidade vale em qualquer transporte. **A confirmação é o commit no backend**: enquanto a capacidade `offline-sync` estiver desligada, a sessão só existe depois desta resposta; sem rede a operação é bloqueada e o erro é dito como erro de rede, nunca como sucesso adiado. A operação é idempotente pela identidade da sessão: reenviar o mesmo `sessionId` com o mesmo corpo devolve a sessão original sem criar outra. O mesmo `sessionId` com corpo diferente é conflito explícito (`SESSION_IDENTITY_DIVERGENT`), nunca sobrescrita silenciosa. A `Idempotency-Key` é obrigatória e validada — ausente, em branco ou acima do limite é `422 VALIDATION_FAILED` —, mas não decide o replay: quem decide é o `sessionId`. O aluno tem no máximo uma sessão aberta: iniciar com outra aberta é `409 SESSION_ALREADY_EXISTS`, que carrega o `sessionId` canônico da aberta para o app levar à retomada em vez de criar outra. A sessão fixa `prescriptionVersionId` no início e essa versão permanece imutável: publicar uma nova versão da prescrição depois não altera a sessão em andamento. **Instantes.** O instante da sessão é o do servidor: o `startedAt` da resposta é o instante em que o servidor confirmou o início, e o dia civil da sessão sai dele, no fuso do vínculo. O `startedAt` do pedido é o instante declarado pelo aparelho: é aceito, recusado com `CLOCK_SKEW` quando está à frente do relógio do servidor além da tolerância, e guardado para auditoria, nunca usado para ordenar sessões nem para decidir o dia. **Vínculo.** Com o vínculo pausado o início responde `403 RELATIONSHIP_PAUSED`; com o vínculo encerrado ou inexistente, `403 RELATIONSHIP_INACTIVE`. Esta resposta de início não devolve execução: série, carga, repetição, alvo operacional, descanso, orquestração e encerramento têm caminho HTTP próprio e autoritativo, publicado sob a tag `Workout Execution`. **Plano por dias da semana.** Em ativação `WEEKDAYS`, `workoutId` é **qualquer** treino da versão em vigor, em qualquer dia, e não só o do dia; `prescriptionVersionId` é a versão em vigor. O servidor faz o **casamento** neste início, na mesma transação, com a data civil do início no fuso do vínculo e a semana de segunda a domingo que a contém, e devolve a colocação em `placement`. Um slot do treino é **pendente** quando não tem sessão aberta ou concluída na própria data e nenhuma sessão em outra data o satisfez. Com slot pendente do treino hoje, a sessão é desse slot (`ON_SCHEDULE`). Sem ele, se o treino tem slot pendente em outra data desta semana, a sessão nasce como atribuição do aluno na data de hoje e satisfaz o slot pendente **mais próximo** — no empate de distância, o **passado** —: `ANTICIPATED` quando o slot é futuro e `POSTPONED` quando é passado, com a data dele em `slotDate`; o slot de origem e a prescrição não mudam. Sem slot pendente do treino na semana, a sessão é repetição (`REPEAT`); o treino **Sem dia** nesta semana, que não tem slot, é `UNSCHEDULED` e não satisfaz nada. Antecipar não atravessa a semana: no domingo, o treino previsto para a segunda seguinte satisfaz o slot desta semana, se ainda pendente, ou é repetição. Dois inícios concorrentes nunca satisfazem o mesmo slot. **Em plano por dias da semana não existe limite de um treino por dia.** Treinos diferentes no mesmo dia são aceitos; o **mesmo** treino com sessão **aberta ou concluída** hoje é `409 WORKOUT_ALREADY_DONE_TODAY`: a repetição é entre dias. A sessão abandonada não conta: iniciar de novo o mesmo treino é aceito. **`expectedPlacement`** é a colocação que a tela mostrou ao aluno antes do início (`placementToday` do resumo ou `placement` da oferta da Hoje). Quando vem e difere da que o casamento calcula agora, o início é recusado com `409 PLACEMENT_CHANGED`, que traz a colocação atual em `placement`, e nada é criado: o app relê o resumo e mostra o aviso certo. Ausente, o servidor não compara. **Descanso obrigatório e intervalo mínimo** (`DOC-STUDENT-WEEK` §5). Num dia de descanso obrigatório em vigor nenhum início é aceito: `409 REST_REQUIRED_TODAY`. Com intervalo mínimo N no plano, o início do treino no dia D é recusado quando há sessão do mesmo treino, aberta ou concluída, em dia D' com |D − D'| < N: `409 MIN_REST_INTERVAL_NOT_MET`, com `availableFrom` = o maior D' mais N, o primeiro dia em que o início é aceito, e com N em `minDaysBetweenSameWorkout`, o valor do plano em vigor, para a tela compor o aviso. A sessão abandonada não conta. **Ordem das recusas:** vínculo pausado ou encerrado; dia de descanso obrigatório (`409 REST_REQUIRED_TODAY`); treino fora da versão em vigor (`404`) ou versão diferente (`409 PRESCRIPTION_VERSION_NOT_ASSIGNED`); intervalo mínimo (`409 MIN_REST_INTERVAL_NOT_MET`); colocação divergente (`409 PLACEMENT_CHANGED`); o mesmo treino com sessão aberta ou concluída hoje (`409 WORKOUT_ALREADY_DONE_TODAY`); outra sessão aberta (`409 SESSION_ALREADY_EXISTS`). **Treino extra** (`role: EXTRA`, `DOC-STUDENT-WEEK` §7). Nos dois modos, `workoutId` pode ser um extra da versão em vigor, em **qualquer dia**: a sessão nasce como atribuição do aluno na data de hoje com `placement` `EXTRA`, **nunca satisfaz slot** e não move a programação. Valem para o extra as mesmas recusas: descanso obrigatório (`409 REST_REQUIRED_TODAY`), intervalo mínimo entre repetições do mesmo extra (`409 MIN_REST_INTERVAL_NOT_MET`, com `availableFrom` e `minDaysBetweenSameWorkout`) e o mesmo extra com sessão aberta ou concluída hoje (`409 WORKOUT_ALREADY_DONE_TODAY`, `LS-2`). **O extra não ocupa o dia** (`DEC-SEMANA-5`): em sequência livre `Q-09` vale só entre os treinos da própria sequência, e o extra pode ser iniciado no mesmo dia do treino da sequência, antes ou depois dele, sem bloquear o início desse treino e sem mover a fila. `expectedPlacement` de um extra é `EXTRA`; outro valor é `409 PLACEMENT_CHANGED`. **Plano em sequência livre.** Em ativação `SEQUENCE` não há atribuição antecipada nem slot: `workoutId` é **qualquer** treino da sequência — o próximo ou outro, o aluno escolhe —, `prescriptionVersionId` é a versão da ativação, e a atribuição daquela data civil é materializada pelo servidor **neste início**, no fuso do vínculo. Não há casamento, e `placement` é `ON_SCHEDULE` para o treino da sequência (o extra é `EXTRA`). Como a colocação calculada do treino da sequência é sempre `ON_SCHEDULE`, `expectedPlacement` ausente ou `ON_SCHEDULE` segue, e qualquer outro valor é `409 PLACEMENT_CHANGED` com `placement: ON_SCHEDULE`, sem criar nada. O intervalo mínimo vale também em sequência livre (`409 MIN_REST_INTERVAL_NOT_MET`); descanso obrigatório não existe nela. A regra de uma atribuição por data permanece, e na sequência livre continua valendo **um só treino concluído no dia** (`Q-09`) entre os treinos da sequência: `409 WORKOUT_ALREADY_DONE_TODAY` só acontece quando a atribuição do dia tem sessão **aberta ou concluída**, ou quando é a atribuição que o personal fez à mão para **outro** treino naquela data, que **também** bloqueia o início da sequência naquele dia; o app leva à retomada ou mostra que o próximo treino fica para amanhã. A sessão **abandonada** hoje **não ocupa o dia**: sem sessão aberta nem concluída hoje, iniciar o mesmo treino ou outro da sequência é aceito, e a atribuição daquele dia passa a ser a do treino escolhido. A ativação só serve a partir de `startDate`: antes dele não há treino de sequência a iniciar, e o início de um treino que só a sequência nomearia é o mesmo `404`. Treino fora da sequência, ativação encerrada ou de outro aluno respondem o mesmo `404`, sem distinguir. O início registra qual treino foi iniciado, mas a fila continua a partir do último treino **concluído**: iniciar e abandonar não a move.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startWorkoutSessionRequest = StartWorkoutSessionRequest(sessionId: "sessionId_example", workoutId: "workoutId_example", prescriptionVersionId: "prescriptionVersionId_example", startedAt: Date(), source: WorkoutSessionStartSource(), expectedPlacement: WorkoutPlacement()) // StartWorkoutSessionRequest |
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
