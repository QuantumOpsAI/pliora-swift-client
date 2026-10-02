# ExerciseCatalogAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**archivePersonalExercise**](ExerciseCatalogAPI.md#archivepersonalexercise) | **DELETE** /personal/exercises/{exerciseId} | Arquivar um exercício próprio
[**completePersonalExerciseVideoUpload**](ExerciseCatalogAPI.md#completepersonalexercisevideoupload) | **POST** /personal/exercises/{exerciseId}/video/upload-intents/{uploadId}/complete | Confirmar o envio do vídeo de um exercício próprio
[**createPersonalExercise**](ExerciseCatalogAPI.md#createpersonalexercise) | **POST** /personal/exercises | Cadastrar um exercício próprio do personal
[**createPersonalExerciseVideoUploadIntent**](ExerciseCatalogAPI.md#createpersonalexercisevideouploadintent) | **POST** /personal/exercises/{exerciseId}/video/upload-intents | Abrir uma intenção de envio do vídeo de um exercício próprio
[**deletePersonalExerciseFavorite**](ExerciseCatalogAPI.md#deletepersonalexercisefavorite) | **DELETE** /personal/exercise-favorites/{ref} | Desfavoritar um exercício
[**deletePersonalExerciseVideo**](ExerciseCatalogAPI.md#deletepersonalexercisevideo) | **DELETE** /personal/exercises/{exerciseId}/video | Remover o vídeo de um exercício próprio
[**getExerciseCatalogFilters**](ExerciseCatalogAPI.md#getexercisecatalogfilters) | **GET** /exercises/filters | Ler as opções de cada filtro de exercício
[**getExerciseCatalogItem**](ExerciseCatalogAPI.md#getexercisecatalogitem) | **GET** /exercises/{ref} | Ler o detalhe de um exercício
[**getPersonalExercise**](ExerciseCatalogAPI.md#getpersonalexercise) | **GET** /personal/exercises/{exerciseId} | Ler um exercício próprio do personal, com o vídeo e as revisões
[**getPersonalExerciseMediaPreference**](ExerciseCatalogAPI.md#getpersonalexercisemediapreference) | **GET** /personal/exercise-media-preference | Ler a preferência de vídeo do personal
[**getPersonalExerciseVideo**](ExerciseCatalogAPI.md#getpersonalexercisevideo) | **GET** /personal/exercises/{exerciseId}/video | Ler o estado do vídeo de um exercício próprio
[**listExerciseCatalog**](ExerciseCatalogAPI.md#listexercisecatalog) | **GET** /exercises | Buscar exercícios, com filtros, para a autoria do personal
[**listPersonalExerciseFavorites**](ExerciseCatalogAPI.md#listpersonalexercisefavorites) | **GET** /personal/exercise-favorites | Listar os exercícios favoritos do personal
[**listPersonalRecentExercises**](ExerciseCatalogAPI.md#listpersonalrecentexercises) | **GET** /personal/recent-exercises | Listar os exercícios que o personal já prescreveu
[**putPersonalExerciseFavorite**](ExerciseCatalogAPI.md#putpersonalexercisefavorite) | **PUT** /personal/exercise-favorites/{ref} | Favoritar um exercício
[**putPersonalExerciseMediaPreference**](ExerciseCatalogAPI.md#putpersonalexercisemediapreference) | **PUT** /personal/exercise-media-preference | Salvar a preferência de vídeo do personal
[**reportExerciseVideo**](ExerciseCatalogAPI.md#reportexercisevideo) | **POST** /student/exercises/{exerciseId}/video/reports | Denunciar o vídeo de um exercício próprio do personal
[**resolveExerciseReferences**](ExerciseCatalogAPI.md#resolveexercisereferences) | **POST** /exercises/references | Resolver referências opacas de catálogo em exercício e variante prescritíveis
[**updatePersonalExercise**](ExerciseCatalogAPI.md#updatepersonalexercise) | **PUT** /personal/exercises/{exerciseId} | Editar o conteúdo de um exercício próprio com revisão esperada


# **archivePersonalExercise**
```swift
    open class func archivePersonalExercise(idempotencyKey: String, ifMatch: String, exerciseId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Arquivar um exercício próprio

Arquiva o exercício, com **compare-and-set**: `If-Match` com a `revision` lida é obrigatório, e quem arquiva um exercício que outro aparelho acabou de editar recebe `412 PRECONDITION_FAILED` e nada é arquivado, porque arquivar tira o exercício das próximas prescrições e não pode vencer uma edição que o personal ainda não viu. **Arquivar não remove o exercício de nenhuma versão publicada.** O exercício sai da busca (`origin=PERSONAL`), dos favoritos e dos recentes e não entra em prescrição nova: um rascunho ainda aberto que o usa não o publica, porque a variante deixa de ser ativa (`422 DRAFT_INCOMPLETE` na publicação, com `fieldErrors[].code` `EXERCISE_ARCHIVED` no campo que referencia a variante, para o app explicar o motivo). As prescrições publicadas que o usam e o histórico do aluno **não mudam**: seguem apontando o mesmo `exerciseId` e a mesma variante e continuam exibindo o `displayName` que a prescrição guardou. O vídeo, se houver, recebe tombstone no mesmo ato e deixa de ser servido — a remoção do vídeo vale também para o aluno que o recebia —, com o alcance de `deletePersonalExerciseVideo`. Não há desarquivar nesta versão do contrato. A resposta é `204`: o exercício arquivado continua legível pelo dono em `getPersonalExercise`. Repetir com a mesma `Idempotency-Key` e a mesma revisão responde `204` outra vez, sem novo efeito; repetir com outra chave depois de concluído é `412`, porque a revisão lida já não é a vigente. `If-Match: *` não é elegível e é `422 VALIDATION_FAILED`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **exercício** que o cliente leu, o mesmo valor de `revision` em `getPersonalExercise`. Compare-and-set: revisão velha é `412`, sem gravar. O curinga `*` não é elegível — é o valor que quem nunca leu o exercício também enviaria, e derrubaria exatamente a precondição —, e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let exerciseId = "exerciseId_example" // String | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Arquivar um exercício próprio
ExerciseCatalogAPI.archivePersonalExercise(idempotencyKey: idempotencyKey, ifMatch: ifMatch, exerciseId: exerciseId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **exercício** que o cliente leu, o mesmo valor de &#x60;revision&#x60; em &#x60;getPersonalExercise&#x60;. Compare-and-set: revisão velha é &#x60;412&#x60;, sem gravar. O curinga &#x60;*&#x60; não é elegível — é o valor que quem nunca leu o exercício também enviaria, e derrubaria exatamente a precondição —, e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **exerciseId** | **String** | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **completePersonalExerciseVideoUpload**
```swift
    open class func completePersonalExerciseVideoUpload(idempotencyKey: String, ifMatch: String, exerciseId: String, uploadId: String, completePersonalExerciseVideoUploadRequest: CompletePersonalExerciseVideoUploadRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalExerciseVideoView?, _ error: Error?) -> Void)
```

Confirmar o envio do vídeo de um exercício próprio

Segundo passo do ciclo. Confirma, de forma idempotente, que os bytes descritos pela intenção foram entregues, e é a única forma de o vídeo passar a existir: sem esta confirmação o PUT não muda estado algum de produto. O servidor **reconfere o tamanho realmente entregue e o checksum** antes de aceitar — o armazenamento não impõe o limite de 100 MB — e só então publica `assetId` + `mediaVersion` e entra em quarentena: a resposta sai `PROCESSING`. Tamanho acima do limite é `413 EXERCISE_VIDEO_TOO_LARGE`; tamanho ou checksum diferentes do que a intenção declarou é `422 EXERCISE_VIDEO_UPLOAD_MISMATCH`, com `fieldErrors`, e nada é publicado. **O resultado da verificação aparece depois**, online-only, em `getPersonalExerciseVideo`: `READY` com as variantes de leitura, ou `REJECTED` com `rejectionReason` — decodificação, formato, faixa de áudio presente, duração acima de 60 s ou verificação de conteúdo. **Vídeo recusado não desfaz o exercício**, que segue utilizável. Em `PROCESSING` o vídeo não é servido a ninguém, e prescrever o exercício continua possível. **Confirmar uma troca leva o vídeo a `PROCESSING` e o anterior deixa de ser servido no ato**: durante a análise nenhum aluno recebe vídeo deste exercício. Se o novo virar `REJECTED`, o vídeo anterior **não volta** — a troca já o substituiu —, e o caminho é enviar outro vídeo, com nova intenção e nova declaração de direito de imagem. Quem quer manter o vídeo vigente não confirma a troca. `If-Match` com a `revision` do vídeo é obrigatório — o `ETag` da intenção —, e a confirmação sobre um vídeo que outro aparelho trocou ou removeu entre a intenção e agora é `412 PRECONDITION_FAILED`, sem publicar nada: o app lê o vídeo de novo e, enquanto a intenção não venceu, confirma sobre a revisão vigente. O `ETag` da resposta é a revisão nova. Confirmar a mesma intenção com a mesma `Idempotency-Key` e o mesmo corpo devolve a projeção original sem reprocessar; a mesma chave com corpo divergente responde `409 IDEMPOTENCY_CONFLICT`, e outra chave sobre uma intenção já confirmada responde `409 EXERCISE_VIDEO_UPLOAD_ALREADY_COMPLETED`. Uma intenção vencida responde `410` e exige um novo ciclo, com nova declaração de direito de imagem. Uma intenção inexistente, de outro personal ou de outro exercício respondem de forma indistinguível (`404`).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **vídeo** que o cliente leu, o mesmo valor de `video.revision` em `getPersonalExercise` e do `ETag` de `getPersonalExerciseVideo`; na confirmação, o `ETag` da intenção. É a revisão do vídeo, e não a do exercício. Compare-and-set: revisão velha é `412`, sem gravar nem publicar. O curinga `*` não é elegível e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let exerciseId = "exerciseId_example" // String | Exercício próprio do personal autenticado ao qual a intenção pertence.
let uploadId = "uploadId_example" // String | Intenção aberta por `createPersonalExerciseVideoUploadIntent` para este exercício, e pertencente ao personal autenticado.
let completePersonalExerciseVideoUploadRequest = CompletePersonalExerciseVideoUploadRequest(contentLength: 123, checksumSha256: "checksumSha256_example") // CompletePersonalExerciseVideoUploadRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Confirmar o envio do vídeo de um exercício próprio
ExerciseCatalogAPI.completePersonalExerciseVideoUpload(idempotencyKey: idempotencyKey, ifMatch: ifMatch, exerciseId: exerciseId, uploadId: uploadId, completePersonalExerciseVideoUploadRequest: completePersonalExerciseVideoUploadRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **vídeo** que o cliente leu, o mesmo valor de &#x60;video.revision&#x60; em &#x60;getPersonalExercise&#x60; e do &#x60;ETag&#x60; de &#x60;getPersonalExerciseVideo&#x60;; na confirmação, o &#x60;ETag&#x60; da intenção. É a revisão do vídeo, e não a do exercício. Compare-and-set: revisão velha é &#x60;412&#x60;, sem gravar nem publicar. O curinga &#x60;*&#x60; não é elegível e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **exerciseId** | **String** | Exercício próprio do personal autenticado ao qual a intenção pertence. |
 **uploadId** | **String** | Intenção aberta por &#x60;createPersonalExerciseVideoUploadIntent&#x60; para este exercício, e pertencente ao personal autenticado. |
 **completePersonalExerciseVideoUploadRequest** | [**CompletePersonalExerciseVideoUploadRequest**](CompletePersonalExerciseVideoUploadRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalExerciseVideoView**](PersonalExerciseVideoView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalExercise**
```swift
    open class func createPersonalExercise(idempotencyKey: String, createPersonalExerciseRequest: CreatePersonalExerciseRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalExerciseView?, _ error: Error?) -> Void)
```

Cadastrar um exercício próprio do personal

Cria o exercício que o catálogo não tem, de autoria do personal autenticado. **A identidade nasce no cliente**: `exerciseId` é gerado no device e adotado pelo servidor, de modo que o retry convirja para uma só identidade. O mesmo `exerciseId` com o mesmo corpo devolve o exercício original sem duplicar; com corpo diferente é `409 EXERCISE_IDENTITY_DIVERGENT`, nunca sobrescrita silenciosa. **A mesma resposta vale para a identidade que já é de outro personal ou do catálogo**: o servidor não diz de quem ela é nem se existe, para a colisão não virar oráculo de existência, e não devolve nenhum dado do outro exercício. O cliente gera outra identidade e tenta de novo. **Uma variante por exercício próprio.** O servidor emite a variante no ato da criação e a devolve em `variantId`: é com o par `exerciseId` + `variantId` que a prescrição o referencia (`prescribedVariantId`), do mesmo modo que `resolveExerciseReferences` entrega o par de um exercício do catálogo. A variante nasce com o exercício, nunca muda e nunca se multiplica, e por isso o exercício próprio já sai de `listExerciseCatalog` e de `getExerciseCatalogItem` com `variantId`, sem nenhuma chamada a mais. Obrigatórios: `name` e `primaryMuscle`. Músculo e equipamento são escolhidos nas opções de `getExerciseCatalogFilters`, e o Pliora guarda **o rótulo escolhido** como texto do exercício do personal (`authored_preserved`), nunca o código do filtro. O exercício fica utilizável **assim que salvo**, sem vídeo: o vídeo é um ciclo próprio e posterior (`createPersonalExerciseVideoUploadIntent`), que só pode começar com o exercício já salvo. O exercício pertence a um só personal e não é compartilhado: o de outro personal responde como inexistente em toda operação desta família. A escrita é online-only e nenhum `commandType` de sync a transporta.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createPersonalExerciseRequest = CreatePersonalExerciseRequest(exerciseId: "exerciseId_example", name: "name_example", primaryMuscle: "primaryMuscle_example", secondaryMuscles: ["secondaryMuscles_example"], equipment: "equipment_example", difficulty: "difficulty_example", mechanic: "mechanic_example", force: "force_example", steps: ["steps_example"]) // CreatePersonalExerciseRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Cadastrar um exercício próprio do personal
ExerciseCatalogAPI.createPersonalExercise(idempotencyKey: idempotencyKey, createPersonalExerciseRequest: createPersonalExerciseRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **createPersonalExerciseRequest** | [**CreatePersonalExerciseRequest**](CreatePersonalExerciseRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalExerciseView**](PersonalExerciseView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalExerciseVideoUploadIntent**
```swift
    open class func createPersonalExerciseVideoUploadIntent(idempotencyKey: String, ifMatch: String, exerciseId: String, createPersonalExerciseVideoUploadIntentRequest: CreatePersonalExerciseVideoUploadIntentRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalExerciseVideoUploadIntentView?, _ error: Error?) -> Void)
```

Abrir uma intenção de envio do vídeo de um exercício próprio

Primeiro passo do ciclo do vídeo, na mesma forma do ciclo do avatar profissional. O exercício precisa já estar salvo. O cliente declara tipo, tamanho, checksum e duração dos bytes que pretende enviar, e **a declaração de direito de imagem**; o servidor devolve uma intenção de curta duração: `uploadId`, um PUT temporário, os cabeçalhos obrigatórios daquele PUT e o instante de expiração. O contrato é provider-neutral: a intenção nunca expõe bucket, chave de objeto, KMS, ARN, credencial ou topologia de armazenamento, e a URL é uma capacidade efêmera de escrita — **nunca** identidade do vídeo, que nasce só na confirmação. **`rightsDeclared: true` é campo de cada intenção**: o primeiro vídeo e toda troca exigem a declaração, sempre, e a declaração de um envio não vale para o seguinte. O servidor a registra com a autoria — o personal autenticado — e o instante, junto da intenção, e devolve o instante em `rightsDeclaredAt`. Sem a declaração a intenção é recusada (`422 EXERCISE_VIDEO_RIGHTS_NOT_DECLARED`) e nada é aberto. A declaração não é moderação: não há revisão prévia do conteúdo. **Limites declarados, não presumidos**: `video/mp4` com H.264, no máximo 60 segundos e 100 MB (104857600 bytes) e **sem faixa de áudio** — a capacidade está em `x-exercise-video-capability`. O armazenamento não impõe os 100 MB no envio, e por isso o limite é do contrato e do servidor: o pedido declara `contentLength`, o `Content-Length` devolvido nos cabeçalhos é esse valor e o PUT o repete exatamente, e a confirmação **reconfere o tamanho realmente entregue**. Acima de 100 MB é `413 EXERCISE_VIDEO_TOO_LARGE`; um tipo fora de `video/mp4` é `415 EXERCISE_VIDEO_FORMAT_UNSUPPORTED`; duração declarada acima de 60 s é `422 EXERCISE_VIDEO_TOO_LONG`. O cliente normaliza antes de enviar (720p, até 60 s, áudio removido); o servidor valida o conteúdo de novo, e a ausência de áudio e a duração medidas só se conhecem depois do envio, no estado `REJECTED`. **Trocar o vídeo é a mesma operação**, e o vídeo vigente continua como estava enquanto a troca não é confirmada. `If-Match` com a `revision` do vídeo (`getPersonalExerciseVideo`) é obrigatório: abrir intenção sobre um vídeo que outro aparelho já trocou ou removeu é `412 PRECONDITION_FAILED`. O `ETag` da resposta é essa mesma revisão, a ecoar em `If-Match` da confirmação. A URL e os cabeçalhos valem somente até `expiresAt`, de curta duração, e o cliente não depende de reutilizá-los: se o envio não terminou, abre outra intenção, com outra `Idempotency-Key`. A URL de envio pode aparecer em registro de acesso do armazenamento até vencer, e por isso o cliente não a registra em log nem a persiste. O replay da mesma `Idempotency-Key` com o mesmo corpo devolve a intenção original sem emitir outra; a mesma chave com corpo divergente responde `409 IDEMPOTENCY_CONFLICT`. O tratamento de bytes é online-only: não existe outbox nem fila offline de mídia, e nenhum `commandType` de sync transporta vídeo.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **vídeo** que o cliente leu, o mesmo valor de `video.revision` em `getPersonalExercise` e do `ETag` de `getPersonalExerciseVideo`; na confirmação, o `ETag` da intenção. É a revisão do vídeo, e não a do exercício. Compare-and-set: revisão velha é `412`, sem gravar nem publicar. O curinga `*` não é elegível e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let exerciseId = "exerciseId_example" // String | Exercício próprio do personal autenticado, já salvo. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível.
let createPersonalExerciseVideoUploadIntentRequest = CreatePersonalExerciseVideoUploadIntentRequest(contentType: PersonalExerciseVideoUploadContentType(), contentLength: 123, checksumSha256: "checksumSha256_example", durationSeconds: 123, rightsDeclared: false) // CreatePersonalExerciseVideoUploadIntentRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abrir uma intenção de envio do vídeo de um exercício próprio
ExerciseCatalogAPI.createPersonalExerciseVideoUploadIntent(idempotencyKey: idempotencyKey, ifMatch: ifMatch, exerciseId: exerciseId, createPersonalExerciseVideoUploadIntentRequest: createPersonalExerciseVideoUploadIntentRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **vídeo** que o cliente leu, o mesmo valor de &#x60;video.revision&#x60; em &#x60;getPersonalExercise&#x60; e do &#x60;ETag&#x60; de &#x60;getPersonalExerciseVideo&#x60;; na confirmação, o &#x60;ETag&#x60; da intenção. É a revisão do vídeo, e não a do exercício. Compare-and-set: revisão velha é &#x60;412&#x60;, sem gravar nem publicar. O curinga &#x60;*&#x60; não é elegível e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **exerciseId** | **String** | Exercício próprio do personal autenticado, já salvo. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível. |
 **createPersonalExerciseVideoUploadIntentRequest** | [**CreatePersonalExerciseVideoUploadIntentRequest**](CreatePersonalExerciseVideoUploadIntentRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalExerciseVideoUploadIntentView**](PersonalExerciseVideoUploadIntentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **deletePersonalExerciseVideo**
```swift
    open class func deletePersonalExerciseVideo(idempotencyKey: String, ifMatch: String, exerciseId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remover o vídeo de um exercício próprio

Remove o vídeo do exercício, com **compare-and-set**: `If-Match` com a `revision` do vídeo é obrigatório, e remover o vídeo que outro aparelho trocou depois da leitura é remover um vídeo que o personal não viu — `412 PRECONDITION_FAILED`, e nada é removido. A remoção grava um **tombstone imediato**: o `assetId` deixa de resolver, nenhuma nova URL de leitura é emitida e o estado passa a `NONE`. Vale para o personal e para todo aluno que o recebia. **O tombstone tira o vídeo do ar; não recolhe a URL já emitida.** Uma URL de leitura emitida antes da remoção pode continuar servindo os bytes até o seu `expiresAt`, inclusive a partir de cópia na borda de entrega, e é por isso que as URLs de leitura são de curta duração. Os bytes e os derivados são apagados na janela de `ADR-0012` §3, que não é parte deste contrato. Remover não desfaz a declaração de direito de imagem registrada e não abre intenção nova: trazer um vídeo de volta é novo envio, com nova declaração. A resposta é `204`: depois de removido o vídeo não existe, e projetá-lo de volta contradiria a remoção. Repetir com a mesma `Idempotency-Key` e a mesma revisão responde `204` outra vez, sem novo efeito; repetir com outra chave depois de concluída é `412`, porque a revisão lida já não é a vigente. `If-Match: *` não é elegível e é `422 VALIDATION_FAILED`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **vídeo** que o cliente leu, o mesmo valor de `video.revision` em `getPersonalExercise` e do `ETag` de `getPersonalExerciseVideo`; na confirmação, o `ETag` da intenção. É a revisão do vídeo, e não a do exercício. Compare-and-set: revisão velha é `412`, sem gravar nem publicar. O curinga `*` não é elegível e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let exerciseId = "exerciseId_example" // String | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Remover o vídeo de um exercício próprio
ExerciseCatalogAPI.deletePersonalExerciseVideo(idempotencyKey: idempotencyKey, ifMatch: ifMatch, exerciseId: exerciseId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **vídeo** que o cliente leu, o mesmo valor de &#x60;video.revision&#x60; em &#x60;getPersonalExercise&#x60; e do &#x60;ETag&#x60; de &#x60;getPersonalExerciseVideo&#x60;; na confirmação, o &#x60;ETag&#x60; da intenção. É a revisão do vídeo, e não a do exercício. Compare-and-set: revisão velha é &#x60;412&#x60;, sem gravar nem publicar. O curinga &#x60;*&#x60; não é elegível e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **exerciseId** | **String** | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível. |
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

Detalhe sem efeito colateral de um exercício: nome, atributos, `steps[]` em ordem, a mídia com `angle` e `demonstrator` por asset e `similarQuery`, o conjunto de filtros que reproduz \"similares\" na busca — o servidor não devolve lista montada de substitutos. Músculos secundários só existem em exercício próprio. Cada atributo vem só quando a origem o informa. `media` lista os assets disponíveis com a mesma forma de `ExerciseMediaAsset` que o aluno recebe; vídeo nunca é pré-requisito de prescrever, e nenhuma mídia é pedida à origem antes de o app iniciar a reprodução. Em exercício próprio, `media` traz o vídeo próprio **somente quando ele está `READY`** — com a identidade `assetId` + `mediaVersion` do vídeo — e é vazio em `PROCESSING`, em `REJECTED` e sem vídeo; o estado e o motivo ficam em `getPersonalExerciseVideo`. Um exercício que não existe, que a identidade autenticada não pode ler ou cuja referência é malformada respondem de forma indistinguível, `404 EXERCISE_NOT_FOUND`. Origem fora do ar ou cota esgotada respondem `503 EXERCISE_CATALOG_UNAVAILABLE` com o motivo, e o app mantém utilizável o exercício que já está num plano, porque o rótulo é da prescrição. Os textos de um exercício do catálogo seguem o idioma que a origem serve, e `Content-Language` declara o locale desse texto, como em `listExerciseCatalog`; o texto autoral de um exercício próprio é `authored_preserved` e não segue o cabeçalho.

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

# **getPersonalExercise**
```swift
    open class func getPersonalExercise(exerciseId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalExerciseView?, _ error: Error?) -> Void)
```

Ler um exercício próprio do personal, com o vídeo e as revisões

Leitura sem efeito colateral do exercício próprio inteiro: o conteúdo autorado, o estado (`ACTIVE` ou `ARCHIVED`), a variante e o vídeo. É a leitura que dá as duas revisões a ecoar em `If-Match`, e **elas não se misturam**: o `ETag` desta resposta é `revision`, a do exercício, e vale para `updatePersonalExercise` e `archivePersonalExercise`; `video.revision` é a do vídeo e vale para o ciclo do vídeo. O vídeo muda por conta própria — o resultado da verificação de conteúdo o move sem que o personal edite nada —, e por isso uma edição do nome não pode falhar porque a verificação terminou. Um exercício arquivado continua legível pelo dono, com `status: ARCHIVED` e o vídeo `NONE`, para o app tratar uma identidade que guardou. Aqui `Content-Language` não se aplica ao texto do exercício: ele é `authored_preserved` e não segue o cabeçalho.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let exerciseId = "exerciseId_example" // String | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler um exercício próprio do personal, com o vídeo e as revisões
ExerciseCatalogAPI.getPersonalExercise(exerciseId: exerciseId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **exerciseId** | **String** | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalExerciseView**](PersonalExerciseView.md)

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

# **getPersonalExerciseVideo**
```swift
    open class func getPersonalExerciseVideo(exerciseId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalExerciseVideoView?, _ error: Error?) -> Void)
```

Ler o estado do vídeo de um exercício próprio

Leitura sem efeito colateral do vídeo e nada mais: é o que o app repete enquanto o estado é `PROCESSING`, e a leitura que dá a `revision` do vídeo — o `ETag` desta resposta — a ecoar em `If-Match` de `createPersonalExerciseVideoUploadIntent`, `completePersonalExerciseVideoUpload` e `deletePersonalExerciseVideo`. É a mesma projeção que `getPersonalExercise` traz em `video`. **Identidade é `assetId` + `mediaVersion`, nunca URL.** As variantes de leitura são capacidades de curta duração, sempre com `expiresAt`: o cliente as usa para reproduzir, não as guarda, não as registra em log e não deriva uma da outra; o direito de cache vai somente até a reprodução, e nenhum direito offline existe (online-only, sem fila local de bytes). **`PROCESSING` não serve nada.** Os bytes recebidos ficam em quarentena e não são servidos a ninguém, nem ao próprio personal, antes de passarem pela verificação de conteúdo: em `PROCESSING` `variants` é vazio e nenhuma URL de leitura existe. O estado é do servidor; o app não o infere de uma URL. Quem vê o vídeo: o personal dono, aqui, e os alunos com vínculo ativo que tenham prescrição publicada contendo o exercício, no `media` do exercício que recebem. Outra pessoa não o vê, e a ausência responde como falta de autorização.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let exerciseId = "exerciseId_example" // String | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o estado do vídeo de um exercício próprio
ExerciseCatalogAPI.getPersonalExerciseVideo(exerciseId: exerciseId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **exerciseId** | **String** | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalExerciseVideoView**](PersonalExerciseVideoView.md)

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

Busca autenticada e exclusiva do papel PERSONAL, declarado em `security` (`BearerAuth` com o papel `PERSONAL`); qualquer outra identidade autenticada recebe `403 FORBIDDEN`. O contrato é **agnóstico de origem**: os mesmos parâmetros e o mesmo item servem a consulta feita na hora à origem do catálogo e qualquer catálogo próprio futuro. O que a origem não entrega na linha da lista **vem ausente, nunca inventado**. Nenhum nome, ID, payload ou credencial de provider aparece aqui, e nenhum vocabulário de provider é enum. `origin=CATALOG` (padrão) consulta o catálogo, e a ordem é a da origem: relevância quando há `query`; não existe parâmetro de ordenação. `origin=PERSONAL` busca nos exercícios do próprio personal, ignorando acento e caixa, em ordem de nome, e só entre os ativos — o exercício arquivado sai da busca; nela só `query` se aplica, e um filtro informado é `422 VALIDATION_FAILED` em vez de ser ignorado em silêncio. `muscle`, `equipment`, `grip`, `difficulty`, `mechanic` e `force` recebem **um código opaco por filtro**, copiado das opções de `getExerciseCatalogFilters`; os informados valem juntos. O cursor é opaco e carrega a posição na origem. `total` só vem quando a origem informa a contagem da combinação atual; sua ausência significa \"não sei\", nunca zero. **A lista nunca devolve mídia, URL ou imagem**: vídeo e passos pertencem a `getExerciseCatalogItem`. **Catálogo indisponível não é lista vazia.** Origem fora do ar ou cota esgotada respondem `503 EXERCISE_CATALOG_UNAVAILABLE` com o motivo; `items: []` com `200` significa somente \"nenhum exercício com esses critérios\". **Idioma.** Os textos de um exercício do catálogo vêm no idioma que a origem serve, e `Content-Language` declara o locale desse texto: enquanto a origem só serve inglês, a resposta declara `en-US` mesmo com `Accept-Language: pt-BR`. O texto autoral — o nome e os atributos de um exercício próprio — é `authored_preserved` e **não segue o cabeçalho**, inclusive quando a mesma resposta mistura exercício próprio com item do catálogo. O app exibe o texto como veio, sem traduzir e sem compará-lo com rótulo de filtro.

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

Lista paginada, até 20 por página. Para exercício do catálogo o nome é lido da origem a cada página — é o preço de não guardá-lo. **Quando a origem não responde por um item**, o item continua na lista com `availability: UNAVAILABLE` e sem `exercise`, para o app mostrar \"Exercício indisponível agora\" e não permitir selecioná-lo; a página inteira só falha por problema do próprio Pliora. `availability` é explícito e nunca se infere da ausência de campo. Como a página mistura exercício próprio com item do catálogo, `Content-Language` declara o locale do texto do catálogo, e o texto autoral não o segue (`authored_preserved`). Um exercício próprio arquivado sai desta lista.

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

Os exercícios das versões **publicadas pelo próprio personal**, do mais recente ao mais antigo, **um item por exercício**, com o **rótulo que ele usou na prescrição** e o instante da publicação mais recente em que o usou. É dado do Pliora: **não consulta a origem do catálogo** e continua funcionando com ela fora do ar. Atributos só vêm quando o Pliora os tem, o que hoje acontece para exercício próprio. Um exercício próprio arquivado não aparece aqui: a lista serve a escolher exercício para uma prescrição nova, e as versões já publicadas seguem mostrando o rótulo que usaram.

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

# **reportExerciseVideo**
```swift
    open class func reportExerciseVideo(idempotencyKey: String, exerciseId: String, reportExerciseVideoRequest: ReportExerciseVideoRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: ExerciseVideoReportView?, _ error: Error?) -> Void)
```

Denunciar o vídeo de um exercício próprio do personal

O canal de denúncia do vídeo de exercício próprio (`DEC-PRESC-11`): o aluno que recebe o vídeo o denuncia. O vídeo entra sem revisão prévia, e a denúncia é o que leva o caso à remoção operacional. A denúncia nomeia o vídeo pela identidade que o aluno recebeu, `assetId` + `mediaVersion`, nunca por URL. **Só denuncia quem pode ver o vídeo**: aluno com vínculo ativo e prescrição publicada que contém o exercício. Um exercício que não existe, um vídeo que o aluno não vê, uma versão que já não é a vigente e um exercício de outro personal respondem de forma indistinguível (`404 EXERCISE_NOT_FOUND`). **Receber a denúncia não remove o vídeo por si**: a resposta confirma só o recebimento (`reportId` e `receivedAt`). Decidir e remover é ato operacional, fora deste contrato, e o vídeo removido deixa de resolver como no tombstone do personal. O contrato não promete prazo nem resultado ao denunciante, e não publica a denúncia ao personal dono. Quem aparece no vídeo e não tem conta não alcança este canal, que é só do aluno com vínculo. O corpo traz o motivo (`reason`, vocabulário fechado) e uma nota opcional, texto do aluno preservado como escrito — que pode conter dado pessoal e nunca vai a log, métrica ou relatório de falha. Repetir a mesma `Idempotency-Key` com o mesmo corpo devolve a mesma denúncia, sem registrar outra; a mesma chave com corpo diferente é `409 IDEMPOTENCY_CONFLICT`. **Uma denúncia por aluno, vídeo e versão.** A mesma tupla aluno + `assetId` + `mediaVersion` devolve o mesmo `reportId` e o mesmo `receivedAt`, ainda que com outra `Idempotency-Key`, outro motivo ou outra nota: é a mesma denúncia, e nenhuma nova é registrada — o motivo e a nota da primeira prevalecem, e a repetição não os atualiza. Repetir denúncia não é, portanto, um meio de pressionar o personal nem o sistema. Além disso a operação tem limite de tentativas por identidade: excedê-lo é `429 ATTEMPT_LIMIT_EXCEEDED`, com `Retry-After`, e nada é registrado. Online-only: nenhum `commandType` de sync a transporta.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let exerciseId = "exerciseId_example" // String | Exercício, como o aluno o recebe na prescrição. Um exercício que não existe ou cujo vídeo o aluno não vê respondem de forma indistinguível.
let reportExerciseVideoRequest = ReportExerciseVideoRequest(assetId: "assetId_example", mediaVersion: "mediaVersion_example", reason: ExerciseVideoReportReason(), note: "note_example") // ReportExerciseVideoRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Denunciar o vídeo de um exercício próprio do personal
ExerciseCatalogAPI.reportExerciseVideo(idempotencyKey: idempotencyKey, exerciseId: exerciseId, reportExerciseVideoRequest: reportExerciseVideoRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **exerciseId** | **String** | Exercício, como o aluno o recebe na prescrição. Um exercício que não existe ou cujo vídeo o aluno não vê respondem de forma indistinguível. |
 **reportExerciseVideoRequest** | [**ReportExerciseVideoRequest**](ReportExerciseVideoRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**ExerciseVideoReportView**](ExerciseVideoReportView.md)

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

# **updatePersonalExercise**
```swift
    open class func updatePersonalExercise(idempotencyKey: String, ifMatch: String, exerciseId: String, updatePersonalExerciseRequest: UpdatePersonalExerciseRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalExerciseView?, _ error: Error?) -> Void)
```

Editar o conteúdo de um exercício próprio com revisão esperada

Substitui o conteúdo autorado inteiro do exercício — nome, músculos, equipamento, dificuldade, mecânica, força e passos — por compare-and-set. `If-Match` com a `revision` lida é obrigatório, e **duas edições concorrentes nunca aplicam last-write-wins**: a perdedora recebe `412 PRECONDITION_FAILED` e o servidor permanece como estava. O corpo é o conteúdo inteiro, e um campo opcional ausente é ausente: limpa o campo, nunca o mantém em silêncio nem vira zero. `If-Match: *` não é elegível — é o valor que quem nunca leu o exercício também enviaria — e é `422 VALIDATION_FAILED`. A edição **não toca o vídeo, a variante nem o estado**, e **não altera nenhuma prescrição**: o nome que a versão publicada e o treino do aluno exibem é o `displayName` autorado na prescrição, e uma edição aqui vale para as prescrições que o personal montar depois. Um exercício arquivado não se edita (`409 EXERCISE_ARCHIVED`). Repetir a mesma `Idempotency-Key` com o mesmo corpo sobre a mesma revisão devolve o resultado guardado, sem reaplicar.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **exercício** que o cliente leu, o mesmo valor de `revision` em `getPersonalExercise`. Compare-and-set: revisão velha é `412`, sem gravar. O curinga `*` não é elegível — é o valor que quem nunca leu o exercício também enviaria, e derrubaria exatamente a precondição —, e o `pattern` o recusa com `422 VALIDATION_FAILED`.
let exerciseId = "exerciseId_example" // String | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível.
let updatePersonalExerciseRequest = UpdatePersonalExerciseRequest(name: "name_example", primaryMuscle: "primaryMuscle_example", secondaryMuscles: ["secondaryMuscles_example"], equipment: "equipment_example", difficulty: "difficulty_example", mechanic: "mechanic_example", force: "force_example", steps: ["steps_example"]) // UpdatePersonalExerciseRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Editar o conteúdo de um exercício próprio com revisão esperada
ExerciseCatalogAPI.updatePersonalExercise(idempotencyKey: idempotencyKey, ifMatch: ifMatch, exerciseId: exerciseId, updatePersonalExerciseRequest: updatePersonalExerciseRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **exercício** que o cliente leu, o mesmo valor de &#x60;revision&#x60; em &#x60;getPersonalExercise&#x60;. Compare-and-set: revisão velha é &#x60;412&#x60;, sem gravar. O curinga &#x60;*&#x60; não é elegível — é o valor que quem nunca leu o exercício também enviaria, e derrubaria exatamente a precondição —, e o &#x60;pattern&#x60; o recusa com &#x60;422 VALIDATION_FAILED&#x60;. |
 **exerciseId** | **String** | Exercício próprio do personal autenticado. Um exercício que não existe, que é de outro personal ou cuja identidade é malformada respondem de forma indistinguível. |
 **updatePersonalExerciseRequest** | [**UpdatePersonalExerciseRequest**](UpdatePersonalExerciseRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalExerciseView**](PersonalExerciseView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
