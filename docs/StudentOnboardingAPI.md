# StudentOnboardingAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeStudentOnboarding**](StudentOnboardingAPI.md#completestudentonboarding) | **POST** /student/onboarding/complete | Concluir a anamnese funcional, fixando uma versão concluída imutável
[**getPersonalStudentAnamnesis**](StudentOnboardingAPI.md#getpersonalstudentanamnesis) | **GET** /personal/students/{studentId}/anamnesis | Ler, como personal do vínculo, a anamnese autorizada a este vínculo
[**getPersonalStudentAnamnesisControls**](StudentOnboardingAPI.md#getpersonalstudentanamnesiscontrols) | **GET** /personal/students/{studentId}/anamnesis/controls | Ler a exigência opcional e a solicitação de preenchimento da ficha deste vínculo
[**getPersonalStudentAnamnesisVersion**](StudentOnboardingAPI.md#getpersonalstudentanamnesisversion) | **GET** /personal/students/{studentId}/anamnesis/versions/{anamnesisVersionId} | Ler o conteúdo de uma versão da anamnese autorizada a este vínculo
[**getStudentAnamnesisConsent**](StudentOnboardingAPI.md#getstudentanamnesisconsent) | **GET** /student/anamnesis/consent | Recuperar o termo exato aceito no vínculo atual
[**getStudentAnamnesisPreviousVersionsGrant**](StudentOnboardingAPI.md#getstudentanamnesispreviousversionsgrant) | **GET** /student/anamnesis/previous-versions-grant | Ler quais versões anteriores o aluno autoriza ao personal do vínculo atual
[**getStudentOnboarding**](StudentOnboardingAPI.md#getstudentonboarding) | **GET** /student/onboarding | Ler a entrada do aluno — onboarding, anamnese funcional, prontidão e elegibilidade
[**listStudentAnamnesisVersions**](StudentOnboardingAPI.md#liststudentanamnesisversions) | **GET** /student/anamnesis/versions | Ler o próprio acervo de versões concluídas da anamnese, de todos os vínculos
[**requestPersonalStudentAnamnesisCompletion**](StudentOnboardingAPI.md#requestpersonalstudentanamnesiscompletion) | **PUT** /personal/students/{studentId}/anamnesis/controls/completion-request | Solicitar, dentro do app, o preenchimento da ficha deste vínculo
[**saveStudentAnamnesisSection**](StudentOnboardingAPI.md#savestudentanamnesissection) | **PUT** /student/onboarding/anamnesis/{sectionKey} | Salvar uma seção tipada da anamnese no rascunho privado do aluno
[**setPersonalStudentAnamnesisRequirement**](StudentOnboardingAPI.md#setpersonalstudentanamnesisrequirement) | **PUT** /personal/students/{studentId}/anamnesis/controls/requirement | Exigir, ou deixar de exigir, a conclusão da ficha deste vínculo para novas liberações
[**setStudentAnamnesisPreviousVersionsGrant**](StudentOnboardingAPI.md#setstudentanamnesispreviousversionsgrant) | **PUT** /student/anamnesis/previous-versions-grant | Autorizar, restringir ou revogar versões anteriores ao personal do vínculo atual


# **completeStudentOnboarding**
```swift
    open class func completeStudentOnboarding(idempotencyKey: String, ifMatch: String, completeStudentAnamnesisRequest: CompleteStudentAnamnesisRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentOnboardingCompletionView?, _ error: Error?) -> Void)
```

Concluir a anamnese funcional, fixando uma versão concluída imutável

Transforma o rascunho privado vigente em uma **versão concluída imutável**, com `If-Match` obrigatório, ecoando a mesma e única revisão desta superfície — `anamnesis.draft.revision`, publicada como `ETag` na leitura. Concluir **cria versão**; editar depois e concluir de novo cria **outra** versão e **preserva** a anterior, que continua consultável. Nenhuma versão é reescrita, apagada ou substituída em silêncio. A idempotência é **por versão, não por aluno**: repetir a mesma tentativa sobre a mesma `revision` devolve a mesma versão em vez de criar outra, e portanto produz no máximo uma notificação por versão concluída. A entrega real ao personal **não** é pós-condição desta operação e não é afirmada por ela. **Resposta canônica única, sem ramificação por idade.** Menor e adulto concluem exatamente da mesma forma. Triagem de prontidão pendente e autorização de responsável ausente **não** impedem concluir: elas aparecem apenas como motivos nomeados e acumuláveis em `prescriptionEligibility`. Não existe, aqui, resposta de \"conclusão pendente por responsável\", nem operação de autorização embutida. Concluir afirma que existe versão concluída; **não** afirma elegibilidade para prescrição. **Conclui a ficha do vínculo atual, não uma anamnese global (`DEC-PHOME-19`).** O corpo repete `relationshipId`, o vínculo dono da ficha lida; vínculo trocado depois da leitura é `409 ANAMNESIS_RELATIONSHIP_MISMATCH` e vínculo encerrado, sem outro atual, é `403 RELATIONSHIP_INACTIVE` — a ficha encerrada fica congelada, sem versão nova. Com o vínculo pausado a conclusão é aceita. A versão nasce com o aluno como autor, a ficha e o vínculo de origem, a revisão do rascunho e o instante do servidor; `versionNumber` é local à ficha. A conclusão é **única por ficha e revisão do rascunho**: duas conclusões concorrentes da mesma revisão, mesmo com chaves diferentes, devolvem a mesma versão, sem número duplicado; revisão velha é `412`, nunca last-write-wins. Nada de outra ficha conclui esta, e uma versão anterior autorizada ao personal não a substitui. A conclusão satisfaz, no mesmo commit, a solicitação de preenchimento pendente desta ficha. A repetição reautoriza o vínculo antes de devolver o resultado guardado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let completeStudentAnamnesisRequest = CompleteStudentAnamnesisRequest(relationshipId: "relationshipId_example") // CompleteStudentAnamnesisRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Concluir a anamnese funcional, fixando uma versão concluída imutável
StudentOnboardingAPI.completeStudentOnboarding(idempotencyKey: idempotencyKey, ifMatch: ifMatch, completeStudentAnamnesisRequest: completeStudentAnamnesisRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **completeStudentAnamnesisRequest** | [**CompleteStudentAnamnesisRequest**](CompleteStudentAnamnesisRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentOnboardingCompletionView**](StudentOnboardingCompletionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentAnamnesis**
```swift
    open class func getPersonalStudentAnamnesis(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisView?, _ error: Error?) -> Void)
```

Ler, como personal do vínculo, a anamnese autorizada a este vínculo

Leitura sem efeito colateral, autorizada somente ao personal do vínculo **ativo**, e reautorizada a cada chamada (`DEC-PHOME-19`). Cada novo vínculo tem a sua ficha, mesmo quando o aluno volta ao mesmo personal; a resposta fala da ficha **deste** vínculo e do que o aluno autorizou **a este** vínculo, e de nada mais. **Três dimensões separadas, no mesmo bloco da linha operacional.** `anamnesis` publica o fato global binário de conclusão, o preenchimento da ficha deste vínculo e se há versão anterior autorizada; `authorizedVersions` publica o conjunto autorizado por referência; nenhuma dimensão é inferida de outra, e o `COMPLETED` de antes — uma conclusão em qualquer ficha — não existe mais aqui. **O que autoriza cada versão.** A versão concluída da ficha deste vínculo é legível porque o aluno aceitou explicitamente o termo no commit do vínculo — consentimento registrado, não presumido, sem alternância. Uma versão de vínculo anterior só é legível quando o aluno a escolheu, por versão, para este vínculo (`setStudentAnamnesisPreviousVersionsGrant`), e deixa de ser quando ele revoga. A autorização é aplicada **antes** de selecionar a versão mais recente, contar, ordenar e projetar metadados: o servidor nunca entrega o acervo para o app filtrar. **Antes da primeira conclusão desta ficha a resposta é apenas estado:** `currentFormState` `NO_ANAMNESIS` ou `IN_PROGRESS`, sem conteúdo, resumo, contagem, percentual, data ou prontidão do rascunho. **Depois dela** viajam a referência e o conteúdo da versão mais recente da ficha deste vínculo, em `latestCurrentVersion`. Uma edição em curso do aluno é invisível aqui e **não** devolve o estado a \"em andamento\": o personal continua vendo a última versão concluída até que outra seja concluída. **Sem versão autorizada.** Com o fato global verdadeiro e `authorizedVersions` vazio, o app mostra a cópia do próprio catálogo para \"não há anamnese autorizada neste vínculo\"; não afirma que o aluno nunca concluiu, e o servidor não manda texto. Falha de leitura é erro com nova tentativa, nunca esta ausência. O conteúdo de uma versão anterior autorizada é lido em `getPersonalStudentAnamnesisVersion`, com o mesmo predicado. A operação existe porque a leitura profissional não cabe, de modo compatível, na projeção do próprio aluno: o ator, a autorização e o recorte projetado são outros, e colapsá-los exporia rascunho privado. Ela **não** expõe identidade, nome ou contato de responsável, **não** oferece caminho para conceder, revogar ou consultar autorização de responsável e **não** registra liberação médica ou dispensa: essas superfícies não têm contrato nesta fatia. A autorização de responsável aparece exclusivamente como motivo nomeado em `prescriptionEligibility`. Um aluno inexistente e um aluno de outra relação respondem de forma indistinguível. Vínculo pausado ou encerrado é `403` próprio, e nenhuma recusa expõe o fato global. Resposta `private, no-store`: nada fica em cache que restaure, depois de uma revogação, o que deixou de ser autorizado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler, como personal do vínculo, a anamnese autorizada a este vínculo
StudentOnboardingAPI.getPersonalStudentAnamnesis(studentId: studentId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisView**](PersonalStudentAnamnesisView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentAnamnesisControls**
```swift
    open class func getPersonalStudentAnamnesisControls(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisControlsView?, _ error: Error?) -> Void)
```

Ler a exigência opcional e a solicitação de preenchimento da ficha deste vínculo

Os dois atos do personal sobre a ficha do vínculo **ativo** (`DEC-PHOME-19` §5): se ele exige a conclusão da ficha deste vínculo para **novas** liberações, e a última solicitação de preenchimento feita dentro do app. Sem escolha explícita do personal a exigência é `false`. São fatos deste vínculo: um vínculo novo com o mesmo aluno começa sem eles. Não carrega conteúdo da ficha. O `ETag` é `revision`, a precondição de `setPersonalStudentAnamnesisRequirement`. Aluno inexistente ou de outra relação é o `404` indistinguível; vínculo pausado ou encerrado, o `403` próprio.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a exigência opcional e a solicitação de preenchimento da ficha deste vínculo
StudentOnboardingAPI.getPersonalStudentAnamnesisControls(studentId: studentId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisControlsView**](PersonalStudentAnamnesisControlsView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentAnamnesisVersion**
```swift
    open class func getPersonalStudentAnamnesisVersion(studentId: String, anamnesisVersionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisVersionView?, _ error: Error?) -> Void)
```

Ler o conteúdo de uma versão da anamnese autorizada a este vínculo

Conteúdo de **uma** versão concluída, relido e reautorizado a cada chamada pelo **mesmo predicado** de `getPersonalStudentAnamnesis` (`DEC-PHOME-19`): versão da ficha deste vínculo, legível pelo aceite real do termo, ou versão de vínculo anterior que o aluno autorizou a este vínculo e não revogou. O identificador opaco não concede acesso: versão inexistente, de outro aluno, de outro vínculo não autorizada ou cuja autorização foi revogada respondem o **mesmo** `404 STUDENT_RESOURCE_NOT_FOUND`, sem confirmar existência, número, data ou fato global. Vínculo pausado ou encerrado é o `403` próprio. Rascunho nunca é legível aqui. Resposta `private, no-store`: depois de uma revogação, nenhuma releitura devolve o conteúdo antes autorizado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let anamnesisVersionId = "anamnesisVersionId_example" // String | Versão pedida; identidade opaca, que não autoriza nada por si.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o conteúdo de uma versão da anamnese autorizada a este vínculo
StudentOnboardingAPI.getPersonalStudentAnamnesisVersion(studentId: studentId, anamnesisVersionId: anamnesisVersionId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **anamnesisVersionId** | **String** | Versão pedida; identidade opaca, que não autoriza nada por si. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisVersionView**](PersonalStudentAnamnesisVersionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentAnamnesisConsent**
```swift
    open class func getStudentAnamnesisConsent(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisConsentView?, _ error: Error?) -> Void)
```

Recuperar o termo exato aceito no vínculo atual

Comprovante, para o **próprio** aluno, do aceite real do termo `SHARE_DATA_WITH_PERSONAL` gravado no commit do vínculo atual (`DEC-PHOME-19` §3.1): o vínculo, a versão e o texto **exatos** apresentados e aceitos, o locale do texto e o instante do servidor. O texto nunca é reescrito quando o catálogo muda. É registro de um ato, não controle: não existe alternar o acesso do personal à ficha atual, e esta leitura não decide revogação, retenção nem as consequências jurídicas dela. Falha de leitura não é recusa do termo. Sem vínculo atual é `403 RELATIONSHIP_INACTIVE`; identidade sem contexto de aluno, `403 FORBIDDEN`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Recuperar o termo exato aceito no vínculo atual
StudentOnboardingAPI.getStudentAnamnesisConsent(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentAnamnesisConsentView**](StudentAnamnesisConsentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentAnamnesisPreviousVersionsGrant**
```swift
    open class func getStudentAnamnesisPreviousVersionsGrant(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisPreviousVersionsGrantView?, _ error: Error?) -> Void)
```

Ler quais versões anteriores o aluno autoriza ao personal do vínculo atual

O conjunto de versões de vínculos anteriores que o aluno autorizou, uma a uma, ao personal do **vínculo atual** (`DEC-PHOME-19` §3.2). Antes de qualquer escolha é vazio, com `updatedAt` ausente: nada vem marcado, nada é herdado de outro vínculo e nenhuma escolha é inferida. Não diz nada sobre a ficha atual, cujo acesso decorre do aceite real do termo e não tem alternância. O `ETag` é `revision`. Sem vínculo atual é `403 RELATIONSHIP_INACTIVE`; identidade sem contexto de aluno, `403 FORBIDDEN`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler quais versões anteriores o aluno autoriza ao personal do vínculo atual
StudentOnboardingAPI.getStudentAnamnesisPreviousVersionsGrant(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentAnamnesisPreviousVersionsGrantView**](StudentAnamnesisPreviousVersionsGrantView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentOnboarding**
```swift
    open class func getStudentOnboarding(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentOnboardingView?, _ error: Error?) -> Void)
```

Ler a entrada do aluno — onboarding, anamnese funcional, prontidão e elegibilidade

Projeção autenticada do próprio aluno. Publica **quatro estados distintos e não derivados um do outro**: estado do onboarding, `anamnesis.completed` (verdadeiro somente quando a **ficha do vínculo atual** tem ao menos uma versão concluída), prontidão e `prescriptionEligibility`. **Ficha por vínculo (`DEC-PHOME-19`).** `anamnesis` é a ficha do vínculo atual, identificada por `anamnesis.relationshipId`. Cada **novo** vínculo nasce com ficha própria e vazia — mesmo com o mesmo personal depois de um encerramento —, sem cópia, importação, pré-preenchimento ou promoção de resposta, versão ou rascunho anteriores; pausar e retomar o mesmo vínculo mantém a mesma ficha. **Com o vínculo pausado o aluno continua editando e concluindo a ficha**; o personal só a lê com o vínculo ativo. **Vínculo encerrado congela a ficha:** as escritas são `403 RELATIONSHIP_INACTIVE` e nenhuma versão nova nasce; retenção e acesso depois do encerramento não são definidos por este contrato. O aceite cria a obrigação da ficha e **nunca** a conclui ficticiamente. Salvar e continuar depois continua possível. Uma solicitação de preenchimento feita pelo personal aparece em `anamnesis.completionRequestedAt` enquanto pendente. Nenhum cliente calcula elegibilidade, idade, exigência de autorização de responsável ou prontidão a partir dos demais campos. O `anamnesis.draft` devolvido aqui é **privado do aluno**: ele existe para retomar o preenchimento. Ele nunca é projetado para o personal, em conteúdo, resumo, contagem ou percentual. **O `ETag` desta resposta é o validador do rascunho**, idêntico a `anamnesis.draft.revision`, e é exatamente o valor que `If-Match` ecoa nas duas mutações da anamnese: o par `GET` → `If-Match` da convenção HTTP funciona sem tradução. Ele **não** valida a projeção inteira, e por isso esta operação não oferece `If-None-Match` nem `304`: aqui o `ETag` é precondição, não cache. Não existe uma segunda revisão nesta superfície. Nenhum campo desta resposta representa estado de sincronização, fila local ou conectividade.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a entrada do aluno — onboarding, anamnese funcional, prontidão e elegibilidade
StudentOnboardingAPI.getStudentOnboarding(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentOnboardingView**](StudentOnboardingView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStudentAnamnesisVersions**
```swift
    open class func listStudentAnamnesisVersions(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisArchiveView?, _ error: Error?) -> Void)
```

Ler o próprio acervo de versões concluídas da anamnese, de todos os vínculos

O acervo do **próprio** aluno (`DEC-PHOME-19` §3.2): toda versão concluída de que a conta é autora, de qualquer ficha, com o vínculo em que nasceu, sem conteúdo. É daqui que o aluno escolhe, versão a versão, quais versões de vínculos anteriores autorizar ao personal do vínculo atual, em `setStudentAnamnesisPreviousVersionsGrant` — a anamnese não é categoria de compartilhamento da troca. Ler não copia, não importa e não pré-preenche a ficha atual, e não concede nada a ninguém. O personal **nunca** recebe este acervo. A autoria é o predicado: qualquer conta autenticada lê o próprio acervo, com ou sem vínculo vigente, e uma conta que nunca concluiu recebe lista vazia. Não reabre leitura profissional de vínculo encerrado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o próprio acervo de versões concluídas da anamnese, de todos os vínculos
StudentOnboardingAPI.listStudentAnamnesisVersions(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentAnamnesisArchiveView**](StudentAnamnesisArchiveView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestPersonalStudentAnamnesisCompletion**
```swift
    open class func requestPersonalStudentAnamnesisCompletion(studentId: String, idempotencyKey: String, requestPersonalStudentAnamnesisCompletionRequest: RequestPersonalStudentAnamnesisCompletionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisControlsView?, _ error: Error?) -> Void)
```

Solicitar, dentro do app, o preenchimento da ficha deste vínculo

Registra que o personal do vínculo **ativo** solicitou o preenchimento da ficha deste vínculo (`DEC-PHOME-19` §5) — \"cobrar\" aqui é esta solicitação, nunca cobrança financeira. O aluno a encontra em `getStudentOnboarding` (`anamnesis.completionRequestedAt`) quando abre o fluxo, e pode retomar o preenchimento. A confirmação ao personal é de **registro**, nunca de entrega ou leitura. Não há texto livre, prazo, agenda, push, badge, envio externo, IA nem motivo novo na fila de atenção. **Uma solicitação pendente por ficha:** pedir de novo enquanto ela está pendente devolve a mesma, sem criar outra — com qualquer chave. A conclusão da ficha a satisfaz no mesmo commit, por fato do servidor; pedir com a ficha já concluída é `409 ANAMNESIS_ALREADY_COMPLETED`, sem registro. Não altera `revision`. `relationshipId` diferente do vínculo ativo é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`. Sem rede não há solicitação confirmada.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let requestPersonalStudentAnamnesisCompletionRequest = RequestPersonalStudentAnamnesisCompletionRequest(relationshipId: "relationshipId_example") // RequestPersonalStudentAnamnesisCompletionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Solicitar, dentro do app, o preenchimento da ficha deste vínculo
StudentOnboardingAPI.requestPersonalStudentAnamnesisCompletion(studentId: studentId, idempotencyKey: idempotencyKey, requestPersonalStudentAnamnesisCompletionRequest: requestPersonalStudentAnamnesisCompletionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **requestPersonalStudentAnamnesisCompletionRequest** | [**RequestPersonalStudentAnamnesisCompletionRequest**](RequestPersonalStudentAnamnesisCompletionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisControlsView**](PersonalStudentAnamnesisControlsView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveStudentAnamnesisSection**
```swift
    open class func saveStudentAnamnesisSection(sectionKey: StudentAnamnesisSectionKey, idempotencyKey: String, ifMatch: String, saveStudentAnamnesisSectionRequest: SaveStudentAnamnesisSectionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisDraftView?, _ error: Error?) -> Void)
```

Salvar uma seção tipada da anamnese no rascunho privado do aluno

Grava uma seção da anamnese funcional no **rascunho privado** do aluno. Salvar **não** conclui, **não** cria versão e **não** notifica o personal; antes da primeira conclusão o personal vê somente o fato de haver anamnese em andamento. **Não existe `answers` genérico.** O corpo carrega `section`, um `oneOf` discriminado por `sectionKey`, e cada membro fecha o próprio conteúdo com `additionalProperties: false`: uma seção sem membro publicado não é aceita por este contrato. A escrita é compare-and-set: `If-Match` com a revisão do rascunho — publicada tanto em `anamnesis.draft.revision` quanto no `ETag` da leitura, que são o mesmo valor — é obrigatório e duas edições concorrentes **nunca** aplicam last-write-wins — a perdedora recebe `412 PRECONDITION_FAILED` e o rascunho do servidor permanece exatamente como estava. A seção de **triagem de prontidão** (`READINESS_SCREENING` e o seu desdobramento) tem base própria de segurança da prestação do serviço: ela **não** tem pré-condição de consentimento destacado e **não** existe família de erro de consentimento nesta operação. Uma resposta positiva na triagem **não** impede continuar nem concluir; ela altera apenas a prontidão e a elegibilidade para prescrição. O contrato publica apenas a **chave** de cada pergunta do instrumento e a versão aplicada; a redação licenciada do instrumento não trafega por este contrato. **Ficha do vínculo atual (`DEC-PHOME-19`).** O corpo repete `relationshipId`, o vínculo dono da ficha lida (`anamnesis.relationshipId`): se o vínculo foi trocado ou encerrado depois da leitura, a escrita é `409 ANAMNESIS_RELATIONSHIP_MISMATCH` e nada é gravado — nem na ficha antiga, nem na nova. A revisão do rascunho não basta para isso, porque cada ficha tem a sua. Vínculo pausado aceita a escrita; vínculo encerrado congela a ficha (`403 RELATIONSHIP_INACTIVE`). Uma edição depois da conclusão continua privada: o personal não vê sequer que ela existe. A repetição com a mesma `Idempotency-Key` reautoriza o vínculo antes de devolver o resultado guardado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sectionKey = StudentAnamnesisSectionKey() // StudentAnamnesisSectionKey | Seção endereçada. `PUT` substitui **somente** esta seção do rascunho; as demais permanecem exatamente como estavam. O `sectionKey` do corpo seleciona o membro tipado do `oneOf` e precisa ser igual a este segmento: divergir é `422 ANAMNESIS_SECTION_KEY_MISMATCH`, nunca escrita na seção errada.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let saveStudentAnamnesisSectionRequest = SaveStudentAnamnesisSectionRequest(relationshipId: "relationshipId_example", section: StudentAnamnesisSection(sectionKey: "sectionKey_example", primaryGoal: StudentTrainingGoal(), otherGoal: "otherGoal_example", expectedTimeframe: StudentGoalTimeframe(), instrumentVersion: "instrumentVersion_example", answers: [StudentReadinessScreeningAnswer(questionKey: StudentReadinessQuestionKey(), answer: "answer_example")], followUps: [StudentReadinessFollowUp(questionKey: nil, conditionDescription: "conditionDescription_example", controlled: false, underMedicalGuidance: false)], dateOfBirth: Date(), injuriesAndSurgeries: [StudentAnamnesisHistoryEntry(description: "description_example", occurredOn: Date())], currentLimitations: [StudentAnamnesisBodyRegionLimitation(bodyRegion: StudentBodyRegion(), intensity: "intensity_example", notes: "notes_example")], reportedConditions: [nil], medicationsInUse: [StudentAnamnesisMedicationEntry(name: "name_example", purpose: "purpose_example")], previousExperience: StudentTrainingExperience(), availableDaysPerWeek: 123, sessionDuration: DurationMinutesRange(minimum: 123, maximum: 123), trainingLocation: StudentTrainingLocation(), otherTrainingLocation: "otherTrainingLocation_example", availableEquipment: [StudentAvailableEquipment()], preferredTimeOfDay: StudentPreferredTimeOfDay())) // SaveStudentAnamnesisSectionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Salvar uma seção tipada da anamnese no rascunho privado do aluno
StudentOnboardingAPI.saveStudentAnamnesisSection(sectionKey: sectionKey, idempotencyKey: idempotencyKey, ifMatch: ifMatch, saveStudentAnamnesisSectionRequest: saveStudentAnamnesisSectionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **sectionKey** | [**StudentAnamnesisSectionKey**](.md) | Seção endereçada. &#x60;PUT&#x60; substitui **somente** esta seção do rascunho; as demais permanecem exatamente como estavam. O &#x60;sectionKey&#x60; do corpo seleciona o membro tipado do &#x60;oneOf&#x60; e precisa ser igual a este segmento: divergir é &#x60;422 ANAMNESIS_SECTION_KEY_MISMATCH&#x60;, nunca escrita na seção errada. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **saveStudentAnamnesisSectionRequest** | [**SaveStudentAnamnesisSectionRequest**](SaveStudentAnamnesisSectionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentAnamnesisDraftView**](StudentAnamnesisDraftView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setPersonalStudentAnamnesisRequirement**
```swift
    open class func setPersonalStudentAnamnesisRequirement(studentId: String, idempotencyKey: String, ifMatch: String, setPersonalStudentAnamnesisRequirementRequest: SetPersonalStudentAnamnesisRequirementRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisControlsView?, _ error: Error?) -> Void)
```

Exigir, ou deixar de exigir, a conclusão da ficha deste vínculo para novas liberações

Registra a **escolha explícita** do personal, com autoria, vínculo, instante do servidor e revisão nova (`DEC-PHOME-19` §5, resposta A). **Somente novas liberações:** ligada, e enquanto a ficha deste vínculo não estiver concluída, `publishPersonalPrescriptionDraft`, `assignPersonalStudentWorkout` e `activatePersonalStudentPlan` recusam com `409 STUDENT_NOT_ELIGIBLE` e `ANAMNESIS_NOT_COMPLETED`, avaliado pelo servidor no mesmo ponto transacional da ação, sem confiar em leitura anterior do app — e também `updatePersonalStudentPlanActivation`, que troca a programação a partir de hoje. Nada já liberado é retirado, despublicado, suspenso ou bloqueado; iniciar, retomar ou concluir treino já liberado e sessão em andamento nunca são recusados por ela. Cada escolha fica num histórico **append-only** (autor, vínculo, instante, revisão); esta operação e a leitura publicam a vigente. Desligar retira **somente** esse motivo: prontidão, idade, vínculo e os demais portões continuam. A escolha não dispensa a ficha, que continua obrigatória como processo, não concede acesso a respostas e não muda `DEC-CONV-9`. Conclusão de outro vínculo, versão anterior autorizada, aceite do termo e reconhecimento de revisão não satisfazem a condição. **Compare-and-set:** `If-Match` ecoa `revision` lida em `getPersonalStudentAnamnesisControls`; revisão velha é `412 PRECONDITION_FAILED`, sem gravar e sem mesclar. `relationshipId` diferente do vínculo ativo — inclusive um vínculo anterior com o mesmo aluno — é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado, sem novo ato, **depois** de reautorizar o vínculo: perdida a autorização, a repetição recebe a recusa corrente, nunca a resposta antiga. Outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`. Sem rede não há escolha confirmada.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let setPersonalStudentAnamnesisRequirementRequest = SetPersonalStudentAnamnesisRequirementRequest(relationshipId: "relationshipId_example", requireCurrentCompletion: false) // SetPersonalStudentAnamnesisRequirementRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Exigir, ou deixar de exigir, a conclusão da ficha deste vínculo para novas liberações
StudentOnboardingAPI.setPersonalStudentAnamnesisRequirement(studentId: studentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, setPersonalStudentAnamnesisRequirementRequest: setPersonalStudentAnamnesisRequirementRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **setPersonalStudentAnamnesisRequirementRequest** | [**SetPersonalStudentAnamnesisRequirementRequest**](SetPersonalStudentAnamnesisRequirementRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisControlsView**](PersonalStudentAnamnesisControlsView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setStudentAnamnesisPreviousVersionsGrant**
```swift
    open class func setStudentAnamnesisPreviousVersionsGrant(idempotencyKey: String, ifMatch: String, setStudentAnamnesisPreviousVersionsGrantRequest: SetStudentAnamnesisPreviousVersionsGrantRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisPreviousVersionsGrantView?, _ error: Error?) -> Void)
```

Autorizar, restringir ou revogar versões anteriores ao personal do vínculo atual

**Substitui exatamente** o conjunto de versões de vínculos anteriores autorizadas ao personal do vínculo atual (`DEC-PHOME-19` §3.2): a lista enviada passa a ser o conjunto, sem mesclar com o anterior; lista vazia revoga tudo. Revogar retira a leitura na próxima releitura do personal e **não apaga** versão nenhuma do acervo do aluno. A autorização é por versão e por vínculo destinatário: não alcança versões futuras, nunca alcança a ficha do vínculo atual — cujo acesso decorre do aceite do termo, sem alternância —, não satisfaz o preenchimento obrigatório da ficha atual, não promove a versão a atual e não faz nascer item na fila do personal. Cada ato fica registrado com autoria, vínculo destinatário, instante e revisão. **Validação atômica:** cada versão precisa ser do próprio aluno, concluída e de vínculo **diferente** do destinatário; uma só que falhe recusa o conjunto inteiro com `422 ANAMNESIS_VERSION_SELECTION_INVALID`, sem dizer qual — inclusive a de outra conta, que não tem a existência confirmada. **Compare-and-set:** `If-Match` ecoa `revision`; revisão velha é `412 PRECONDITION_FAILED`, sem gravar e sem mesclar duas escolhas. `relationshipId` diferente do vínculo atual — porque ele foi trocado ou encerrado depois da leitura — é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`. Sem vínculo atual, `403 RELATIONSHIP_INACTIVE`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`. Sem rede não há autorização confirmada.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let setStudentAnamnesisPreviousVersionsGrantRequest = SetStudentAnamnesisPreviousVersionsGrantRequest(relationshipId: "relationshipId_example", versionIds: ["versionIds_example"]) // SetStudentAnamnesisPreviousVersionsGrantRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Autorizar, restringir ou revogar versões anteriores ao personal do vínculo atual
StudentOnboardingAPI.setStudentAnamnesisPreviousVersionsGrant(idempotencyKey: idempotencyKey, ifMatch: ifMatch, setStudentAnamnesisPreviousVersionsGrantRequest: setStudentAnamnesisPreviousVersionsGrantRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **setStudentAnamnesisPreviousVersionsGrantRequest** | [**SetStudentAnamnesisPreviousVersionsGrantRequest**](SetStudentAnamnesisPreviousVersionsGrantRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentAnamnesisPreviousVersionsGrantView**](StudentAnamnesisPreviousVersionsGrantView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
