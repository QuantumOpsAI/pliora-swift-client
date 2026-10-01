# ExerciseCatalogAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deletePersonalExerciseFavorite**](ExerciseCatalogAPI.md#deletepersonalexercisefavorite) | **DELETE** /personal/exercise-favorites/{ref} | Desfavoritar um exercício
[**getExerciseCatalogFilters**](ExerciseCatalogAPI.md#getexercisecatalogfilters) | **GET** /exercises/filters | Ler as opções de cada filtro de exercício
[**getExerciseCatalogItem**](ExerciseCatalogAPI.md#getexercisecatalogitem) | **GET** /exercises/{ref} | Ler o detalhe de um exercício
[**getPersonalExerciseMediaPreference**](ExerciseCatalogAPI.md#getpersonalexercisemediapreference) | **GET** /personal/exercise-media-preference | Ler a preferência de vídeo do personal
[**listExerciseCatalog**](ExerciseCatalogAPI.md#listexercisecatalog) | **GET** /exercises | Buscar exercícios, com filtros, para a autoria do personal
[**listPersonalExerciseFavorites**](ExerciseCatalogAPI.md#listpersonalexercisefavorites) | **GET** /personal/exercise-favorites | Listar os exercícios favoritos do personal
[**listPersonalRecentExercises**](ExerciseCatalogAPI.md#listpersonalrecentexercises) | **GET** /personal/recent-exercises | Listar os exercícios que o personal já prescreveu
[**putPersonalExerciseFavorite**](ExerciseCatalogAPI.md#putpersonalexercisefavorite) | **PUT** /personal/exercise-favorites/{ref} | Favoritar um exercício
[**putPersonalExerciseMediaPreference**](ExerciseCatalogAPI.md#putpersonalexercisemediapreference) | **PUT** /personal/exercise-media-preference | Salvar a preferência de vídeo do personal
[**resolveExerciseReferences**](ExerciseCatalogAPI.md#resolveexercisereferences) | **POST** /exercises/references | Resolver referências opacas de catálogo em exercício e variante prescritíveis


# **deletePersonalExerciseFavorite**
```swift
    open class func deletePersonalExerciseFavorite(idempotencyKey: String, ref: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Desfavoritar um exercício

Remove o exercício dos favoritos do personal autenticado, de forma idempotente: desfavoritar o que não é favorito responde `204` outra vez, sem efeito. Não apaga o exercício nem a referência dele, e nenhuma prescrição muda. Uma referência que o servidor não reconhece é `404 EXERCISE_NOT_FOUND`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ref = "ref_example" // String | Referência do exercício a favoritar ou desfavoritar: `exerciseId` ou `catalogRef`.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Desfavoritar um exercício
ExerciseCatalogAPI.deletePersonalExerciseFavorite(idempotencyKey: idempotencyKey, ref: ref, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ref** | **String** | Referência do exercício a favoritar ou desfavoritar: &#x60;exerciseId&#x60; ou &#x60;catalogRef&#x60;. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExerciseCatalogFilters**
```swift
    open class func getExerciseCatalogFilters(acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseCatalogFilters?, _ error: Error?) -> Void)
```

Ler as opções de cada filtro de exercício

Devolve, para cada filtro de `listExerciseCatalog`, as opções que a origem oferece: `code` opaco, que o app repassa no parâmetro do filtro, e `label` `server_localized`, que o app exibe como veio. Os códigos são **vocabulário aberto** lido da origem: nenhum deles é enum do contrato, e o app nunca os interpreta nem os traduz. Cada filtro aparece no máximo uma vez, e uma opção existe no máximo uma vez dentro do seu filtro. `count` é a contagem **global** da opção, no catálogo inteiro, e só vem quando a origem a informa; ela não considera os outros filtros selecionados — quem diz quantos exercícios a combinação atual traz é `total` em `listExerciseCatalog`. Ausência de `count` significa \"não sei\", nunca zero. Os rótulos seguem o idioma que a origem serve; `Content-Language` declara o locale das opções, que pode ser `en-US` com `Accept-Language: pt-BR` enquanto a origem só servir inglês. O `label` de cada grupo segue o mesmo locale das opções daquele grupo, e o app pode localizar o nome do grupo pelo enum `filter` se preferir. Origem fora do ar ou cota esgotada respondem `503 EXERCISE_CATALOG_UNAVAILABLE`, e nunca uma lista de filtros vazia.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler as opções de cada filtro de exercício
ExerciseCatalogAPI.getExerciseCatalogFilters(acceptLanguage: acceptLanguage) { (response, error) in
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

[**ExerciseCatalogFilters**](ExerciseCatalogFilters.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExerciseCatalogItem**
```swift
    open class func getExerciseCatalogItem(ref: String, acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseCatalogDetail?, _ error: Error?) -> Void)
```

Ler o detalhe de um exercício

Detalhe sem efeito colateral de um exercício: nome, atributos, `steps[]` em ordem, a mídia com `angle` e `demonstrator` por asset e `similarQuery`, o conjunto de filtros que reproduz \"similares\" na busca — o servidor não devolve lista montada de substitutos. Músculos secundários só existem em exercício próprio. Cada atributo vem só quando a origem o informa. `media` lista os assets disponíveis com a mesma forma de `ExerciseMediaAsset` que o aluno recebe; vídeo nunca é pré-requisito de prescrever, e nenhuma mídia é pedida à origem antes de o app iniciar a reprodução. Um exercício que não existe, que a identidade autenticada não pode ler ou cuja referência é malformada respondem de forma indistinguível, `404 EXERCISE_NOT_FOUND`. Origem fora do ar ou cota esgotada respondem `503 EXERCISE_CATALOG_UNAVAILABLE` com o motivo, e o app mantém utilizável o exercício que já está num plano, porque o rótulo é da prescrição. Os textos de um exercício do catálogo seguem o idioma que a origem serve, e `Content-Language` declara o locale desse texto, como em `listExerciseCatalog`; o texto autoral de um exercício próprio é `authored_preserved` e não segue o cabeçalho.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ref = "ref_example" // String | Referência do exercício: o `exerciseId` quando o item o traz, ou o `catalogRef` quando ainda não há referência. Opaca nos dois casos.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o detalhe de um exercício
ExerciseCatalogAPI.getExerciseCatalogItem(ref: ref, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ref** | **String** | Referência do exercício: o &#x60;exerciseId&#x60; quando o item o traz, ou o &#x60;catalogRef&#x60; quando ainda não há referência. Opaca nos dois casos. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**ExerciseCatalogDetail**](ExerciseCatalogDetail.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalExerciseMediaPreference**
```swift
    open class func getPersonalExerciseMediaPreference(acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseMediaPreferenceView?, _ error: Error?) -> Void)
```

Ler a preferência de vídeo do personal

O `demonstrator` e o `angle` padrão do personal para o vídeo de exercício. Os dois são opcionais e valem como **preferência**, nunca como filtro: um exercício que não tem o asset preferido mostra o que tem. Quem nunca escolheu recebe os dois nulos, com uma `revision` ainda assim. O aluno não usa esta preferência: ele troca no player.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a preferência de vídeo do personal
ExerciseCatalogAPI.getPersonalExerciseMediaPreference(acceptLanguage: acceptLanguage) { (response, error) in
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

[**ExerciseMediaPreferenceView**](ExerciseMediaPreferenceView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExerciseCatalog**
```swift
    open class func listExerciseCatalog(acceptLanguage: String? = nil, query: String? = nil, muscle: String? = nil, equipment: String? = nil, grip: String? = nil, difficulty: String? = nil, mechanic: String? = nil, force: String? = nil, origin: Origin_listExerciseCatalog? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: ExerciseCatalogPage?, _ error: Error?) -> Void)
```

Buscar exercícios, com filtros, para a autoria do personal

Busca autenticada e exclusiva do papel PERSONAL, declarado em `security` (`BearerAuth` com o papel `PERSONAL`); qualquer outra identidade autenticada recebe `403 FORBIDDEN`. O contrato é **agnóstico de origem**: os mesmos parâmetros e o mesmo item servem a consulta feita na hora à origem do catálogo e qualquer catálogo próprio futuro. O que a origem não entrega na linha da lista **vem ausente, nunca inventado**. Nenhum nome, ID, payload ou credencial de provider aparece aqui, e nenhum vocabulário de provider é enum. `origin=CATALOG` (padrão) consulta o catálogo, e a ordem é a da origem: relevância quando há `query`; não existe parâmetro de ordenação. `origin=PERSONAL` busca nos exercícios do próprio personal, ignorando acento e caixa, em ordem de nome; nela só `query` se aplica, e um filtro informado é `422 VALIDATION_FAILED` em vez de ser ignorado em silêncio. `muscle`, `equipment`, `grip`, `difficulty`, `mechanic` e `force` recebem **um código opaco por filtro**, copiado das opções de `getExerciseCatalogFilters`; os informados valem juntos. O cursor é opaco e carrega a posição na origem. `total` só vem quando a origem informa a contagem da combinação atual; sua ausência significa \"não sei\", nunca zero. **A lista nunca devolve mídia, URL ou imagem**: vídeo e passos pertencem a `getExerciseCatalogItem`. **Catálogo indisponível não é lista vazia.** Origem fora do ar ou cota esgotada respondem `503 EXERCISE_CATALOG_UNAVAILABLE` com o motivo; `items: []` com `200` significa somente \"nenhum exercício com esses critérios\". **Idioma.** Os textos de um exercício do catálogo vêm no idioma que a origem serve, e `Content-Language` declara o locale desse texto: enquanto a origem só serve inglês, a resposta declara `en-US` mesmo com `Accept-Language: pt-BR`. O texto autoral — o nome e os atributos de um exercício próprio — é `authored_preserved` e **não segue o cabeçalho**, inclusive quando a mesma resposta mistura exercício próprio com item do catálogo. O app exibe o texto como veio, sem traduzir e sem compará-lo com rótulo de filtro.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let query = "query_example" // String | Busca textual opcional; texto em branco equivale a ausência de filtro. (optional)
let muscle = "muscle_example" // String | Código opaco da opção de músculo, de `getExerciseCatalogFilters`. Um valor. (optional)
let equipment = "equipment_example" // String | Código opaco da opção de equipamento, de `getExerciseCatalogFilters`. Um valor. (optional)
let grip = "grip_example" // String | Código opaco da opção de pegada, de `getExerciseCatalogFilters`. Um valor. (optional)
let difficulty = "difficulty_example" // String | Código opaco da opção de dificuldade, de `getExerciseCatalogFilters`. Um valor. (optional)
let mechanic = "mechanic_example" // String | Código opaco da opção de mecânica, de `getExerciseCatalogFilters`. Um valor. (optional)
let force = "force_example" // String | Código opaco da opção de tipo de força, de `getExerciseCatalogFilters`. Um valor. (optional)
let origin = "origin_example" // String | Onde buscar: `CATALOG` (padrão), o catálogo consultado na hora, ou `PERSONAL`, os exercícios do próprio personal. (optional) (default to .catalog)
let cursor = "cursor_example" // String | Cursor opaco da página anterior; nunca é offset nem ID interpretável pelo cliente. (optional)
let limit = 987 // Int | Tamanho solicitado; padrão 50, máximo 100. (optional) (default to 50)

// Buscar exercícios, com filtros, para a autoria do personal
ExerciseCatalogAPI.listExerciseCatalog(acceptLanguage: acceptLanguage, query: query, muscle: muscle, equipment: equipment, grip: grip, difficulty: difficulty, mechanic: mechanic, force: force, origin: origin, cursor: cursor, limit: limit) { (response, error) in
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
 **muscle** | **String** | Código opaco da opção de músculo, de &#x60;getExerciseCatalogFilters&#x60;. Um valor. | [optional]
 **equipment** | **String** | Código opaco da opção de equipamento, de &#x60;getExerciseCatalogFilters&#x60;. Um valor. | [optional]
 **grip** | **String** | Código opaco da opção de pegada, de &#x60;getExerciseCatalogFilters&#x60;. Um valor. | [optional]
 **difficulty** | **String** | Código opaco da opção de dificuldade, de &#x60;getExerciseCatalogFilters&#x60;. Um valor. | [optional]
 **mechanic** | **String** | Código opaco da opção de mecânica, de &#x60;getExerciseCatalogFilters&#x60;. Um valor. | [optional]
 **force** | **String** | Código opaco da opção de tipo de força, de &#x60;getExerciseCatalogFilters&#x60;. Um valor. | [optional]
 **origin** | **String** | Onde buscar: &#x60;CATALOG&#x60; (padrão), o catálogo consultado na hora, ou &#x60;PERSONAL&#x60;, os exercícios do próprio personal. | [optional] [default to .catalog]
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

# **listPersonalExerciseFavorites**
```swift
    open class func listPersonalExerciseFavorites(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalExerciseFavoritesPage?, _ error: Error?) -> Void)
```

Listar os exercícios favoritos do personal

Lista paginada, até 20 por página. Para exercício do catálogo o nome é lido da origem a cada página — é o preço de não guardá-lo. **Quando a origem não responde por um item**, o item continua na lista com `availability: UNAVAILABLE` e sem `exercise`, para o app mostrar \"Exercício indisponível agora\" e não permitir selecioná-lo; a página inteira só falha por problema do próprio Pliora. `availability` é explícito e nunca se infere da ausência de campo. Como a página mistura exercício próprio com item do catálogo, `Content-Language` declara o locale do texto do catálogo, e o texto autoral não o segue (`authored_preserved`).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco da página anterior. (optional)
let limit = 987 // Int | Tamanho solicitado; padrão 20, máximo 20. (optional) (default to 20)

// Listar os exercícios favoritos do personal
ExerciseCatalogAPI.listPersonalExerciseFavorites(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **cursor** | **String** | Cursor opaco da página anterior. | [optional]
 **limit** | **Int** | Tamanho solicitado; padrão 20, máximo 20. | [optional] [default to 20]

### Return type

[**PersonalExerciseFavoritesPage**](PersonalExerciseFavoritesPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalRecentExercises**
```swift
    open class func listPersonalRecentExercises(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalRecentExercisesPage?, _ error: Error?) -> Void)
```

Listar os exercícios que o personal já prescreveu

Os exercícios das versões **publicadas pelo próprio personal**, do mais recente ao mais antigo, **um item por exercício**, com o **rótulo que ele usou na prescrição** e o instante da publicação mais recente em que o usou. É dado do Pliora: **não consulta a origem do catálogo** e continua funcionando com ela fora do ar. Atributos só vêm quando o Pliora os tem, o que hoje acontece para exercício próprio.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco da página anterior. (optional)
let limit = 987 // Int | Tamanho solicitado; padrão 20, máximo 50. (optional) (default to 20)

// Listar os exercícios que o personal já prescreveu
ExerciseCatalogAPI.listPersonalRecentExercises(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **cursor** | **String** | Cursor opaco da página anterior. | [optional]
 **limit** | **Int** | Tamanho solicitado; padrão 20, máximo 50. | [optional] [default to 20]

### Return type

[**PersonalRecentExercisesPage**](PersonalRecentExercisesPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putPersonalExerciseFavorite**
```swift
    open class func putPersonalExerciseFavorite(idempotencyKey: String, ref: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalExerciseFavoriteView?, _ error: Error?) -> Void)
```

Favoritar um exercício

Marca o exercício como favorito do personal autenticado, de forma idempotente: favoritar de novo o que já é favorito responde o mesmo `200`, sem efeito. Favoritar um exercício do catálogo por `catalogRef` **cria a referência dele** (só a referência, como em `resolveExerciseReferences`), e a resposta devolve o `exerciseId` e, quando o servidor já tem, o `variantId`. Um exercício que o servidor não reconhece é `404 EXERCISE_NOT_FOUND`, indistinguível de um que pertence a outro personal.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ref = "ref_example" // String | Referência do exercício a favoritar ou desfavoritar: `exerciseId` ou `catalogRef`.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Favoritar um exercício
ExerciseCatalogAPI.putPersonalExerciseFavorite(idempotencyKey: idempotencyKey, ref: ref, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ref** | **String** | Referência do exercício a favoritar ou desfavoritar: &#x60;exerciseId&#x60; ou &#x60;catalogRef&#x60;. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalExerciseFavoriteView**](PersonalExerciseFavoriteView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putPersonalExerciseMediaPreference**
```swift
    open class func putPersonalExerciseMediaPreference(idempotencyKey: String, ifMatch: String, putExerciseMediaPreferenceRequest: PutExerciseMediaPreferenceRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseMediaPreferenceView?, _ error: Error?) -> Void)
```

Salvar a preferência de vídeo do personal

Substitui a preferência inteira por compare-and-set: `If-Match` com a `revision` lida é obrigatório, e uma edição sobre revisão velha é `412 PRECONDITION_FAILED`, sem gravar nada. `null` num campo limpa aquele campo. O valor é um código opaco que o app leu de um asset (`ExerciseMediaAsset.angle` ou `.demonstrator`); o servidor não valida contra uma lista fechada, porque o vocabulário é aberto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let putExerciseMediaPreferenceRequest = PutExerciseMediaPreferenceRequest(demonstrator: "demonstrator_example", angle: "angle_example") // PutExerciseMediaPreferenceRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Salvar a preferência de vídeo do personal
ExerciseCatalogAPI.putPersonalExerciseMediaPreference(idempotencyKey: idempotencyKey, ifMatch: ifMatch, putExerciseMediaPreferenceRequest: putExerciseMediaPreferenceRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **putExerciseMediaPreferenceRequest** | [**PutExerciseMediaPreferenceRequest**](PutExerciseMediaPreferenceRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**ExerciseMediaPreferenceView**](ExerciseMediaPreferenceView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resolveExerciseReferences**
```swift
    open class func resolveExerciseReferences(idempotencyKey: String, resolveExerciseReferencesRequest: ResolveExerciseReferencesRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseReferencesView?, _ error: Error?) -> Void)
