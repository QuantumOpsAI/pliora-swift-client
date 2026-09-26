# PersonalProfileAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completePersonalAvatarUpload**](PersonalProfileAPI.md#completepersonalavatarupload) | **POST** /personal/profile/avatar/upload-intents/{uploadId}/complete | Confirmar o envio do avatar profissional
[**createPersonalAvatarUploadIntent**](PersonalProfileAPI.md#createpersonalavataruploadintent) | **POST** /personal/profile/avatar/upload-intents | Abrir uma intenção de envio do avatar profissional
[**deletePersonalAvatar**](PersonalProfileAPI.md#deletepersonalavatar) | **DELETE** /personal/profile/avatar | Remover o avatar profissional
[**getPersonalProfile**](PersonalProfileAPI.md#getpersonalprofile) | **GET** /personal/profile | Obter o Perfil do Personal autenticado
[**importPersonalAvatarFromGoogle**](PersonalProfileAPI.md#importpersonalavatarfromgoogle) | **POST** /personal/profile/avatar/import-google | Importar o avatar profissional da identidade Google autenticada


# **completePersonalAvatarUpload**
```swift
    open class func completePersonalAvatarUpload(idempotencyKey: String, uploadId: String, completePersonalAvatarUploadRequest: CompletePersonalAvatarUploadRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: AvatarView?, _ error: Error?) -> Void)
```

Confirmar o envio do avatar profissional

Segundo passo do ciclo. Confirma, de forma idempotente, que os bytes descritos pela intenção foram entregues, e é a única forma de o avatar passar a existir: sem esta confirmação o PUT não muda estado algum de produto. O servidor reconfere tamanho, formato e checksum antes de aceitar, e só então publica `assetId` + `mediaVersion` com `origin: USER_UPLOAD`. O processamento dos derivados é assíncrono no servidor e online-only: a resposta pode sair como `PROCESSING` e o resultado do antivírus/scan aparece depois como `state: READY` ou `state: REJECTED` com `rejectionReason`. Não existe outbox de bytes no cliente e nenhuma jornada depende de fila offline. Confirmar a mesma intenção com a mesma `Idempotency-Key` e o mesmo corpo devolve a projeção original sem reprocessar; a mesma chave com corpo divergente responde `409 IDEMPOTENCY_CONFLICT`. Uma intenção vencida responde `410` e exige um novo ciclo. Uma intenção inexistente e uma intenção de outra pessoa respondem de forma indistinguível, para não revelar existência fora do escopo do ator.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let uploadId = "uploadId_example" // String | Intenção de envio aberta por `POST /personal/profile/avatar/upload-intents` e pertencente ao personal autenticado.
let completePersonalAvatarUploadRequest = CompletePersonalAvatarUploadRequest(sizeBytes: 123, checksumSha256: "checksumSha256_example") // CompletePersonalAvatarUploadRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Confirmar o envio do avatar profissional
PersonalProfileAPI.completePersonalAvatarUpload(idempotencyKey: idempotencyKey, uploadId: uploadId, completePersonalAvatarUploadRequest: completePersonalAvatarUploadRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **uploadId** | **String** | Intenção de envio aberta por &#x60;POST /personal/profile/avatar/upload-intents&#x60; e pertencente ao personal autenticado. |
 **completePersonalAvatarUploadRequest** | [**CompletePersonalAvatarUploadRequest**](CompletePersonalAvatarUploadRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AvatarView**](AvatarView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalAvatarUploadIntent**
```swift
    open class func createPersonalAvatarUploadIntent(idempotencyKey: String, createPersonalAvatarUploadIntentRequest: CreatePersonalAvatarUploadIntentRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalAvatarUploadIntentView?, _ error: Error?) -> Void)
```

Abrir uma intenção de envio do avatar profissional

Primeiro passo do ciclo do avatar profissional. O cliente declara tipo, tamanho e checksum dos bytes que pretende enviar, e o servidor devolve uma intenção de envio de curta duração: `uploadId`, um PUT temporário, os cabeçalhos obrigatórios daquele PUT e o instante de expiração. O contrato é provider-neutral: a intenção nunca expõe bucket, chave de objeto, KMS, ARN, credencial ou topologia de armazenamento, e a URL devolvida é uma capacidade efêmera de escrita — **nunca** identidade do avatar. A identidade é `assetId` + `mediaVersion`, publicada em `AvatarView`. Abrir intenção não altera o avatar vigente: enquanto o ciclo não é confirmado, `AvatarView` continua exatamente como estava. O replay da mesma `Idempotency-Key` com o mesmo corpo devolve a intenção original sem emitir outra; a mesma chave com corpo divergente responde `409 IDEMPOTENCY_CONFLICT`. O tratamento de bytes é online-only: não existe outbox nem fila offline de mídia, e nenhum `commandType` de sync transporta avatar.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createPersonalAvatarUploadIntentRequest = CreatePersonalAvatarUploadIntentRequest(contentType: AvatarUploadContentType(), sizeBytes: 123, checksumSha256: "checksumSha256_example") // CreatePersonalAvatarUploadIntentRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abrir uma intenção de envio do avatar profissional
PersonalProfileAPI.createPersonalAvatarUploadIntent(idempotencyKey: idempotencyKey, createPersonalAvatarUploadIntentRequest: createPersonalAvatarUploadIntentRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **createPersonalAvatarUploadIntentRequest** | [**CreatePersonalAvatarUploadIntentRequest**](CreatePersonalAvatarUploadIntentRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalAvatarUploadIntentView**](PersonalAvatarUploadIntentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePersonalAvatar**
```swift
    open class func deletePersonalAvatar(idempotencyKey: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remover o avatar profissional

Remove o avatar do personal autenticado de forma idempotente. A remoção grava um tombstone: o `assetId` anterior deixa de resolver, as variantes temporárias já emitidas deixam de ser renovadas e nenhuma nova leitura do asset removido é autorizada. Depois da remoção `AvatarView` publica `state: NONE` e o cliente cai para as iniciais do nome. A remoção **não ressuscita o Google**: um login posterior com Google não reimporta a foto, e trazer a foto de volta exige um ato explícito — novo envio ou nova chamada de `POST /personal/profile/avatar/import-google`. A resposta é `204`: depois de removido o avatar não existe, e projetá-lo de volta contradiria a própria remoção. Repetir a remoção responde `204` outra vez, sem novo efeito e sem criar `mediaVersion`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Remover o avatar profissional
PersonalProfileAPI.deletePersonalAvatar(idempotencyKey: idempotencyKey, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalProfile**
```swift
    open class func getPersonalProfile(acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalProfileView?, _ error: Error?) -> Void)
```

Obter o Perfil do Personal autenticado

Projeção completa do Perfil do Personal **autenticado**, e somente dele: nome de apresentação, avatar, registro profissional autodeclarado, e-mail de acesso somente leitura, provider da sessão, elegibilidade para convidar, especialidades, modo de trabalho, preferências e o resumo da carteira de relacionamentos. Esta é a **única leitura** do contrato que projeta `AvatarView`, e por isso é o caminho de **poll** e de **reemissão** do ciclo publicado em 0.20.0: sem ela `state: PROCESSING` não teria onde ser consultado, `REJECTED` e `NONE` seriam inobserváveis e as variantes temporárias expirariam sem forma de reemissão. Cada leitura devolve variantes novas, com nova expiração; a identidade da mídia continua sendo o par `assetId` + `mediaVersion`, nunca a URL. Os quatro `PUT /personal/onboarding/{profile|specialties|work-style|preferences}` **permanecem válidos depois de `COMPLETED`** e seguem sendo os únicos commands de edição do Perfil: esta versão **não** cria command concorrente e não existe pré-condição de estado que os desative. O `revision` publicado aqui é exatamente o valor que o `If-Match` daqueles commands exige, e o `ETag` desta leitura é esse mesmo validador. `professionalRegistrationStatus` deriva **apenas** da presença de número + UF. Não existe validação externa, não existe selo e o contrato nunca afirma regularidade da pessoa em conselho profissional. O e-mail é **somente leitura**: nenhum request de edição publicado neste contrato transporta e-mail. Audiência: esta projeção é da própria pessoa. O que o **aluno** enxerga do personal permanece limitado a nome, avatar e CREF informado — nunca e-mail, cidade, especialidades, modo de trabalho, preferências ou contadores.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o Perfil do Personal autenticado
PersonalProfileAPI.getPersonalProfile(acceptLanguage: acceptLanguage) { (response, error) in
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

[**PersonalProfileView**](PersonalProfileView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **importPersonalAvatarFromGoogle**
```swift
    open class func importPersonalAvatarFromGoogle(idempotencyKey: String, acceptLanguage: String? = nil, completion: @escaping (_ data: AvatarView?, _ error: Error?) -> Void)
```

Importar o avatar profissional da identidade Google autenticada

Importa a foto de perfil **somente** a partir da identidade Google já autenticada da própria conta. A operação **não tem corpo de requisição**: não existe campo de URL, de origem alternativa nem de identificador externo, para que não haja como pedir ao servidor que busque uma imagem arbitrária. `USER_UPLOAD` prevalece: se o avatar vigente veio de envio manual, a importação responde `409 AVATAR_USER_UPLOAD_PRECEDENCE` e nada é sobrescrito. Um login posterior com Google nunca dispara esta operação implicitamente e nunca ressuscita um avatar removido. A indisponibilidade do provedor nunca bloqueia login nem onboarding: a falha é local a esta operação e o cliente segue com as iniciais do nome. Os bytes trazidos passam pelo mesmo scan do envio manual; quando o resultado é conhecido de forma síncrona, a rejeição é tipada em `422 AVATAR_REJECTED_BY_SCAN`. Repetir a importação com a mesma `Idempotency-Key` devolve a projeção original sem criar outra `mediaVersion`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Importar o avatar profissional da identidade Google autenticada
PersonalProfileAPI.importPersonalAvatarFromGoogle(idempotencyKey: idempotencyKey, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**AvatarView**](AvatarView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
