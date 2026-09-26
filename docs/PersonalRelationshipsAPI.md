# PersonalRelationshipsAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listPersonalStudents**](PersonalRelationshipsAPI.md#listpersonalstudents) | **GET** /personal/students | Listar a carteira de relacionamentos do personal por estado


# **listPersonalStudents**
```swift
    open class func listPersonalStudents(status: RelationshipStatus, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentPage?, _ error: Error?) -> Void)
```

Listar a carteira de relacionamentos do personal por estado

Carteira de relacionamentos do personal autenticado, **sempre filtrada por um único estado**. `status` é obrigatório de propósito: `ACTIVE`, `PAUSED` e `ENDED` são estados distintos e nenhuma página os mistura, de modo que `PAUSED` não pode ser somado a `ACTIVE` nem a `ENDED` por acidente de leitura. Os contadores de `PersonalRelationshipSummary` usam exatamente os mesmos estados e a mesma semântica desta lista. A paginação é exclusivamente por cursor opaco: o cliente não interpreta o cursor, não existe offset e o servidor é a autoridade exclusiva da ordenação, do limite efetivo e da continuação. O padrão é 20 itens e o máximo é 100. `studentLabel` é **somente** o nome opcional autorado no convite que originou o vínculo. Ele nunca é lido do perfil atual do aluno, e por isso uma relação encerrada não depende do perfil mutável do ex-aluno: o rótulo de uma relação `ENDED` permanece como estava quando a relação existia. A projeção não publica e-mail, telefone, destino do convite, cidade, avatar, contador nem qualquer dado de saúde.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let status = RelationshipStatus() // RelationshipStatus | Estado do vínculo projetado por esta página. Obrigatório: não existe leitura que misture estados, porque uma página mista permitiria somar `PAUSED` a `ACTIVE` ou a `ENDED`.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. (optional) (default to 20)

// Listar a carteira de relacionamentos do personal por estado
PersonalRelationshipsAPI.listPersonalStudents(status: status, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **status** | [**RelationshipStatus**](.md) | Estado do vínculo projetado por esta página. Obrigatório: não existe leitura que misture estados, porque uma página mista permitiria somar &#x60;PAUSED&#x60; a &#x60;ACTIVE&#x60; ou a &#x60;ENDED&#x60;. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. | [optional] [default to 20]

### Return type

[**PersonalStudentPage**](PersonalStudentPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
