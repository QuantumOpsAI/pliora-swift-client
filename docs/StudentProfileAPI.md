# StudentProfileAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getStudentProfile**](StudentProfileAPI.md#getstudentprofile) | **GET** /student/profile | Obter o perfil do aluno autenticado
[**saveStudentProfile**](StudentProfileAPI.md#savestudentprofile) | **PUT** /student/profile | Informar ou trocar o nome do aluno


# **getStudentProfile**
```swift
    open class func getStudentProfile(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentProfileView?, _ error: Error?) -> Void)
```

Obter o perfil do aluno autenticado

Projeção do perfil do **próprio aluno**: o nome que ele informou e a `revision` que o `If-Match` de `saveStudentProfile` exige. O `ETag` desta leitura carrega o mesmo validador que `revision`. O nome é **obrigatório** (`DEC-PHOME-6`), e a obrigatoriedade vale na escrita (`saveStudentProfile`: `null`, vazio e omitido são `422`) e no aceite do vínculo (`409 INVALID_ONBOARDING_TRANSITION` com `blockingStepKey: STUDENT_PROFILE_NAME`), não nesta leitura. Enquanto a conta **nunca informou** o nome — estado que só existe antes do passo `STUDENT_PROFILE_NAME` do onboarding —, a resposta é `200` com `revision` e **sem** `displayName`, nunca nulo nem vazio; é a semântica de leitura que o perfil sempre teve, e não é erro. Depois de informado, `displayName` está **sempre presente**, de 1 a 60 caracteres, e nunca volta a faltar: não existe apagar o nome, só trocá-lo. A leitura não depende de vínculo: o perfil é da conta, e uma conta com contexto de aluno o lê com ou sem personal. O perfil publica somente `revision` e `displayName`. Não carrega e-mail, data de criação, avatar, consentimento nem manifesto de visibilidade. Convite, e-mail e provedor de identidade nunca são fonte do nome. Esta operação é a leitura do **próprio** aluno. O nome chega ao personal com vínculo ativo ou pausado por outra superfície, a carteira, como `studentName`, em operação própria; nenhuma leitura do personal transporta este perfil.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o perfil do aluno autenticado
StudentProfileAPI.getStudentProfile(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentProfileView**](StudentProfileView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveStudentProfile**
```swift
    open class func saveStudentProfile(ifMatch: String, saveStudentProfileRequest: SaveStudentProfileRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: SavedStudentProfileView?, _ error: Error?) -> Void)
```

Informar ou trocar o nome do aluno

Grava o nome do **próprio** aluno por compare-and-set, e só ele escreve. `If-Match` é obrigatório e ecoa o `ETag` lido; o `revision` do corpo é a revisão em que o cliente se baseou. Nunca há last-write-wins. `displayName` é **obrigatório** (`DEC-PHOME-6`), sem exceção na escrita, e tem de 1 a 60 caracteres (code points Unicode, não unidades UTF-16), em qualquer escrita: o servidor **preserva o texto byte a byte** — não apara espaços, não normaliza Unicode, não corrige caixa — e não valida se o texto é um \"nome real\". **Não existe apagar o nome:** o aluno o informa no onboarding (passo `STUDENT_PROFILE_NAME`, antes do aceite do vínculo) e depois só o troca; `displayName: null`, texto vazio e campo omitido são recusados com `422`. **Respostas, um código por caso, nada é gravado em nenhuma recusa**, no padrão de `savePersonalProfile`. `422 VALIDATION_ERROR`: corpo que não é exatamente `revision` e `displayName`, ou `displayName` nulo, vazio ou fora de 1 a 60 caracteres, com `fieldErrors`. `412 PRECONDITION_FAILED`: `If-Match` ausente, malformado ou diferente do `ETag` corrente. `409 REVISION_CONFLICT`: o `If-Match` confere, mas o `revision` do corpo diverge da revisão corrente. **Ordem de avaliação:** o corpo é validado primeiro (`422`), depois o `If-Match` (`412`), depois a `revision` do corpo (`409`); com mais de um defeito vale o primeiro dessa ordem, como no perfil do personal. Nos dois conflitos o cliente relê `getStudentProfile`, mostra o valor do servidor e pede para salvar de novo. O `200` devolve o perfil com a **nova** `revision`, diferente da anterior, e o `ETag` igual a ela. Salvar o mesmo texto de novo também é uma escrita e também troca a revisão. O contrato não pede `Idempotency-Key`: a revisão é a guarda contra a repetição.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let saveStudentProfileRequest = SaveStudentProfileRequest(revision: "revision_example", displayName: "displayName_example") // SaveStudentProfileRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Informar ou trocar o nome do aluno
StudentProfileAPI.saveStudentProfile(ifMatch: ifMatch, saveStudentProfileRequest: saveStudentProfileRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **saveStudentProfileRequest** | [**SaveStudentProfileRequest**](SaveStudentProfileRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**SavedStudentProfileView**](SavedStudentProfileView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
