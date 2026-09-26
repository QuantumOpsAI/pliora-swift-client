# StudentOnboardingAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeStudentOnboarding**](StudentOnboardingAPI.md#completestudentonboarding) | **POST** /student/onboarding/complete | Concluir a anamnese funcional, fixando uma versão concluída imutável
[**getPersonalStudentAnamnesis**](StudentOnboardingAPI.md#getpersonalstudentanamnesis) | **GET** /personal/students/{studentId}/anamnesis | Ler, como personal do vínculo, o estado e as versões concluídas da anamnese do aluno
[**getStudentOnboarding**](StudentOnboardingAPI.md#getstudentonboarding) | **GET** /student/onboarding | Ler a entrada do aluno — onboarding, anamnese funcional, prontidão e elegibilidade
[**saveStudentAnamnesisSection**](StudentOnboardingAPI.md#savestudentanamnesissection) | **PUT** /student/onboarding/anamnesis/{sectionKey} | Salvar uma seção tipada da anamnese no rascunho privado do aluno


# **completeStudentOnboarding**
```swift
    open class func completeStudentOnboarding(idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentOnboardingCompletionView?, _ error: Error?) -> Void)
```

Concluir a anamnese funcional, fixando uma versão concluída imutável

Transforma o rascunho privado vigente em uma **versão concluída imutável**, com `If-Match` obrigatório, ecoando a mesma e única revisão desta superfície — `anamnesis.draft.revision`, publicada como `ETag` na leitura. Concluir **cria versão**; editar depois e concluir de novo cria **outra** versão e **preserva** a anterior, que continua consultável. Nenhuma versão é reescrita, apagada ou substituída em silêncio. A idempotência é **por versão, não por aluno**: repetir a mesma tentativa sobre a mesma `revision` devolve a mesma versão em vez de criar outra, e portanto produz no máximo uma notificação por versão concluída. A entrega real ao personal **não** é pós-condição desta operação e não é afirmada por ela. **Resposta canônica única, sem ramificação por idade.** Menor e adulto concluem exatamente da mesma forma. Triagem de prontidão pendente e autorização de responsável ausente **não** impedem concluir: elas aparecem apenas como motivos nomeados e acumuláveis em `prescriptionEligibility`. Não existe, aqui, resposta de \"conclusão pendente por responsável\", nem operação de autorização embutida. Concluir afirma que existe versão concluída; **não** afirma elegibilidade para prescrição.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Concluir a anamnese funcional, fixando uma versão concluída imutável
StudentOnboardingAPI.completeStudentOnboarding(idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentOnboardingCompletionView**](StudentOnboardingCompletionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentAnamnesis**
```swift
    open class func getPersonalStudentAnamnesis(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisView?, _ error: Error?) -> Void)
```

Ler, como personal do vínculo, o estado e as versões concluídas da anamnese do aluno

Leitura sem efeito colateral, autorizada somente ao personal do vínculo ativo. **Antes da primeira conclusão a resposta é apenas estado.** `anamnesisState` vale `IN_PROGRESS` e nenhum conteúdo do rascunho é projetado: sem respostas, sem resumo, sem contagem e sem percentual por seção. **Depois da primeira conclusão** a resposta carrega a última versão concluída e a lista das versões anteriores, com data. Uma edição em curso do aluno é invisível aqui e **não** devolve o estado a \"em andamento\": o personal continua vendo a última versão concluída até que outra seja concluída. A operação existe porque a leitura profissional não cabe, de modo compatível, na projeção do próprio aluno: o ator, a autorização e o recorte projetado são outros, e colapsá-los exporia rascunho privado. Ela **não** expõe identidade, nome ou contato de responsável, **não** oferece caminho para conceder, revogar ou consultar autorização de responsável e **não** registra liberação médica ou dispensa: essas superfícies não têm contrato nesta fatia. A autorização de responsável aparece exclusivamente como motivo nomeado em `prescriptionEligibility`. Um aluno inexistente e um aluno de outra relação respondem de forma indistinguível.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler, como personal do vínculo, o estado e as versões concluídas da anamnese do aluno
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

# **getStudentOnboarding**
```swift
    open class func getStudentOnboarding(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentOnboardingView?, _ error: Error?) -> Void)
```

Ler a entrada do aluno — onboarding, anamnese funcional, prontidão e elegibilidade

Projeção autenticada do próprio aluno. Publica **quatro estados distintos e não derivados um do outro**: estado do onboarding, `anamnesis.completed` (verdadeiro somente quando existe ao menos uma versão concluída), prontidão e `prescriptionEligibility`. Nenhum cliente calcula elegibilidade, idade, exigência de autorização de responsável ou prontidão a partir dos demais campos. O `anamnesis.draft` devolvido aqui é **privado do aluno**: ele existe para retomar o preenchimento. Ele nunca é projetado para o personal, em conteúdo, resumo, contagem ou percentual. **O `ETag` desta resposta é o validador do rascunho**, idêntico a `anamnesis.draft.revision`, e é exatamente o valor que `If-Match` ecoa nas duas mutações da anamnese: o par `GET` → `If-Match` da convenção HTTP funciona sem tradução. Ele **não** valida a projeção inteira, e por isso esta operação não oferece `If-None-Match` nem `304`: aqui o `ETag` é precondição, não cache. Não existe uma segunda revisão nesta superfície. Nenhum campo desta resposta representa estado de sincronização, fila local ou conectividade.

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

# **saveStudentAnamnesisSection**
```swift
    open class func saveStudentAnamnesisSection(sectionKey: StudentAnamnesisSectionKey, idempotencyKey: String, ifMatch: String, saveStudentAnamnesisSectionRequest: SaveStudentAnamnesisSectionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisDraftView?, _ error: Error?) -> Void)
```

Salvar uma seção tipada da anamnese no rascunho privado do aluno

Grava uma seção da anamnese funcional no **rascunho privado** do aluno. Salvar **não** conclui, **não** cria versão e **não** notifica o personal; antes da primeira conclusão o personal vê somente o fato de haver anamnese em andamento. **Não existe `answers` genérico.** O corpo carrega `section`, um `oneOf` discriminado por `sectionKey`, e cada membro fecha o próprio conteúdo com `additionalProperties: false`: uma seção sem membro publicado não é aceita por este contrato. A escrita é compare-and-set: `If-Match` com a revisão do rascunho — publicada tanto em `anamnesis.draft.revision` quanto no `ETag` da leitura, que são o mesmo valor — é obrigatório e duas edições concorrentes **nunca** aplicam last-write-wins — a perdedora recebe `412 PRECONDITION_FAILED` e o rascunho do servidor permanece exatamente como estava. A seção de **triagem de prontidão** (`READINESS_SCREENING` e o seu desdobramento) tem base própria de segurança da prestação do serviço: ela **não** tem pré-condição de consentimento destacado e **não** existe família de erro de consentimento nesta operação. Uma resposta positiva na triagem **não** impede continuar nem concluir; ela altera apenas a prontidão e a elegibilidade para prescrição. O contrato publica apenas a **chave** de cada pergunta do instrumento e a versão aplicada; a redação licenciada do instrumento não trafega por este contrato.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sectionKey = StudentAnamnesisSectionKey() // StudentAnamnesisSectionKey | Seção endereçada. `PUT` substitui **somente** esta seção do rascunho; as demais permanecem exatamente como estavam. O `sectionKey` do corpo seleciona o membro tipado do `oneOf` e precisa ser igual a este segmento: divergir é `422 ANAMNESIS_SECTION_KEY_MISMATCH`, nunca escrita na seção errada.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let saveStudentAnamnesisSectionRequest = SaveStudentAnamnesisSectionRequest(section: StudentAnamnesisSection(sectionKey: "sectionKey_example", primaryGoal: StudentTrainingGoal(), otherGoal: "otherGoal_example", expectedTimeframe: StudentGoalTimeframe(), instrumentVersion: "instrumentVersion_example", answers: [StudentReadinessScreeningAnswer(questionKey: StudentReadinessQuestionKey(), answer: "answer_example")], followUps: [StudentReadinessFollowUp(questionKey: nil, conditionDescription: "conditionDescription_example", controlled: false, underMedicalGuidance: false)], dateOfBirth: Date(), injuriesAndSurgeries: [StudentAnamnesisHistoryEntry(description: "description_example", occurredOn: Date())], currentLimitations: [StudentAnamnesisBodyRegionLimitation(bodyRegion: StudentBodyRegion(), intensity: "intensity_example", notes: "notes_example")], reportedConditions: [nil], medicationsInUse: [StudentAnamnesisMedicationEntry(name: "name_example", purpose: "purpose_example")], previousExperience: StudentTrainingExperience(), availableDaysPerWeek: 123, sessionDuration: DurationMinutesRange(minimum: 123, maximum: 123), trainingLocation: StudentTrainingLocation(), otherTrainingLocation: "otherTrainingLocation_example", availableEquipment: [StudentAvailableEquipment()], preferredTimeOfDay: StudentPreferredTimeOfDay())) // SaveStudentAnamnesisSectionRequest |
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
