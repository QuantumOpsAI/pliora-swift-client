# PersonalDestinationAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getPersonalStudentDiscomfortReport**](PersonalDestinationAPI.md#getpersonalstudentdiscomfortreport) | **GET** /personal/student-discomfort-reports/{discomfortReportId} | Ler um relato estruturado de desconforto, no contexto protegido do vínculo
[**listPersonalStudentExerciseReportReferences**](PersonalDestinationAPI.md#listpersonalstudentexercisereportreferences) | **GET** /personal/students/{studentId}/exercise-report-references | Escolher um exercício comparável para o relatório pela Orientação
[**listPersonalStudentExerciseSessionHistory**](PersonalDestinationAPI.md#listpersonalstudentexercisesessionhistory) | **GET** /personal/students/{studentId}/exercise-session-history | Ler o histórico sessão a sessão de um exercício comparável do aluno


# **getPersonalStudentDiscomfortReport**
```swift
    open class func getPersonalStudentDiscomfortReport(discomfortReportId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentDiscomfortReportView?, _ error: Error?) -> Void)
```

Ler um relato estruturado de desconforto, no contexto protegido do vínculo

Leitura sem efeito colateral de **um relato individual**, endereçado pelo seu identificador e autorizada pelo **vínculo ativo** que o torna legível por este personal. É o contexto protegido de um relato — nunca \"os desconfortos do aluno\", nunca uma lista por pessoa e nunca uma agregação. **Ela existe porque o destino tem de ter leitura própria.** Abrir a prancha carregando apenas o que o item da fila já trazia transformaria a autorização do destino numa decisão de cliente, e faria a tela quebrar numa recarga, num retorno de segundo plano ou numa entrada direta. A autorização é verificada no servidor, a cada leitura, e **falha fechado**: sem decisão do servidor não há conteúdo. **Nenhum campo novo é criado para o fato do relato.** `report` é exatamente a mesma estrutura que a fila já publica em `PersonalAttentionDiscomfortParameters`, reusada sem alteração — `area`, `sensation` e `intensity` são os mesmos conjuntos de `ExecutionDiscomfortReportPayload`. Republicar esses mesmos campos numa forma própria criaria um segundo ponto de verdade sobre um fato que este contrato já descreve. **O texto livre escrito pelo aluno não trafega aqui, em hipótese nenhuma**, e nenhum campo sinaliza que ele existe: um \"o aluno escreveu uma observação\" devolveria, em forma de metadado, exatamente a informação que a regra retira. A observação permanece legível somente por quem a escreveu. A ausência é **por construção**, não filtro de cliente. **O que ela acrescenta ao fato são duas coisas, e só elas:** o contexto de execução daquele exercício naquela sessão, dentro do conteúdo mínimo já fixado para o acompanhamento, e o **estado de reconhecimento** daquele relato — autoria e instante, reusando a projeção que o próprio ato já publica, com `null` quando ninguém reconheceu ainda. `null` é ausência de ato, nunca negação e nunca zero. **Nada aqui é juízo.** A leitura não avalia, não classifica risco, não diagnostica, não declara ninguém liberado e não carrega rótulo de desfecho — \"resolvido\", \"tratado\", \"avaliado\", \"ok\", \"liberado\" não existem nesta superfície. Ela também não agrega relatos em gravidade: não há contagem, média de intensidade, área mais frequente nem série estatística. Intensidade é o valor declarado num relato. Um relato inexistente e um relato de outro personal respondem de forma indistinguível. `403 RELATIONSHIP_ACCESS_REVOKED` é deliberadamente distinto de `FORBIDDEN` genérico e de `404 DISCOMFORT_REPORT_NOT_FOUND`: acesso encerrado não é ausência de relato, e nenhum dos dois é indisponibilidade, que é `500 INTERNAL_ERROR`. **Falha nunca se apresenta como ausência de desconforto.**

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let discomfortReportId = "discomfortReportId_example" // String | Identificador público opaco do relato lido. É sempre um relato individual — o mesmo alvo que `acknowledgePersonalStudentDiscomfortReport` reconhece e que o item da fila publica. Não existe identificador de aluno, de sessão ou de coleção nesta posição.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler um relato estruturado de desconforto, no contexto protegido do vínculo
PersonalDestinationAPI.getPersonalStudentDiscomfortReport(discomfortReportId: discomfortReportId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **discomfortReportId** | **String** | Identificador público opaco do relato lido. É sempre um relato individual — o mesmo alvo que &#x60;acknowledgePersonalStudentDiscomfortReport&#x60; reconhece e que o item da fila publica. Não existe identificador de aluno, de sessão ou de coleção nesta posição. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentDiscomfortReportView**](PersonalStudentDiscomfortReportView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentExerciseReportReferences**
```swift
    open class func listPersonalStudentExerciseReportReferences(studentId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentExerciseReportReferencesPage?, _ error: Error?) -> Void)
```

Escolher um exercício comparável para o relatório pela Orientação

Coleção delimitada ao vínculo ativo atual do personal com o aluno, autorizada pelo servidor a cada página. Não depende de atenção aberta. O `studentId` vem de `getPersonalStudentOperation.item.studentId`. Esta leitura acontece na ação de escolher exercício, não na composição da tela Orientação. O conjunto contém as chaves distintas de exercícios das versões publicadas para este vínculo e as chaves efetivamente executadas em sessões deste mesmo vínculo. Na referência, `exerciseId` é o `prescribedExerciseId` da versão publicada, a identidade que o relatório já recebe, nunca o identificador do catálogo. A chave prescrita usa `prescribedVariantId` como `variantId`, sem inventar contexto de equipamento quando a prescrição não o registra. Uma chave executada preserva a identidade prescrita, a variante efetivamente executada e o contexto registrado na execução; não os substitui pelos da variante prescrita. Rascunhos, modelos, planos de outro vínculo e histórico de outro personal nunca entram. A chave é exercício + variante + contexto de equipamento; contexto ausente não é curinga e não mistura equipamentos. Rótulos vêm do conteúdo autorado preservado na versão da prescrição que identifica o exercício ou sua alternativa autorizada, nunca de cache do catálogo. Cada trio aparece uma vez. Se um rótulo indispensável não puder ser recuperado, a leitura falha; não inventa rótulo nem omite silenciosamente uma chave para fabricar conjunto vazio. O cliente escolhe uma chave recebida e chama `listPersonalStudentExerciseSessionHistory` usando o mesmo `studentId`, `exerciseId`, `variantId` e, somente se presente, `equipmentContextKey`. Não inventa variante, equipamento, execução ou exercício padrão. O relatório relê e autoriza independentemente: referências não concedem acesso. Chave desconhecida e chave fora deste vínculo são recusadas de modo indistinguível, sem confirmar existência, no relatório. Ordem total crescente por `exerciseId`, `variantId` e `equipmentContextKey` (ausente antes de presente), sem duplicar a mesma chave. Paginação por cursor opaco emitido pelo servidor e vinculado à conta, vínculo e coleção; nunca offset. O cliente não fabrica cursor nem soma contagens. Página vazia tem `nextCursor` nulo e significa apenas ausência de referências nesta leitura, nunca zero de execução ou bem-estar. Indisponibilidade responde erro, nunca coleção vazia. A falha da projeção é `503 PERSONAL_STUDENT_OPERATIONS_UNAVAILABLE`; falha transversal de sessão é `503 SERVICE_UNAVAILABLE`, como na lista operacional. A autorização e as recusas reutilizam a leitura individual: aluno inexistente e aluno que nunca foi deste personal recebem o mesmo 404. Para vínculo próprio, os motivos da recusa não carregam categoria de compartilhamento, conteúdo protegido ou prosa sobre escolhas do aluno. Falha ou perda de acesso entre telas descarta conteúdo anterior; não há autorização por cache.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Identificador recebido na leitura individual da Orientação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação emitido nesta coleção para esta conta e vínculo. (optional)
let limit = 987 // Int | Quantidade solicitada por página, limitada pelo servidor. (optional) (default to 20)

// Escolher um exercício comparável para o relatório pela Orientação
PersonalDestinationAPI.listPersonalStudentExerciseReportReferences(studentId: studentId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **studentId** | **String** | Identificador recebido na leitura individual da Orientação. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco de continuação emitido nesta coleção para esta conta e vínculo. | [optional]
 **limit** | **Int** | Quantidade solicitada por página, limitada pelo servidor. | [optional] [default to 20]

### Return type

[**PersonalStudentExerciseReportReferencesPage**](PersonalStudentExerciseReportReferencesPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentExerciseSessionHistory**
```swift
    open class func listPersonalStudentExerciseSessionHistory(studentId: String, exerciseId: String, variantId: String, acceptLanguage: String? = nil, equipmentContextKey: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentExerciseSessionHistoryPage?, _ error: Error?) -> Void)
```

Ler o histórico sessão a sessão de um exercício comparável do aluno

Leitura sem efeito colateral do **histórico sessão a sessão** de um exercício comparável de um aluno do vínculo ativo, paginada por cursor opaco, com `asOf` do servidor. Ela é a superfície que o destino `STUDENT_EXERCISE_EXECUTION_REPORT` abre **no exercício em questão**, não na visão geral do aluno. **Decisão do owner de 2026-09-20, e o estado que ela supera.** Até aquela data o histórico sessão a sessão **não tinha superfície nenhuma**, e este contrato o declarava na descrição de `PersonalAttentionLoadDivergenceParameters`: o item da fila publica o **fato agregado** que sustenta o limiar — a carga prescrita e a executada da ocorrência mais recente — e mais nada. O owner decidiu que o relatório mostra o histórico sessão a sessão, não apenas a divergência que motivou o item, e esta operação é essa superfície. **O item não mudou**: a série continua não entrando por ele, e continua sendo leitura própria de destino. **A chave de comparabilidade é o trio exercício + variante + contexto de equipamento.** Cargas de variantes ou de contextos de equipamento diferentes **nunca** são somadas, mediadas nem apresentadas como a mesma série, e unidade divergente nunca é convertida. O vocabulário de ausência é reusado, não recriado: `comparisonStatus` é o `ComparisonStatus` já publicado — o enum, não a leitura de sync em que ele aparece hoje. **A paginação é exclusivamente por cursor opaco**, na convenção do repositório: o cliente não interpreta o cursor, não o constrói, não o trata como offset e **não soma contagens entre páginas**. `nextCursor` é nulo na última página. A ordem é do servidor, do mais recente para o mais antigo, e é total. **O que esta leitura nunca publica, e a proibição é de contrato, não de tela:** **aderência** em nenhuma forma — nem percentual, nem semanal, nem \"X de Y treinos\"; **veredicto de melhor execução**, porque maior carga não é sinônimo de melhor resultado e o produto não ordena `30 kg x 3` contra `25 kg x 12`; **estatística de sessão promovida a métrica** — média, total ou tendência — nem escore; **classificação de risco**; e **texto livre de desconforto, conteúdo de anamnese, de triagem ou de consentimento**, em nenhum campo. Ela também não emite interpretação: \"aumentar a carga\", \"o aluno regrediu\" e equivalentes são decisão metodológica do personal, não do produto. O bloco `projections` publica somente as projeções determinísticas autorizadas — última execução comparável, divergência recorrente, direção numérica de progressão ou regressão e substituição recorrente —, sempre com selo `PROJECTION` e janela do servidor. A direção numérica nunca vira interpretação sobre a pessoa. **Ausência nunca vira zero e nunca afirma saúde.** Exercício sem carga prescrita não tem comparação, e nenhum valor presumido é preenchido para destravá-la: os dois lados do par são explicitamente anuláveis. Lista vazia é exatamente \"não há execução comparável nesta chave nesta leitura\" — nunca indisponibilidade, nunca \"está indo bem\" e nunca uma afirmação sobre a pessoa. Um aluno inexistente e um aluno de outra relação respondem de forma indistinguível. `403 RELATIONSHIP_ACCESS_REVOKED` é distinto de `FORBIDDEN` genérico e de `404 STUDENT_NOT_FOUND`, e nenhum dos três é indisponibilidade, que é `500 INTERNAL_ERROR`. **Falha nunca se apresenta como série vazia.** Pela Orientação, os parâmetros vêm de `listPersonalStudentExerciseReportReferences`. A cada leitura o servidor verifica também que a chave pertence ao vínculo atual; chave desconhecida e chave de outro vínculo respondem o mesmo `422 VALIDATION_ERROR`, sem confirmar existência. Uma referência recebida antes não concede acesso. Contexto de equipamento ausente não é curinga: só alcança chaves em que o contexto não discrimina. Nenhuma resposta nova de perda de acesso é acrescentada aqui por esta entrada de navegação.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let exerciseId = "exerciseId_example" // String | Exercício comparável. Primeiro membro da chave de comparabilidade; a leitura é sempre de um exercício, nunca do aluno inteiro.
let variantId = "variantId_example" // String | Variante do exercício. Segundo membro da chave: o histórico da variante A nunca traz execução da variante B, e a série jamais junta as duas.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let equipmentContextKey = "equipmentContextKey_example" // String | Contexto de equipamento que fecha a chave de comparabilidade, quando ele for materialmente relevante. Código de máquina estável, **nunca nome de aparelho exibível**. Ausente quando não discrimina; ausência aqui é ausência, e nunca um equipamento padrão presumido. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele codifica a posição na ordenação total definida por esta operação. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. (optional) (default to 20)

// Ler o histórico sessão a sessão de um exercício comparável do aluno
PersonalDestinationAPI.listPersonalStudentExerciseSessionHistory(studentId: studentId, exerciseId: exerciseId, variantId: variantId, acceptLanguage: acceptLanguage, equipmentContextKey: equipmentContextKey, cursor: cursor, limit: limit) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo ativo do personal autenticado. |
 **exerciseId** | **String** | Exercício comparável. Primeiro membro da chave de comparabilidade; a leitura é sempre de um exercício, nunca do aluno inteiro. |
 **variantId** | **String** | Variante do exercício. Segundo membro da chave: o histórico da variante A nunca traz execução da variante B, e a série jamais junta as duas. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **equipmentContextKey** | **String** | Contexto de equipamento que fecha a chave de comparabilidade, quando ele for materialmente relevante. Código de máquina estável, **nunca nome de aparelho exibível**. Ausente quando não discrimina; ausência aqui é ausência, e nunca um equipamento padrão presumido. | [optional]
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele codifica a posição na ordenação total definida por esta operação. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. | [optional] [default to 20]

### Return type

[**PersonalStudentExerciseSessionHistoryPage**](PersonalStudentExerciseSessionHistoryPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
