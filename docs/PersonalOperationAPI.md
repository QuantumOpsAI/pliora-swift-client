# PersonalOperationAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listPersonalStudentOperations**](PersonalOperationAPI.md#listpersonalstudentoperations) | **GET** /personal/students/operations | Listar a projeção operacional da carteira de alunos


# **listPersonalStudentOperations**
```swift
    open class func listPersonalStudentOperations(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentOperationsPage?, _ error: Error?) -> Void)
```

Listar a projeção operacional da carteira de alunos

Projeção operacional da aba Alunos: por vínculo **ativo**, o estado corrente que a tela precisa para se desenhar em **uma** leitura. Ela existe para remover o N+1 que hoje obriga o app a chamar a carteira e depois, por aluno, a anamnese e a semana. `asOf` é o instante **do servidor** em que o corte foi calculado e é obrigatório: o cliente o formata no fuso e no locale do dispositivo, nunca o substitui pela hora local e nunca o recalcula. **Esta operação não altera `GET /personal/students`.** A carteira relacional continua sendo a fonte dos vínculos e dos seus estados, e esta projeção a consome. `studentLabel` é o mesmo rótulo, com a mesma proveniência, e os contadores por estado de vínculo continuam publicados uma única vez, em `PersonalRelationshipSummary`. São operações separadas de propósito: regra de treino e estado de saúde não entram no lifecycle do relacionamento. **O recorte é `ACTIVE`, e ele é a semântica explícita de pausado, encerrado e acesso removido.** `PAUSED` e `ENDED` não entram nesta leitura, não são somados e não viram linha vazia. Pausar ou encerrar o vínculo **remove** aquele aluno da leitura seguinte, e a remoção de acesso é a mesma ausência: ausência declarada, nunca erro desta operação e nunca item com campos zerados. Quem precisa de `PAUSED` ou de `ENDED` lê a carteira relacional, que continua publicando os três estados sem misturá-los. **Ausência é estado declarado, nunca zero e nunca sucesso implícito.** Sem anamnese é `NO_ANAMNESIS`; sem atribuição vigente é `NO_ASSIGNMENT`; sem sessão concluída, o bloco correspondente simplesmente não existe. Nenhuma dessas ausências é apresentada como sucesso, e nenhuma delas é indisponibilidade: dependência que não responde é `503 PERSONAL_STUDENT_OPERATIONS_UNAVAILABLE`, nunca uma página vazia. **O cliente não calcula.** Elegibilidade, atribuição vigente e quantidade de atenções abertas chegam decididas pelo servidor. A ordenação é total, é definida aqui e é por exceção — nunca alfabética, nunca dependente de copy localizada e nunca do relógio do dispositivo. **A posição do ausente é declarada, e não herdada do banco:** o aluno **sem** item de atenção não tem motivo de maior precedência, e ordena **depois** de todos os que têm, desempatando por `relationshipId` crescente. Sem essa declaração, `ASC` sobre um valor ausente põe esse aluno no fim em um banco e no começo em outro, e duas implementações entregariam a mesma aba — uma liderada por quem precisa de atenção, outra liderada por quem não tem nenhuma. A paginação é exclusivamente por cursor opaco, com padrão de 20 itens e máximo de 100. Esta versão **não** publica parâmetro de ordenação, de filtro nem de busca por texto: a ordem e o recorte são do servidor, e a autoridade de produto não define nenhum dos três. **É estado atual, nunca série histórica.** Nenhum campo desta leitura carrega resposta de anamnese, rascunho ou texto livre. Nenhum carrega diagnóstico, recomendação, escore ou interpretação metodológica. Nenhum carrega aderência, histórico comparável, sequência de sessões ou catálogo de substituição.

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
