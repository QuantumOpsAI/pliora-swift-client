# PersonalOperationAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPersonalStudentOperation**](PersonalOperationAPI.md#getpersonalstudentoperation) | **GET** /personal/students/{studentId}/operation | Ler a projeção operacional de um vínculo
[**listPersonalStudentOperations**](PersonalOperationAPI.md#listpersonalstudentoperations) | **GET** /personal/students/operations | Listar a projeção operacional da carteira de alunos


# **getPersonalStudentOperation**
```swift
    open class func getPersonalStudentOperation(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentOperationView?, _ error: Error?) -> Void)
```

Ler a projeção operacional de um vínculo

Leitura da tela Orientação do aluno para o vínculo identificado por `studentId`. A autorização é decidida pelo servidor a cada leitura, e a resposta usa a mesma linha operacional de `listPersonalStudentOperations`, sem que o cliente varra a projeção paginada nem junte outra leitura para montar a tela. `asOf` é o instante do servidor em que o corte foi calculado e `origin` é sempre `PROJECTION`. Só vínculo `ACTIVE` deste personal, com o compartilhamento em vigor, devolve uma linha. Desde 0.76.0 todo vínculo nasce com o aceite de `SHARE_DATA_WITH_PERSONAL` (`DEC-PHOME-19`), então `SHARING_GRANT_REQUIRED` só tem o gatilho da perda da base de autorização (revogação do termo, sob os gates G2/G3), mantido fail-closed. Vínculo pausado, compartilhamento não vigente e vínculo encerrado recusam com veredictos distintos quando o aluno é ou foi deste personal: respectivamente `403 RELATIONSHIP_PAUSED`, `403 SHARING_GRANT_REQUIRED` e `403 RELATIONSHIP_INACTIVE`. A recusa por compartilhamento não nomeia a categoria que falta, não carrega `fieldErrors` e não permite inferir qual escolha o aluno fez. `RELATIONSHIP_INACTIVE` identifica o vínculo encerrado de um aluno que foi deste personal; os três veredictos nomeados só se aplicam a aluno que é ou foi dele. Um aluno que nunca foi deste personal, ou um identificador que não existe, responde `404 STUDENT_RESOURCE_NOT_FOUND` de forma indistinguível. Uma conta autenticada sem capacidade `PERSONAL` responde `403 FORBIDDEN`. Indisponibilidade da projeção responde `503 PERSONAL_STUDENT_OPERATIONS_UNAVAILABLE`, nunca uma linha vazia. Esta leitura não carrega respostas de anamnese, texto livre de desconforto, diagnóstico, e-mail, telefone ou nota de esforço do treino. Para abrir o relatório pela Orientação, o cliente consulta `listPersonalStudentExerciseReportReferences` com o `studentId` desta linha e escolhe uma chave publicada; nenhuma referência vem de item presumido da fila. Para abrir o bloqueio, o destino chama novamente `getPersonalStudentOperation` com esse `studentId`: a nova resposta autoriza independentemente e fornece `item.prescriptionEligibility` e `blockedSince`, mesmo com `openItemCount = 0`. `blockedSince` é obrigatório somente quando o estado é `BLOCKED`, e é a mais antiga das razões vigentes, como na fila; com `ELIGIBLE` ele está ausente e as razões estão vazias. Resolver a última razão entre telas não é falha nem afirmação de saúde. Falha ou perda de acesso descarta o conteúdo anterior; referências, cache e leitura anterior nunca concedem acesso ao destino.

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
    open class func listPersonalStudentOperations(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentOperationsPage?, _ error: Error?) -> Void)
```

Listar a projeção operacional da carteira de alunos

Projeção operacional da aba Alunos: por vínculo **ativo**, o estado corrente que a tela precisa para se desenhar em **uma** leitura. Ela existe para remover o N+1 que hoje obriga o app a chamar a carteira e depois, por aluno, a anamnese e a semana. `asOf` é o instante **do servidor** em que o corte foi calculado e é obrigatório: o cliente o formata no fuso e no locale do dispositivo, nunca o substitui pela hora local e nunca o recalcula. **Esta operação não altera `GET /personal/students`.** A carteira relacional continua sendo a fonte dos vínculos e dos seus estados, e esta projeção a consome. `studentLabel` é o mesmo rótulo, com a mesma proveniência, e os contadores por estado de vínculo continuam publicados uma única vez, em `PersonalRelationshipSummary`. São operações separadas de propósito: regra de treino e estado de saúde não entram no lifecycle do relacionamento. **O recorte é `ACTIVE`, e ele é a semântica explícita de pausado e encerrado.** `PAUSED` e `ENDED` não entram nesta leitura, não são somados e não viram linha vazia. Pausar ou encerrar o vínculo **remove** aquele aluno da leitura seguinte: ausência declarada, nunca erro desta operação e nunca item com campos zerados. **Aceite do termo revogado não remove** (`DEC-PHOME-19`): o vínculo continua ativo e a linha continua, com o bloco de anamnese na variante de acesso negado (`accessDeniedCode: SHARING_GRANT_REQUIRED`, sem estado, data, número ou contagem) e a elegibilidade `BLOCKED` só com `SHARING_GRANT_REQUIRED`; a Orientação desse aluno responde `403 SHARING_GRANT_REQUIRED`. Quem precisa de `PAUSED` ou de `ENDED` lê a carteira relacional, que continua publicando os três estados sem misturá-los. **Ausência é estado declarado, nunca zero e nunca sucesso implícito.** Sem anamnese é `NO_ANAMNESIS`; sem atribuição vigente é `NO_ASSIGNMENT`; sem sessão concluída, o bloco correspondente simplesmente não existe. Nenhuma dessas ausências é apresentada como sucesso, e nenhuma delas é indisponibilidade: dependência que não responde é `503 PERSONAL_STUDENT_OPERATIONS_UNAVAILABLE`, nunca uma página vazia. **O cliente não calcula.** Elegibilidade, atribuição vigente e quantidade de atenções abertas chegam decididas pelo servidor. A ordenação é total, é definida aqui e é por exceção — nunca alfabética, nunca dependente de copy localizada e nunca do relógio do dispositivo. **A posição do ausente é declarada, e não herdada do banco:** o aluno **sem** item de atenção não tem motivo de maior precedência, e ordena **depois** de todos os que têm, desempatando por `relationshipId` crescente. Sem essa declaração, `ASC` sobre um valor ausente põe esse aluno no fim em um banco e no começo em outro, e duas implementações entregariam a mesma aba — uma liderada por quem precisa de atenção, outra liderada por quem não tem nenhuma. A paginação é exclusivamente por cursor opaco, com padrão de 20 itens e máximo de 100. Esta versão **não** publica parâmetro de ordenação, de filtro nem de busca por texto: a ordem e o recorte são do servidor, e a autoridade de produto não define nenhum dos três. **É estado atual, nunca série histórica.** Nenhum campo desta leitura carrega resposta de anamnese, rascunho ou texto livre. Nenhum carrega diagnóstico, recomendação, escore ou interpretação metodológica. Nenhum carrega aderência, histórico comparável, sequência de sessões ou catálogo de substituição.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele codifica a posição na ordenação total definida por esta operação. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. (optional) (default to 20)

// Listar a projeção operacional da carteira de alunos
PersonalOperationAPI.listPersonalStudentOperations(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele codifica a posição na ordenação total definida por esta operação. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. | [optional] [default to 20]

### Return type

[**PersonalStudentOperationsPage**](PersonalStudentOperationsPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
