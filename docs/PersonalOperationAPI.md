# PersonalOperationAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPersonalStudentOperation**](PersonalOperationAPI.md#getpersonalstudentoperation) | **GET** /personal/students/{studentId}/operation | Ler a projeção operacional de um vínculo
[**listPersonalStudentOperations**](PersonalOperationAPI.md#listpersonalstudentoperations) | **GET** /personal/students/operations | Consultar a carteira operacional de alunos, com busca, filtros e uma linha por vínculo


# **getPersonalStudentOperation**
```swift
    open class func getPersonalStudentOperation(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentOperationView?, _ error: Error?) -> Void)
```

Ler a projeção operacional de um vínculo

Leitura da tela Orientação do aluno para o vínculo identificado por `studentId`. A autorização é decidida pelo servidor a cada leitura, e a resposta usa a mesma linha operacional de `listPersonalStudentOperations`, sem que o cliente varra a projeção paginada nem junte outra leitura para montar a tela. `asOf` é o instante do servidor em que o corte foi calculado e `origin` é sempre `PROJECTION`. Só vínculo `ACTIVE` deste personal, com o compartilhamento em vigor, devolve uma linha. Desde 0.76.0 todo vínculo nasce com o aceite de `SHARE_DATA_WITH_PERSONAL` (`DEC-PHOME-19`), então `SHARING_GRANT_REQUIRED` só tem o gatilho da perda da base de autorização (revogação do termo, sob os gates G2/G3), mantido fail-closed. Vínculo pausado, compartilhamento não vigente e vínculo encerrado recusam com veredictos distintos quando o aluno é ou foi deste personal: respectivamente `403 RELATIONSHIP_PAUSED`, `403 SHARING_GRANT_REQUIRED` e `403 RELATIONSHIP_INACTIVE`. A recusa por compartilhamento não nomeia a categoria que falta, não carrega `fieldErrors` e não permite inferir qual escolha o aluno fez. `RELATIONSHIP_INACTIVE` identifica o vínculo encerrado de um aluno que foi deste personal; os três veredictos nomeados só se aplicam a aluno que é ou foi dele. Um aluno que nunca foi deste personal, ou um identificador que não existe, responde `404 STUDENT_RESOURCE_NOT_FOUND` de forma indistinguível. Uma conta autenticada sem capacidade `PERSONAL` responde `403 FORBIDDEN`. Indisponibilidade da projeção responde `503 PERSONAL_STUDENT_OPERATIONS_UNAVAILABLE`, nunca uma linha vazia. Esta leitura não carrega respostas de anamnese, texto livre de desconforto, diagnóstico, e-mail, telefone ou nota de esforço do treino. Para abrir o relatório pela Orientação, o cliente consulta `listPersonalStudentExerciseReportReferences` com o `studentId` desta linha e escolhe uma chave publicada; nenhuma referência vem de item presumido da fila. Para abrir o bloqueio, o destino chama novamente `getPersonalStudentOperation` com esse `studentId`: a nova resposta autoriza independentemente e fornece `item.prescriptionEligibility` e `blockedSince`, sem depender de a fila ter sido lida. Enquanto o estado é `BLOCKED`, o item `PRESCRIPTION_ELIGIBILITY_BLOCKED` está aberto na fila e `openItemCount` nunca é zero nesse estado — o bloqueio sem a atenção dele é combinação que o servidor nunca emite. `blockedSince` é obrigatório somente quando o estado é `BLOCKED`, e é a mais antiga das razões vigentes, como na fila; com `ELIGIBLE` ele está ausente e as razões estão vazias. Resolver a última razão entre telas não é falha nem afirmação de saúde. Falha ou perda de acesso descarta o conteúdo anterior; referências, cache e leitura anterior nunca concedem acesso ao destino.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Identificador opaco do aluno. O servidor decide a autorização por vínculo; para aluno inexistente ou que nunca pertenceu a este personal, a resposta é indistinguível e não confirma existência.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a projeção operacional de um vínculo
PersonalOperationAPI.getPersonalStudentOperation(studentId: studentId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** | Identificador opaco do aluno. O servidor decide a autorização por vínculo; para aluno inexistente ou que nunca pertenceu a este personal, a resposta é indistinguível e não confirma existência. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentOperationView**](PersonalStudentOperationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentOperations**
```swift
    open class func listPersonalStudentOperations(acceptLanguage: String? = nil, query: String? = nil, relationshipStatus: PersonalPortfolioStatusFilter? = nil, priority: PersonalOperationalPriorityFilter? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentOperationsPage?, _ error: Error?) -> Void)
```

Consultar a carteira operacional de alunos, com busca, filtros e uma linha por vínculo

Consulta global da aba Alunos (`DEC-JORNADA-1`, DOC-STUDENT-JOURNEY-COLLECTIONS): **uma linha por vínculo**, o resumo operacional que a tela precisa para se desenhar, os contadores da consulta inteira já filtrada e continuação por equivalência de leitura. Ela existe para remover o N+1 que obriga o app a chamar a carteira e depois, por aluno, a anamnese e a semana. `asOf` é o instante **do servidor** em que o corte foi calculado e é obrigatório: o cliente o formata no fuso e no locale do dispositivo, nunca o substitui pela hora local e nunca o recalcula. **Esta operação não altera `GET /personal/students`.** A carteira relacional continua sendo a fonte dos vínculos e dos seus estados, e esta consulta a consome — o app **não** concatena páginas da carteira relacional para montar `Todos`. `studentLabel` é o mesmo rótulo, com a mesma proveniência, e os contadores por estado de vínculo continuam publicados uma única vez, em `PersonalRelationshipSummary`. São operações separadas de propósito: regra de treino e estado de saúde não entram no lifecycle do relacionamento. **O recorte é da consulta, não do vínculo, e é explícito por `relationshipStatus`.** `ALL` (padrão) cobre `ACTIVE`, `PAUSED` e `ENDED`; os demais valores estreitam a leitura a um único estado. Em `ACTIVE` a linha leva o resumo dos eixos autorizados e `attentionReasons` completo do vínculo; em `PAUSED` e `ENDED` ela leva **somente** os metadados relacionais que a leitura da carteira já autoriza — nome e rótulo conforme o estado, `pausedBy` na pausa, `endedAt` no encerramento —, nunca ficha, análise, corpo, elegibilidade, treino, contagem de motivos nem instante protegido, e sempre `operationalPriority` `NEUTRAL` com destino `RELATIONSHIP`. **Aceite do termo revogado não remove** (`DEC-PHOME-19`): o vínculo continua ativo e a linha continua, com o bloco de anamnese na variante de acesso negado (`accessDeniedCode: SHARING_GRANT_REQUIRED`, sem estado, data, número ou contagem) e a elegibilidade `BLOCKED` só com `SHARING_GRANT_REQUIRED`; a Orientação desse aluno responde `403 SHARING_GRANT_REQUIRED`. **Busca global por nome, nunca só na página carregada.** `query` é opcional, de 1 a 120 code points após trim; ausente ou vazia não filtra. A normalização é única e do servidor: trim, colapso de espaços Unicode, NFD, remoção de marcas combinantes e casefold independente de locale — `José`, `josé` e `JOSE` casam igual. O casamento é substring literal da chave normalizada sobre o nome autorado e o rótulo, quando ambos autorizados; `%`, `_` e barra **não** viram wildcard. Em `ENDED` a busca olha **somente** o rótulo relacional permitido — nunca o nome atual do ex-aluno. O termo digitado é dado sensível: não entra em métricas, logs nem no token de continuação. O texto original é preservado para exibição, a ordenação segue o critério canônico (nunca relevância de busca) e a UI **não** replica o filtro da coleção. **`priority` filtra a projeção, não substitui o filtro de vínculo.** `URGENT` exige motivo operacional urgentemente autorizado por fonte canônica — contagem, resposta positiva de triagem ou peso ausente não concedem urgência, e o servidor não fabrica `URGENT` para preencher uma demonstração: o filtro pode responder zero grupos. `ATTENTION` exige motivo ou ato pendente conhecido. `CLEAR` exige `ACTIVE`, leitura completa e atual dos eixos autorizados e nenhuma pendência vigente — ausência de motivo não basta, leitura incompleta é `UNKNOWN`, e vínculo inativo é `NEUTRAL` e nunca verde. Uma falha sistêmica de composição responde erro, nunca uma carteira parcialmente verde. **Ordenação total definida pelo servidor.** Grupos com motivos ordenam pelo menor rank da precedência canônica publicada em `PersonalAttentionReasonCode`, depois pelo maior número de motivos abertos; grupos sem motivo ordenam depois de todos os que têm, com o estado como rank explícito (`ACTIVE` antes de `PAUSED` antes de `ENDED`), e `relationshipId` crescente é o desempate total em todos os níveis. Nunca alfabética, nunca por gravidade clínica, nunca por relevância de busca, nunca pelo relógio do dispositivo. **`counts` é da consulta inteira já filtrada**, não da página nem da carteira sem filtro: `matchingActiveRelationshipCount` + `matchingPausedRelationshipCount` + `matchingEndedRelationshipCount` = `matchingRelationshipCount`, e `matchingAttentionReasonCount` nunca é menor que `matchingRelationshipsWithAttentionCount` — uma razão não é uma pessoa e uma fila vazia não prova saúde. Todas as páginas de uma mesma leitura aceita trazem o mesmo `asOf`, `expiresAt`, `querySnapshotId` e `counts`. **Continuação é por equivalência de leitura, com invalidação explícita.** O `cursor` emitido é opaco e autenticado: liga ator, coleção, `queryHash` da consulta normalizada, filtros resolvidos, locale, `asOf`, `expiresAt` absoluto (300 segundos a partir da primeira página, **nunca** prorrogado por continuação), posição e o fingerprint da projeção autorizada completa. `querySnapshotId` deriva autenticamente do mesmo escopo e digest; o cliente não o calcula, não o decodifica e nunca o usa como autorização. A autorização é **atual a cada página**: pausa, encerramento, revogação ou mudança de dados visíveis altera a projeção ou recusa o acesso antes de responder — nenhum snapshot antigo mantém permissão e nenhum payload antigo é guardado para contornar isso. Token adulterado, de outro ator, de outra coleção ou de filtros incompatíveis é `422` com `INVALID_CURSOR`, **sem explicar qual vínculo falhou**; mudança da equivalência da leitura entre páginas é `409 CURSOR_SNAPSHOT_CHANGED` — nada é anexado e a leitura reinicia do início; expiração é `410 CURSOR_EXPIRED`, com o mesmo reinício explícito. `409` e `410` nunca retornam itens, contagens ou dados diagnósticos, e o cliente nunca faz retry automático infinito de cursor. Parâmetro inválido é `422` com `fieldErrors` — nunca clamp silencioso. Uma leitura concluída sem invalidação tem conjunto exato, sem duplicação nem omissão; uma abortada nunca é declarada varredura completa. **Ausência é estado declarado, nunca zero e nunca sucesso implícito.** Sem anamnese é `NO_ANAMNESIS`; sem atribuição vigente é `NO_ASSIGNMENT`; sem sessão concluída, o bloco correspondente simplesmente não existe. Nenhuma dessas ausências é apresentada como sucesso, e nenhuma delas é indisponibilidade: dependência que não responde é `503 PERSONAL_STUDENT_OPERATIONS_UNAVAILABLE`, nunca uma página vazia. **O cliente não calcula.** Elegibilidade, atribuição vigente, prioridade operacional e indicadores chegam decididos pelo servidor. **É estado atual, nunca série histórica.** Nenhum campo desta leitura carrega resposta de anamnese, rascunho ou texto livre. Nenhum carrega diagnóstico, recomendação, escore ou interpretação metodológica. Nenhum carrega aderência, histórico comparável, sequência de sessões ou catálogo de substituição.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let query = "query_example" // String | Termo de busca global sobre a carteira autorizada, de 1 a 120 code points após trim; ausente ou vazio não filtra. A busca alcança todas as páginas da consulta, casa por substring literal sobre nome autorado e rótulo permitido (em `ENDED`, somente o rótulo) e é normalizada somente pelo servidor. O termo é dado sensível: não entra em métricas, logs nem no cursor. (optional)
let relationshipStatus = PersonalPortfolioStatusFilter() // PersonalPortfolioStatusFilter | Recorte de estado do vínculo da consulta. `ALL` (padrão) cobre os três estados; `ACTIVE`, `PAUSED` e `ENDED` estreitam a um só. Faz parte do escopo autenticado do cursor: trocá-lo inicia outra leitura. (optional)
let priority = PersonalOperationalPriorityFilter() // PersonalOperationalPriorityFilter | Recorte de prioridade operacional da consulta, combinado com `relationshipStatus` — nunca o substitui. `ALL` (padrão) não filtra; os demais valores exigem a prioridade publicada em `PersonalOperationalPriority` para a linha. Faz parte do escopo autenticado do cursor. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação emitido por esta operação para esta leitura; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele vincula ator, coleção, consulta normalizada, filtros, locale, fingerprint, `asOf`, `expiresAt` e posição — token adulterado ou de outro escopo é `422` `INVALID_CURSOR`, equivalência alterada é `409`, expiração é `410`. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o máximo é 100. Fora da faixa é `422` com `fieldErrors` — o servidor **nunca** clampa para um limite que o cliente não pediu. (optional) (default to 20)

// Consultar a carteira operacional de alunos, com busca, filtros e uma linha por vínculo
PersonalOperationAPI.listPersonalStudentOperations(acceptLanguage: acceptLanguage, query: query, relationshipStatus: relationshipStatus, priority: priority, cursor: cursor, limit: limit) { (response, error) in
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
 **query** | **String** | Termo de busca global sobre a carteira autorizada, de 1 a 120 code points após trim; ausente ou vazio não filtra. A busca alcança todas as páginas da consulta, casa por substring literal sobre nome autorado e rótulo permitido (em &#x60;ENDED&#x60;, somente o rótulo) e é normalizada somente pelo servidor. O termo é dado sensível: não entra em métricas, logs nem no cursor. | [optional]
 **relationshipStatus** | [**PersonalPortfolioStatusFilter**](.md) | Recorte de estado do vínculo da consulta. &#x60;ALL&#x60; (padrão) cobre os três estados; &#x60;ACTIVE&#x60;, &#x60;PAUSED&#x60; e &#x60;ENDED&#x60; estreitam a um só. Faz parte do escopo autenticado do cursor: trocá-lo inicia outra leitura. | [optional]
 **priority** | [**PersonalOperationalPriorityFilter**](.md) | Recorte de prioridade operacional da consulta, combinado com &#x60;relationshipStatus&#x60; — nunca o substitui. &#x60;ALL&#x60; (padrão) não filtra; os demais valores exigem a prioridade publicada em &#x60;PersonalOperationalPriority&#x60; para a linha. Faz parte do escopo autenticado do cursor. | [optional]
 **cursor** | **String** | Cursor opaco de continuação emitido por esta operação para esta leitura; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele vincula ator, coleção, consulta normalizada, filtros, locale, fingerprint, &#x60;asOf&#x60;, &#x60;expiresAt&#x60; e posição — token adulterado ou de outro escopo é &#x60;422&#x60; &#x60;INVALID_CURSOR&#x60;, equivalência alterada é &#x60;409&#x60;, expiração é &#x60;410&#x60;. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o máximo é 100. Fora da faixa é &#x60;422&#x60; com &#x60;fieldErrors&#x60; — o servidor **nunca** clampa para um limite que o cliente não pediu. | [optional] [default to 20]

### Return type

[**PersonalStudentOperationsPage**](PersonalStudentOperationsPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