```

Resolver referências opacas de catálogo em exercício e variante prescritíveis

Recebe até 60 `catalogRef` e devolve, para cada um, o `exerciseId` e o `variantId` que a prescrição usa, **criando a referência do exercício quando ela ainda não existe**. O app a chama ao confirmar a seleção do seletor, antes de gravar os exercícios no rascunho: o conteúdo da prescrição continua usando só `exerciseId` e `prescribedVariantId`, e `catalogRef` nunca entra nele. A operação é **idempotente**: o mesmo `catalogRef` devolve sempre o mesmo par, em qualquer repetição, e `Idempotency-Key` com corpo diferente é `409 IDEMPOTENCY_CONFLICT`. A resposta traz um item por `catalogRef`, **na ordem do pedido**. Uma referência que o servidor não reconhece — inexistente, malformada ou emitida a outro personal, todas indistinguíveis — vem como `NOT_FOUND` no seu item, sem derrubar as demais, e **nada é criado para ela**. Nada do exercício é gravado além da referência: nenhum nome, passo ou atributo. O rótulo da prescrição é texto do personal e vive no rascunho. `catalogRef` não é estável como identidade: depois de resolvido, o app usa `exerciseId`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let resolveExerciseReferencesRequest = ResolveExerciseReferencesRequest(catalogRefs: ["catalogRefs_example"]) // ResolveExerciseReferencesRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Resolver referências opacas de catálogo em exercício e variante prescritíveis
ExerciseCatalogAPI.resolveExerciseReferences(idempotencyKey: idempotencyKey, resolveExerciseReferencesRequest: resolveExerciseReferencesRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **resolveExerciseReferencesRequest** | [**ResolveExerciseReferencesRequest**](ResolveExerciseReferencesRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**ExerciseReferencesView**](ExerciseReferencesView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
