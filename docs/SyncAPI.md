# SyncAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAuthenticatedSyncScope**](SyncAPI.md#getauthenticatedsyncscope) | **GET** /sync/scope | Obter o descritor canônico do escopo autenticado de sincronização
[**getStudentOfflineWorkoutBundle**](SyncAPI.md#getstudentofflineworkoutbundle) | **GET** /student/workout-sessions/{sessionId}/bundle | Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor
[**getSyncChanges**](SyncAPI.md#getsyncchanges) | **GET** /sync/changes | Ler o delta do escopo a partir de um cursor opaco
[**getSyncSnapshot**](SyncAPI.md#getsyncsnapshot) | **GET** /sync/snapshot | Rematerializar o escopo inteiro com cursor de delta consistente
[**pushSyncCommands**](SyncAPI.md#pushsynccommands) | **POST** /sync/commands | Enviar um lote idempotente de commands criados no device


# **getAuthenticatedSyncScope**
```swift
    open class func getAuthenticatedSyncScope(acceptLanguage: String? = nil, completion: @escaping (_ data: SyncScopeDescriptor?, _ error: Error?) -> Void)
```

Obter o descritor canônico do escopo autenticado de sincronização

Resolve no servidor o único escopo de sincronização efetivo da sessão autenticada e devolve a chave `(accountId, role)` que particiona cursor, outbox, cache e bundles no device. `accountId` é a identidade opaca da conta FitApp, não o `identityId` externo publicado em `SessionResponse`; o cliente nunca decodifica JWT, transforma subject em conta nem escolhe papel a partir de claims não contratuais. O papel público é fechado em `PERSONAL | STUDENT`. A implementação traduz a autoridade interna de treinador para `PERSONAL`; autoridade administrativa não habilita sync. Se a sessão não possuir exatamente um papel de sync ativo e autorizado — inclusive nenhuma autoridade ou mais de uma sem seleção ativa server-owned — a operação falha fechada com `403 SYNC_SCOPE_FORBIDDEN`, sem revelar conta, papéis, vínculo ou recursos. O cliente obtém este descritor antes de anexar um store local a uma sessão. Logout ou mudança do descritor cancela qualquer ciclo em curso e desacopla imediatamente o store anterior; fila, cursor, cache e bundles do escopo anterior permanecem isolados e nunca são reenviados no novo escopo. A rota é somente leitura e não escolhe nem troca papel. **Para os clientes móveis, esta rota foi substituída por `GET /identity/entry-context`**, que devolve os contextos da conta no vocabulário da jornada de entrada. `/sync/_*` não é usado pelo runtime móvel do MVP, e o descritor aqui continua publicado para a capacidade `offline-sync`: ele é chave de partição de store, nunca leitura de contexto de produto, e um cliente que só precisa saber se a conta é de aluno não deve buscá-lo aqui.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o descritor canônico do escopo autenticado de sincronização
SyncAPI.getAuthenticatedSyncScope(acceptLanguage: acceptLanguage) { (response, error) in
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

[**SyncScopeDescriptor**](SyncScopeDescriptor.md)

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

Composição da sessão **no momento da leitura**, reautorizada a cada leitura. Além do recorte da prescrição imutável fixada no início — assignment, versão, exercícios, séries, variantes, alternativas autorizadas, histórico comparável e manifesto de mídia —, o bundle inclui **todos os fatos de execução já aceitos pelo servidor** que a retomada precisa, dos tipos `EXERCISE_EXECUTION`, `SET_EXECUTION`, `SET_AMENDMENT`, `REST_PERIOD`, `SUBSTITUTION` e `DEFERRAL`. Cada `SET_EXECUTION` traz os valores em vigor depois das emendas, e a sua `revision` é a mesma que `getStudentSetExecution` publica e que `If-Match` exige. Cada `DEFERRAL`, aberto ou terminal, traz o `deferralId` que a retomada do exercício e a declaração de pendências no encerramento exigem. `DISCOMFORT_REPORT` **nunca** entra no bundle: o relato de desconforto é dado de saúde, dado de saúde não fica armazenado no aparelho, e ele não é necessário para retomar a execução. Esta versão não publica leitura do relato para o aluno; se uma vier a existir, será uma rota própria, nunca este bundle. **Com a capacidade `offline-sync` desligada, esta é a leitura autoritativa para retomar uma sessão `IN_PROGRESS`** — depois de relançar o app, de o processo morrer ou a partir de outro aparelho. O cliente exibe o progresso a partir dela, nunca do armazenamento local. `bundleRevision` é opaco e comparado somente por igualdade: muda **sempre** que qualquer item incluído muda, inclusive um fato de execução ou o estado da sessão, e o mesmo conteúdo produz a mesma `bundleRevision`. `generatedAt` é informativo: duas leituras com a mesma `bundleRevision` podem trazer `generatedAt` diferentes, e o cliente não trata isso como conflito. O cliente persiste os `items` pela mesma identidade `entityType/entityId` usada no delta. Nenhum binário de mídia, estado de rede ou command local atravessa a resposta. O manifesto de mídia traz só o vídeo próprio do personal (`ADR-0015`). A demonstração de um exercício do **catálogo** nunca entra no bundle — a URL dela é de curta duração e cada uma consome cota da origem —: o app a pede em `getStudentExerciseDemonstration`, no toque em reproduzir. **Histórico comparável.** O bundle inclui um item `READ_MODEL_EXERCISE_HISTORY` (`ExerciseHistorySyncView`) por **variante prescrita** do treino da sessão e por **variante de alternativa autorizada**, com **até 3 entradas** cada um: é o que a série mostra como \"última vez\". É projeção (`origin: PROJECTION`, com `asOf`) na chave exercício + variante + contexto de equipamento, e a variante que não tem execução comparável **também** tem o seu item, com `comparisonStatus` explícito e `entries` vazio — a ausência nunca é zero. **Unidade divergente nunca é convertida**: cada entrada traz a carga na unidade em que foi registrada, e a conversão de exibição é do app. O histórico completo, por data, não é deste bundle. **Esforço prescrito.** Cada série prescrita (`PrescribedSetSyncView`) traz `effortType` (`RPE` ou `RIR`) e `effortValue` quando o personal prescreveu esforço para ela, e nenhum dos dois quando não prescreveu. O app mostra o prescrito como o personal o escreveu — `RPE 8` ou `2 repetições em reserva` — e **nunca o converte** no RPE declarado pelo aluno (`actual.rpe`) nem em `expectedRpe`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sessionId = "sessionId_example" // String | Sessão do aluno autenticado; existência fora do escopo nunca é revelada.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o bundle tipado da sessão, com o progresso já aceito pelo servidor
SyncAPI.getStudentOfflineWorkoutBundle(sessionId: sessionId, acceptLanguage: acceptLanguage) { (response, error) in
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

# **getSyncChanges**
```swift
    open class func getSyncChanges(acceptLanguage: String? = nil, xSyncTrigger: SyncTrigger? = nil, ifNoneMatch: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: SyncChangesPage?, _ error: Error?) -> Void)
```

Ler o delta do escopo a partir de um cursor opaco

Leitura incremental, segura e sem efeito colateral, do que mudou no escopo do ator autenticado desde `cursor`. O escopo é `(conta, papel)` derivado do Bearer e do vínculo Personal–Aluno ativo; nenhum parâmetro de conta, aluno ou escopo é aceito. Nenhuma mutação trafega por esta rota. **Cursor.** O cursor opaco devolvido pela página anterior (ou pela última página de `GET /sync/snapshot`) é a única forma de paginar: não há offset, sequência interna, LSN nem timestamp de banco em payload ou header. O cliente persiste o cursor como bytes e nunca o interpreta, ordena, incrementa ou fabrica. Reenviar o mesmo cursor devolve o mesmo lote sem avançar nada no servidor. `cursor` ausente sem snapshot prévio do escopo é `409 SYNC_SNAPSHOT_REQUIRED`: o servidor nunca assume início de história. Cursor adulterado, truncado, com assinatura inválida ou de formato retirado de circulação é `400 SYNC_CURSOR_INVALID`; cursor válido de outra conta ou de outro papel é `403 SYNC_CURSOR_SCOPE_MISMATCH`; cursor anterior à janela de retenção é `410 SYNC_CURSOR_EXPIRED`. Nos três casos a resposta não revela a representação interna, a existência de outra conta nem o tamanho do escopo alheio, e o caminho único de recuperação é `GET /sync/snapshot`. **Itens.** Cada entrada do escopo aparece exatamente uma vez no conjunto das páginas, coalescida por `(entityType, entityId)` com a representação vigente renderizada pelo módulo dono com reautorização; perda de visibilidade vira `TOMBSTONE` com `tombstoneReason`. A ordem é a sequência server-owned; `asOf` e `revision` são do servidor e o cliente aplica por identidade, descartando revisão menor do que a local. `limit` é pedido, nunca garantia: `effectiveLimit` declara o aplicado, e página menor que o pedido com `hasMore: true` é resultado válido. **Cache.** A resposta emite `ETag` derivada do estado do escopo e do cursor; `If-None-Match` igual responde `304` sem corpo, sem avançar cursor e sem consumir cota. `X-Sync-Trigger: MANUAL` identifica o ciclo disparado pelo botão de sincronização, com limite de taxa próprio (`429 SYNC_RATE_LIMITED` com `Retry-After`).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let xSyncTrigger = SyncTrigger() // SyncTrigger | Origem do ciclo de sincronização que fez esta leitura: `AUTOMATIC` (padrão quando ausente) ou `MANUAL` (botão de sincronizar). Muda somente métrica e o limite de taxa aplicado; nunca a representação nem a prioridade. (optional)
let ifNoneMatch = "ifNoneMatch_example" // String | ETag exata devolvida pela leitura anterior do mesmo par cursor/escopo. Quando a representação não mudou, o servidor responde `304` sem corpo, sem avançar cursor e sem consumir cota de leitura. (optional)
let cursor = "cursor_example" // String | Cursor opaco devolvido pela página anterior ou pela última página do snapshot. Ausente somente quando o device nunca materializou o escopo; nesse caso o servidor responde `409 SYNC_SNAPSHOT_REQUIRED`. (optional)
let limit = 987 // Int | Quantidade de entidades coalescidas pedida, no intervalo fechado de 1 a 500; ausente assume 200. Valor fora do intervalo, não numérico ou repetido é `422 SYNC_LIMIT_INVALID`. O servidor pode aplicar menos e declara o valor em `effectiveLimit`. (optional) (default to 200)

// Ler o delta do escopo a partir de um cursor opaco
SyncAPI.getSyncChanges(acceptLanguage: acceptLanguage, xSyncTrigger: xSyncTrigger, ifNoneMatch: ifNoneMatch, cursor: cursor, limit: limit) { (response, error) in
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
 **xSyncTrigger** | [**SyncTrigger**](.md) | Origem do ciclo de sincronização que fez esta leitura: &#x60;AUTOMATIC&#x60; (padrão quando ausente) ou &#x60;MANUAL&#x60; (botão de sincronizar). Muda somente métrica e o limite de taxa aplicado; nunca a representação nem a prioridade. | [optional]
 **ifNoneMatch** | **String** | ETag exata devolvida pela leitura anterior do mesmo par cursor/escopo. Quando a representação não mudou, o servidor responde &#x60;304&#x60; sem corpo, sem avançar cursor e sem consumir cota de leitura. | [optional]
 **cursor** | **String** | Cursor opaco devolvido pela página anterior ou pela última página do snapshot. Ausente somente quando o device nunca materializou o escopo; nesse caso o servidor responde &#x60;409 SYNC_SNAPSHOT_REQUIRED&#x60;. | [optional]
 **limit** | **Int** | Quantidade de entidades coalescidas pedida, no intervalo fechado de 1 a 500; ausente assume 200. Valor fora do intervalo, não numérico ou repetido é &#x60;422 SYNC_LIMIT_INVALID&#x60;. O servidor pode aplicar menos e declara o valor em &#x60;effectiveLimit&#x60;. | [optional] [default to 200]

### Return type

[**SyncChangesPage**](SyncChangesPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSyncSnapshot**
```swift
    open class func getSyncSnapshot(acceptLanguage: String? = nil, xSyncTrigger: SyncTrigger? = nil, ifNoneMatch: String? = nil, pageCursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: SyncSnapshotPage?, _ error: Error?) -> Void)
```

Rematerializar o escopo inteiro com cursor de delta consistente

Caminho único de recuperação do sync: devolve o estado corrente **completo** do escopo do ator (todos os itens `UPSERT`), paginado por `pageCursor` opaco, e libera na última página o `deltaCursor` a partir do qual `GET /sync/changes` continua sem lacuna e sem repetição. Usado na primeira instalação, após `SYNC_CURSOR_EXPIRED`, `SYNC_CURSOR_INVALID` ou `SYNC_SNAPSHOT_REQUIRED`, e quando o cliente detecta estado local corrompido. É estritamente somente leitura: não cria fato, não consome dedup por `commandId` e não anexa entrada ao change-log. **Consistência.** A sequência máxima do change-log é capturada **antes** de materializar qualquer projeção, sob o lock consultivo do escopo, e todas as páginas da mesma rematerialização são servidas contra esse único corte, declarado em `capturedSequence` (opaco). Uma mudança concorrente aparece exatamente uma vez: dentro do snapshot ou no primeiro delta, nunca em ambos e nunca em nenhum. Snapshot e delta não misturam versões de prescrição nem escopos de relacionamento: a versão fixada numa sessão em andamento permanece a dela. **Paginação.** Ordem total determinista por módulo, tipo de entidade e identidade. `pageCursor` é de vida curta e não é intercambiável com o cursor de delta; reapresentá-lo devolve a mesma página sem efeito colateral; reiniciar do zero captura uma sequência nova sem estado órfão. `pageCursor` adulterado ou expirado é `400 SYNC_SNAPSHOT_PAGE_CURSOR_INVALID` e reinicia o snapshot. Toda página intermediária declara `deltaCursor: null`; somente a última carrega o cursor utilizável. Um escopo sem entidades responde uma única página vazia, última, com `deltaCursor` válido. **Autorização.** Reavaliada em cada página: vínculo encerrado no meio da paginação é `409 SYNC_SNAPSHOT_SCOPE_CHANGED` no mesmo formato usado para dado inexistente. `lastCommandId` por entidade permite ao cliente distinguir mutação já confirmada de mutação ainda pendente no outbox; a ausência de um `commandId` no snapshot nunca confirma nem descarta esse command, e nenhuma resposta traz diretiva de apagar dado local. **Custo.** Orçamento próprio por conta e por device, separado do delta e do lote: excedente é `429 SYNC_SNAPSHOT_RATE_LIMITED` com `Retry-After` e não impede o sync normal. `ETag`/`If-None-Match` valem por página.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let xSyncTrigger = SyncTrigger() // SyncTrigger | Origem do ciclo de sincronização que fez esta leitura: `AUTOMATIC` (padrão quando ausente) ou `MANUAL` (botão de sincronizar). Muda somente métrica e o limite de taxa aplicado; nunca a representação nem a prioridade. (optional)
let ifNoneMatch = "ifNoneMatch_example" // String | ETag exata devolvida pela leitura anterior do mesmo par cursor/escopo. Quando a representação não mudou, o servidor responde `304` sem corpo, sem avançar cursor e sem consumir cota de leitura. (optional)
let pageCursor = "pageCursor_example" // String | Cursor opaco da própria paginação do snapshot, devolvido pela página anterior. Ausente inicia uma rematerialização nova. Nunca é o cursor de delta. (optional)
let limit = 987 // Int | Quantidade de entidades pedida por página, no intervalo fechado de 1 a 500; ausente assume 200. Valor fora do intervalo, não numérico ou repetido é `422 SYNC_LIMIT_INVALID`; `effectiveLimit` declara o aplicado. (optional) (default to 200)

// Rematerializar o escopo inteiro com cursor de delta consistente
SyncAPI.getSyncSnapshot(acceptLanguage: acceptLanguage, xSyncTrigger: xSyncTrigger, ifNoneMatch: ifNoneMatch, pageCursor: pageCursor, limit: limit) { (response, error) in
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
 **xSyncTrigger** | [**SyncTrigger**](.md) | Origem do ciclo de sincronização que fez esta leitura: &#x60;AUTOMATIC&#x60; (padrão quando ausente) ou &#x60;MANUAL&#x60; (botão de sincronizar). Muda somente métrica e o limite de taxa aplicado; nunca a representação nem a prioridade. | [optional]
 **ifNoneMatch** | **String** | ETag exata devolvida pela leitura anterior do mesmo par cursor/escopo. Quando a representação não mudou, o servidor responde &#x60;304&#x60; sem corpo, sem avançar cursor e sem consumir cota de leitura. | [optional]
 **pageCursor** | **String** | Cursor opaco da própria paginação do snapshot, devolvido pela página anterior. Ausente inicia uma rematerialização nova. Nunca é o cursor de delta. | [optional]
 **limit** | **Int** | Quantidade de entidades pedida por página, no intervalo fechado de 1 a 500; ausente assume 200. Valor fora do intervalo, não numérico ou repetido é &#x60;422 SYNC_LIMIT_INVALID&#x60;; &#x60;effectiveLimit&#x60; declara o aplicado. | [optional] [default to 200]

### Return type

[**SyncSnapshotPage**](SyncSnapshotPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pushSyncCommands**
```swift
    open class func pushSyncCommands(idempotencyKey: String, syncCommandBatchRequest: SyncCommandBatchRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: SyncCommandBatchResponse?, _ error: Error?) -> Void)
```

Enviar um lote idempotente de commands criados no device

Único transporte de mutação offline do produto, para o aluno e para o personal. O device envia intenções já materializadas localmente como um lote ordenado de commands; o servidor aplica cada uma **exatamente uma vez** ou explica, por item, por que não. **Identidades e escopos de deduplicação.** `Idempotency-Key` é igual ao `batchId` do envelope (UUIDv7) e protege o corpo inteiro contra o reenvio de transporte: o mesmo lote com o mesmo corpo repete a resposta original sem reexecutar nenhum handler e sem emitir nenhuma entrada de change-log; o mesmo `batchId` com corpo diferente é `409 SYNC_BATCH_IDEMPOTENCY_CONFLICT` e nada é processado. `commandId` (UUIDv7) identifica cada item, é reutilizado em toda retentativa e sobrevive à recomposição do lote: um `commandId` já confirmado volta como `ACKNOWLEDGED` com o resultado original; o mesmo `commandId` com payload divergente é `CONFLICT/IDENTITY_DIVERGENT`. Os dois escopos não têm hierarquia entre si. **Resultado por item.** O lote **processado** responde `200` mesmo com itens falhos: `results` traz exatamente um `SyncCommandResult` por command, na mesma ordem, com status fechado em `ACKNOWLEDGED`, `RETRYABLE_FAILURE`, `CONFLICT` ou `FINAL_FAILURE`. Um item ruim nunca derruba o lote nem desfaz o efeito dos outros; o cliente decide o que fazer por `status` e `code`, nunca por texto. **Ordem e causalidade.** Os commands são aplicados na ordem do array, cada um na sua própria transação de efeito. Quando um command de um agregado termina em `RETRYABLE_FAILURE`, os posteriores do mesmo agregado no lote recebem `RETRYABLE_FAILURE/SYNC_PRECEDING_COMMAND_NOT_ACKNOWLEDGED` sem serem processados; após `CONFLICT` ou `FINAL_FAILURE` os posteriores **são** processados. `causationCommandId` desconhecido pelo servidor e ausente do lote é `RETRYABLE_FAILURE/SYNC_CAUSATION_UNKNOWN`. **Autoridade.** Revisão, cursor, ordem canônica, autorização e resultado de conflito são do servidor. `clientOccurredAt` é armazenado como declarado e **nunca** ordena itens, resolve conflito nem elege vencedor; desvio grande para o futuro é `FINAL_FAILURE/SYNC_CLOCK_SKEW`, desvio para o passado é legítimo. O escopo é derivado do Bearer e do vínculo Personal–Aluno ativo, nunca do corpo: papel sem sync é `403 SYNC_SCOPE_FORBIDDEN`; agregado fora do escopo é `FINAL_FAILURE/FORBIDDEN` no item, sem revelar existência. **Limites.** `commands` entre 1 e 100 (`413 SYNC_BATCH_TOO_LARGE`) e corpo até 1 MiB, verificados antes de qualquer efeito; envelope estruturalmente inválido (campo obrigatório ausente, campo desconhecido, `commandId` repetido no lote, `Idempotency-Key` diferente de `batchId`, `deviceId` fora do formato opaco) é `422 SYNC_ENVELOPE_INVALID` com `fieldErrors[].field` indexado (`commands[3].payload.choice`) e nenhum command processado. Limites de taxa distintos para `AUTOMATIC` e `MANUAL`, por device e por conta: excedente é `429 SYNC_RATE_LIMITED` com `Retry-After`, nenhum command processado, e o mesmo lote reenviado após a janela é aceito como primeira execução. **Payload tipado.** `commands[].payload` é tipado pelo `commandType` via `oneOf` discriminado. Esta versão publica os commands `execution.*` do Workout Core e o command técnico `sync.conflict.resolve`; outras famílias entram em releases seguintes como novos membros do `oneOf`. Um `commandType` fora do registry do servidor é `FINAL_FAILURE/SYNC_COMMAND_TYPE_UNKNOWN` no item e um `schema` maior do que o suportado é `FINAL_FAILURE/SYNC_COMMAND_SCHEMA_UNSUPPORTED`; o cliente preserva o fato local e pede atualização do app, nunca descarta. `changesAvailable` é apenas uma dica calculada a partir de `knownCursor`; `GET /sync/changes` continua sendo a autoridade. O servidor nunca devolve \"sincronizado\" nem `isOffline`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let syncCommandBatchRequest = SyncCommandBatchRequest(batchId: "batchId_example", syncTrigger: SyncTrigger(), device: DeviceContext(deviceId: "deviceId_example", platform: "platform_example", appVersion: "appVersion_example"), knownCursor: "knownCursor_example", commands: [SyncCommandEnvelope(commandId: "commandId_example", commandType: "commandType_example", schema: 123, aggregateType: "aggregateType_example", aggregateId: "aggregateId_example", expectedRevision: "expectedRevision_example", causationCommandId: "causationCommandId_example", clientOccurredAt: Date(), payload: RelationshipInvitationRemovePayload(invitationId: "invitationId_example"))]) // SyncCommandBatchRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Enviar um lote idempotente de commands criados no device
SyncAPI.pushSyncCommands(idempotencyKey: idempotencyKey, syncCommandBatchRequest: syncCommandBatchRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **syncCommandBatchRequest** | [**SyncCommandBatchRequest**](SyncCommandBatchRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**SyncCommandBatchResponse**](SyncCommandBatchResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
