# ExerciseCatalogAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listExerciseCatalog**](ExerciseCatalogAPI.md#listexercisecatalog) | **GET** /exercises | Listar o catálogo canônico de exercícios para autoria do personal


# **listExerciseCatalog**
```swift
    open class func listExerciseCatalog(acceptLanguage: String? = nil, query: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: ExerciseCatalogPage?, _ error: Error?) -> Void)
```

Listar o catálogo canônico de exercícios para autoria do personal

Coleção autenticada e exclusiva do papel PERSONAL. A busca cobre nome do exercício, nome da variante, grupo muscular e contexto de equipamento. A paginação usa cursor opaco e ordem estável definida pelo servidor. O contrato nunca expõe nome, ID, payload ou credencial de provider. A mídia está ligada à ExerciseVariant; sua ausência não impede prescrever ou executar o exercício. `assetId + mediaVersion`, e nunca a URL de entrega, formam a identidade estável para cache. `expiresAt` expira apenas a URL; `offlineValidUntil` limita o direito de retenção offline e possui semântica independente.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let query = "query_example" // String | Busca textual opcional; texto em branco equivale a ausência de filtro. (optional)
let cursor = "cursor_example" // String | Cursor opaco da página anterior; nunca é offset nem ID interpretável pelo cliente. (optional)
let limit = 987 // Int | Tamanho solicitado; padrão 50, máximo 100. (optional) (default to 50)

// Listar o catálogo canônico de exercícios para autoria do personal
ExerciseCatalogAPI.listExerciseCatalog(acceptLanguage: acceptLanguage, query: query, cursor: cursor, limit: limit) { (response, error) in
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
 **query** | **String** | Busca textual opcional; texto em branco equivale a ausência de filtro. | [optional]
 **cursor** | **String** | Cursor opaco da página anterior; nunca é offset nem ID interpretável pelo cliente. | [optional]
 **limit** | **Int** | Tamanho solicitado; padrão 50, máximo 100. | [optional] [default to 50]

### Return type

[**ExerciseCatalogPage**](ExerciseCatalogPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
