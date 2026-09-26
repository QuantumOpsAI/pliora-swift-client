# PersonalHomeAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acknowledgePersonalStudentAnamnesisVersion**](PersonalHomeAPI.md#acknowledgepersonalstudentanamnesisversion) | **POST** /personal/student-anamnesis-versions/{anamnesisVersionId}/acknowledgement | Reconhecer a revisão de uma versão concluída da anamnese
[**acknowledgePersonalStudentDiscomfortReport**](PersonalHomeAPI.md#acknowledgepersonalstudentdiscomfortreport) | **POST** /personal/student-discomfort-reports/{discomfortReportId}/acknowledgement | Reconhecer um relato de desconforto de aluno vinculado
[**getPersonalHome**](PersonalHomeAPI.md#getpersonalhome) | **GET** /personal/home | Ler a projeção de Home do personal
[**listPersonalAttentionItems**](PersonalHomeAPI.md#listpersonalattentionitems) | **GET** /personal/home/attention | Listar a fila de atenção do personal


# **acknowledgePersonalStudentAnamnesisVersion**
```swift
    open class func acknowledgePersonalStudentAnamnesisVersion(idempotencyKey: String, anamnesisVersionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalAnamnesisReviewAcknowledgementView?, _ error: Error?) -> Void)
```

Reconhecer a revisão de uma versão concluída da anamnese

Registra que **aquela versão concluída** foi revisada por **aquele personal**, com autoria e data, e por isso o item `ANAMNESIS_COMPLETED_PENDING_REVIEW` correspondente deixa de ser emitido na próxima leitura da fila. **Por que ela existe, dito sem rodeio.** A autoridade de produto classificava a expiração deste motivo como derivada — o item sairia \"quando aquela versão fosse revisada\" —, mas nenhum documento canônico nomeava o fato de onde essa derivação viria, e nada registrava a revisão. Um motivo cuja condição de saída não tem produtor é um item que entra na fila e nunca sai. O owner decidiu o ato explícito, e este é ele. **É um ato próprio, e não o mesmo do desconforto.** \"Revisei esta versão\" e \"vi este relato\" são afirmações diferentes, sobre objetos diferentes, e por isso têm operações, alvos e famílias de erro separados. Reconhecer um relato de desconforto nunca alcança uma versão de anamnese, e o contrário também não. **O ato afirma exatamente uma coisa — \"eu revisei esta versão\" — e nada além disso.** Ele **não** é julgamento clínico, **não** aprova, valida, homologa ou aceita a anamnese, não declara o aluno apto ou liberado e não move elegibilidade, prontidão ou autorização para publicar prescrição. Nenhuma superfície pode rotulá-lo como aprovado, validado, avaliado ou ok. **É aditivo**, nunca uma atualização destrutiva: a versão concluída permanece imutável, o seu conteúdo não muda e nenhuma versão nova é criada. A resposta confirma o reconhecimento e **não carrega conteúdo da anamnese**: nem seção, nem resposta, nem rascunho, que continua invisível ao personal. **O reconhecimento é por versão, nunca por aluno.** Uma conclusão posterior cria outra versão e produz um item novo, mesmo que a anterior já tenha sido reconhecida. Não existe silenciar aluno, não mostrar mais este tipo nem reconhecimento em lote que alcance versão futura. A unicidade é o par versão + personal, então repetir a operação **converge**: a resposta devolve o reconhecimento já registrado, sem duplicar efeito, sem criar registro novo e sem mover a autoria ou a data originais. Isso é independente da `Idempotency-Key`, que é a convenção transversal de replay do repositório. Não existe desfazer: o cliente não devolve o item à fila. A autorização é o **vínculo ativo** que torna aquela versão legível pelo personal. Quando ele deixou de existir, a resposta é `403 RELATIONSHIP_ACCESS_REVOKED`, deliberadamente distinto de `FORBIDDEN` genérico e de `404 ANAMNESIS_VERSION_NOT_FOUND`: acesso encerrado não é ausência de versão, e nenhum dos dois é indisponibilidade, que é `500 INTERNAL_ERROR`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let anamnesisVersionId = "anamnesisVersionId_example" // String | Identificador público opaco da versão concluída reconhecida — o mesmo `versionId` que `StudentAnamnesisVersionRef` publica no item da fila. É sempre uma versão individual; não existe identificador de aluno, de rascunho ou de coleção nesta posição.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Reconhecer a revisão de uma versão concluída da anamnese
PersonalHomeAPI.acknowledgePersonalStudentAnamnesisVersion(idempotencyKey: idempotencyKey, anamnesisVersionId: anamnesisVersionId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **anamnesisVersionId** | **String** | Identificador público opaco da versão concluída reconhecida — o mesmo &#x60;versionId&#x60; que &#x60;StudentAnamnesisVersionRef&#x60; publica no item da fila. É sempre uma versão individual; não existe identificador de aluno, de rascunho ou de coleção nesta posição. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalAnamnesisReviewAcknowledgementView**](PersonalAnamnesisReviewAcknowledgementView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **acknowledgePersonalStudentDiscomfortReport**
```swift
    open class func acknowledgePersonalStudentDiscomfortReport(idempotencyKey: String, discomfortReportId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalDiscomfortAcknowledgementView?, _ error: Error?) -> Void)
```

Reconhecer um relato de desconforto de aluno vinculado

Registra que **aquele relato** foi visto por **aquele personal**, com autoria e data, e por isso o item `DISCOMFORT_REPORTED` correspondente deixa de ser emitido na próxima leitura da fila. É uma das duas escritas desta superfície: a outra é `acknowledgePersonalStudentAnamnesisVersion`, e reconhecer um relato nunca alcança uma versão de anamnese. **O ato afirma exatamente uma coisa — \"eu vi\" — e nada além disso.** Ele não é julgamento clínico: não avalia, não classifica, não declara ninguém liberado, não fecha ocorrência e não autoriza nem impede publicar prescrição. Nenhuma superfície pode rotulá-lo como resolvido, tratado, avaliado ou ok. **É aditivo sobre o fato estruturado**, nunca uma atualização destrutiva: o relato original permanece intacto, e o seu conteúdo, o histórico da execução e o estado do aluno não mudam. Nenhum campo transporta o texto livre escrito pelo aluno, que não é lido, não é copiado e continua legível somente por quem o escreveu, nesta operação e na projeção da fila. **O reconhecimento é por relato, nunca por aluno.** Um relato novo volta a aparecer mesmo que o anterior já tenha sido reconhecido, ainda que do mesmo aluno, do mesmo exercício e do mesmo dia. Não existe silenciar aluno, não mostrar mais este tipo nem reconhecimento em lote que alcance relato futuro. A unicidade é o par relato + personal, então repetir a operação **converge**: a resposta devolve o reconhecimento já registrado, sem duplicar efeito, sem criar registro novo e sem mover a autoria ou a data originais. Isso é independente da `Idempotency-Key`, que é a convenção transversal de replay do repositório. Não existe desfazer: o cliente não devolve o item à fila. A autorização é o **vínculo ativo** que torna aquele relato legível pelo personal. Quando ele deixou de existir, a resposta é `403 RELATIONSHIP_ACCESS_REVOKED`, que é deliberadamente distinto de `FORBIDDEN` genérico e de `404 DISCOMFORT_REPORT_NOT_FOUND`: acesso encerrado não é ausência de relato, e nenhum dos dois é indisponibilidade, que é `500 INTERNAL_ERROR`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let discomfortReportId = "discomfortReportId_example" // String | Identificador público opaco do relato reconhecido. É sempre um relato individual; não existe identificador de aluno, de sessão ou de coleção nesta posição.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Reconhecer um relato de desconforto de aluno vinculado
PersonalHomeAPI.acknowledgePersonalStudentDiscomfortReport(idempotencyKey: idempotencyKey, discomfortReportId: discomfortReportId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **discomfortReportId** | **String** | Identificador público opaco do relato reconhecido. É sempre um relato individual; não existe identificador de aluno, de sessão ou de coleção nesta posição. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalDiscomfortAcknowledgementView**](PersonalDiscomfortAcknowledgementView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalHome**
```swift
    open class func getPersonalHome(acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalHomeView?, _ error: Error?) -> Void)
```

Ler a projeção de Home do personal

Projeção própria da raiz do espaço do personal autenticado. Ela existe para que o app **não** precise juntar carteira, anamnese, elegibilidade, prescrição e execução para desenhar a primeira tela: o servidor publica o corte já resolvido. `asOf` é o instante **do servidor** em que o corte foi calculado e é obrigatório. A Home é uma foto, não um fluxo: sem `asOf` uma leitura de três dias atrás e uma de três segundos atrás seriam indistinguíveis. O cliente **formata** `asOf` no fuso e no locale do dispositivo; ele nunca o substitui pela hora local, nunca o recalcula e nunca o arredonda. Atualização é request/response — abrir a tela, retomar o app e puxar para atualizar —, e nada aqui transporta push, WebSocket, long-polling ou estado de sincronização. Os três contadores e o indicador de convite separam, sem ambiguidade, os estados que a tela precisa distinguir: **sem alunos** (`activeStudentCount` zero e `hasPendingStudentInvitations` falso), **somente convites pendentes** (`activeStudentCount` zero e `hasPendingStudentInvitations` verdadeiro), **sem item de atenção** (`activeStudentCount` positivo e `attentionItemCount` zero) e **com atenção** (`attentionItemCount` positivo). **Ausência de item não é estado saudável.** `attentionItemCount` zero significa exatamente que nada atingiu um dos limiares publicados nesta leitura, e nenhuma superfície pode convertê-lo em afirmação sobre a saúde, a aderência ou o bem-estar de quem quer que seja. Indisponibilidade também nunca vira zero: dependência que não responde é `503 PERSONAL_HOME_UNAVAILABLE`, nunca uma projeção com contadores zerados — não saber se existem alunos ou convites é diferente de saber que não existem. A projeção não carrega texto livre, conteúdo de anamnese, diagnóstico, recomendação, escore nem copy localizada: os números viajam, a frase é do cliente.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a projeção de Home do personal
PersonalHomeAPI.getPersonalHome(acceptLanguage: acceptLanguage) { (response, error) in
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

[**PersonalHomeView**](PersonalHomeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalAttentionItems**
```swift
    open class func listPersonalAttentionItems(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalAttentionPage?, _ error: Error?) -> Void)
```

Listar a fila de atenção do personal

Fila determinística do personal autenticado, paginada por cursor opaco. Ela é **projeção derivada e reconstruível**: apagar e recalcular a partir dos fatos preservados produz exatamente a mesma fila, na mesma ordem. Não é entidade armazenada, não é agregado próprio, não é histórico e não é caixa de entrada. **A unidade da fila é o item, não a pessoa.** Um mesmo aluno pode aparecer em itens diferentes, e o cliente não os agrupa por aluno. Quantos itens um motivo produz por aluno depende do discriminante da sua chave de deduplicação, e ele **não** é uniforme: `DISCOMFORT_REPORTED` gera um item por relato ainda não reconhecido; `ANAMNESIS_COMPLETED_PENDING_REVIEW`, um por versão concluída ainda não revisada; `LOAD_DIVERGENCE_RECURRING`, um por exercício com variante e equipamento; `EXERCISE_SUBSTITUTION_RECURRING`, um por exercício com motivo de substituição; e `PRESCRIPTION_ELIGIBILITY_BLOCKED` gera **exatamente um** item por vínculo, com as razões vigentes acumuladas nos parâmetros — discriminar por razão produziria vários itens sobre a mesma decisão. **Ordenação total, definida pelo servidor, em três níveis**: precedência do `reasonCode` (a ordem em que `PersonalAttentionReasonCode` os publica, de 1 a 5), depois `occurredAt` decrescente, depois `itemId` crescente. O terceiro nível existe para que a ordem seja total: sem ele a paginação por cursor poderia repetir ou pular um item entre páginas. Nenhum nível usa o relógio do dispositivo — todos os instantes são do servidor, e o cliente apenas formata. A ordem não é alfabética e não depende de copy. **Expiração é ausência, não estado.** O item deixa de ser emitido quando a condição que o originou deixa de ser satisfeita, e isso aparece como a simples ausência dele na leitura seguinte: nunca como item marcado, riscado ou resolvido. O cliente não remove da fila o que o servidor ainda emite, e não existe \"novo\", \"não lido\", badge nem histórico de itens que já saíram. O mesmo vale para o vínculo que deixa de autorizar a leitura: o item some da próxima leitura e o seu destino deixa de ser navegável — isso é ausência, e não erro desta operação. **Dois motivos não expiram sozinhos e saem por ato explícito do personal**, cada um com a sua mutação própria, porque \"vi este relato\" e \"revisei esta versão\" são afirmações diferentes sobre objetos diferentes. `DISCOMFORT_REPORTED` sai por `acknowledgePersonalStudentDiscomfortReport`: nenhum relato expira por decurso de tempo, por sessão posterior ou por um relato mais novo. `ANAMNESIS_COMPLETED_PENDING_REVIEW` sai por `acknowledgePersonalStudentAnamnesisVersion`: a revisão de uma versão concluída não é um fato que o ciclo produza sozinho, e sem o ato o item entraria na fila e nunca sairia. Os outros três continuam derivados — o bloqueio cessa, a janela anda — e não precisam de reconhecimento nenhum. **A fila transporta parâmetros, nunca a frase.** Cada item carrega o conjunto estruturado que permite reconstruir por que ele apareceu — qual fato, qual janela, qual contagem, qual limiar — discriminado pelo `reasonCode`, e um item que não consiga se explicar não é emitido. Nenhum campo aqui carrega texto livre de pessoa usuária, conteúdo de anamnese, diagnóstico, recomendação, escore ou copy localizada. O destino de cada item é **semântico**: o servidor diz para onde, e a rota é do app; nenhum campo transporta rota, deep link ou caminho de navegação. **O que esta leitura deliberadamente não publica:** o histórico comparável item a item e o catálogo de opções de substituição continuam sem superfície. O que os motivos 4 e 5 publicam é o **fato agregado** que sustenta o limiar — a carga prescrita e a executada da ocorrência mais recente, a contagem observada e o tamanho da janela —, nunca a sequência de sessões nem a lista de alternativas.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele codifica a posição na ordenação total definida por esta operação. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. (optional) (default to 20)

// Listar a fila de atenção do personal
PersonalHomeAPI.listPersonalAttentionItems(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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

[**PersonalAttentionPage**](PersonalAttentionPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
