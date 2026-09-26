# PersonalPrescriptionAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**assignPersonalStudentWorkout**](PersonalPrescriptionAPI.md#assignpersonalstudentworkout) | **POST** /personal/students/{studentId}/workout-assignments | Atribuir um treino de versão publicada a uma data do aluno
[**createPersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#createpersonalprescriptiondraft) | **POST** /personal/prescription-drafts | Criar rascunho de prescrição, vazio ou derivado de uma versão publicada
[**getPersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#getpersonalprescriptiondraft) | **GET** /personal/prescription-drafts/{draftId} | Ler o rascunho de prescrição em edição
[**getPersonalStudentSchedule**](PersonalPrescriptionAPI.md#getpersonalstudentschedule) | **GET** /personal/students/{studentId}/schedule | Ler a semana de treino do aluno vinculado
[**publishPersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#publishpersonalprescriptiondraft) | **POST** /personal/prescription-drafts/{draftId}/publication | Publicar o rascunho como versão imutável
[**retirePersonalStudentWorkoutAssignment**](PersonalPrescriptionAPI.md#retirepersonalstudentworkoutassignment) | **POST** /personal/students/{studentId}/workout-assignments/{assignmentId}/retirement | Retirar uma atribuição de treino do aluno
[**updatePersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#updatepersonalprescriptiondraft) | **PUT** /personal/prescription-drafts/{draftId} | Editar a estrutura do rascunho com revisão esperada


# **assignPersonalStudentWorkout**
```swift
    open class func assignPersonalStudentWorkout(studentId: String, idempotencyKey: String, assignWorkoutRequest: AssignWorkoutRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutAssignmentView?, _ error: Error?) -> Void)
```

Atribuir um treino de versão publicada a uma data do aluno

Disponibiliza um treino de uma versão **publicada** para uma data civil do aluno. A atribuição referencia a versão por identidade e **nunca copia** o conteúdo prescrito para o dia; alterar a prescrição gera versão nova e atribuição nova, sem reescrever sessões históricas. Uma versão em rascunho é recusada com `409 PRESCRIPTION_VERSION_NOT_PUBLISHED`. Existe no máximo uma atribuição vigente por par aluno/data: uma segunda é `409 ASSIGNMENT_DATE_CONFLICT`, explícita, sem last-write-wins e sem o relógio do device arbitrar o desempate. A data civil é resolvida no timezone do vínculo, que é autoridade do servidor. Um aluno que ainda não pode receber prescrição nova é `409 STUDENT_NOT_ELIGIBLE`, com `blockingReasons` nomeando o que falta — a mesma recusa, com o mesmo código e o mesmo vocabulário, que `publishPersonalPrescriptionDraft` emite. A elegibilidade incide sobre entregar prescrição nova ao aluno; **retirar uma atribuição nunca é recusado por ela**, porque retirar remove em vez de entregar, e bloqueá-la prenderia o aluno a um treino que ninguém poderia tirar.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let assignWorkoutRequest = AssignWorkoutRequest(assignmentId: "assignmentId_example", prescriptionVersionId: "prescriptionVersionId_example", workoutId: "workoutId_example", localDate: Date()) // AssignWorkoutRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Atribuir um treino de versão publicada a uma data do aluno
PersonalPrescriptionAPI.assignPersonalStudentWorkout(studentId: studentId, idempotencyKey: idempotencyKey, assignWorkoutRequest: assignWorkoutRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **assignWorkoutRequest** | [**AssignWorkoutRequest**](AssignWorkoutRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutAssignmentView**](WorkoutAssignmentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalPrescriptionDraft**
```swift
    open class func createPersonalPrescriptionDraft(idempotencyKey: String, createPrescriptionDraftRequest: CreatePrescriptionDraftRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PrescriptionDraftView?, _ error: Error?) -> Void)
```

Criar rascunho de prescrição, vazio ou derivado de uma versão publicada

Cria o rascunho que o personal edita antes de publicar. O rascunho é a própria versão de prescrição no estado `DRAFT`: publicar depois preserva esta identidade em vez de emitir outra. **A identidade nasce no cliente.** `draftId` é gerado no device e adotado pelo servidor, de modo que um rascunho criado sem rede mantenha a mesma identidade ao sincronizar; o replay com o mesmo corpo devolve o rascunho original sem duplicar, e a mesma identidade com corpo diferente é `409 DRAFT_IDENTITY_DIVERGENT`, nunca sobrescrita silenciosa. Derivar de `sourcePrescriptionVersionId` copia a estrutura publicada para o rascunho novo e **não toca** na versão de origem, que permanece imutável e legível. A escrita é autorizada somente ao personal do vínculo ativo; um aluno fora do vínculo responde de forma indistinguível de inexistente. Este caminho HTTP e o command `prescription.draft.create` do envelope de sync coexistem: são a mesma regra de negócio com o mesmo efeito idempotente.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createPrescriptionDraftRequest = CreatePrescriptionDraftRequest(draftId: "draftId_example", studentId: "studentId_example", name: "name_example", sourcePrescriptionVersionId: "sourcePrescriptionVersionId_example") // CreatePrescriptionDraftRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Criar rascunho de prescrição, vazio ou derivado de uma versão publicada
PersonalPrescriptionAPI.createPersonalPrescriptionDraft(idempotencyKey: idempotencyKey, createPrescriptionDraftRequest: createPrescriptionDraftRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **createPrescriptionDraftRequest** | [**CreatePrescriptionDraftRequest**](CreatePrescriptionDraftRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PrescriptionDraftView**](PrescriptionDraftView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalPrescriptionDraft**
```swift
    open class func getPersonalPrescriptionDraft(draftId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PrescriptionDraftView?, _ error: Error?) -> Void)
```

Ler o rascunho de prescrição em edição

Leitura sem efeito colateral do rascunho do personal autor. Devolve a estrutura autorada inteira e a `revision` opaca que a edição precisa ecoar em `If-Match`. Um rascunho de outra relação e um rascunho inexistente respondem de forma idêntica, sem revelar existência de conta, vínculo ou prescrição.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let draftId = "draftId_example" // String | Identidade do rascunho, criada pelo cliente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o rascunho de prescrição em edição
PersonalPrescriptionAPI.getPersonalPrescriptionDraft(draftId: draftId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **draftId** | **String** | Identidade do rascunho, criada pelo cliente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PrescriptionDraftView**](PrescriptionDraftView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentSchedule**
```swift
    open class func getPersonalStudentSchedule(studentId: String, acceptLanguage: String? = nil, weekOf: Date? = nil, completion: @escaping (_ data: PersonalStudentScheduleView?, _ error: Error?) -> Void)
```

Ler a semana de treino do aluno vinculado

Leitura da tela Programação pelo personal do vínculo ativo. Devolve a **semana canônica**: o servidor define o primeiro dia da semana, o intervalo efetivo em datas civis com timezone IANA e a data de hoje, derivada do relógio do servidor no timezone de registro do vínculo. Qualquer data de referência, offset ou timezone enviado pelo cliente como autoridade é ignorado e nunca desloca a marcação de hoje; o locale do device não move o primeiro dia. A resposta traz os sete dias do intervalo, sem omitir nenhum, e cada dia carrega exatamente um estado de máquina. Dia atribuído e concluído expõe a referência do fato executado e a referência da versão prescrita como **campos distintos** — o executado nunca reescreve o prescrito. Dia sem atribuição vem presente com `NO_ASSIGNMENT`, nunca como dia ausente ou campo nulo solto. Dias fora do período do vínculo vêm com `OUTSIDE_RELATIONSHIP_PERIOD` e sem qualquer conteúdo prescrito ou executado, de modo que nenhum dado de outro vínculo seja exposto. Uma janela além do limite de semanas navegáveis do servidor é `422 SCHEDULE_WINDOW_TOO_FAR`; o cliente não amplia esse limite. A leitura do aluno sobre a própria semana continua em `GET /student/schedule`, que permanece inalterada.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo. Sem vínculo ativo, ou para aluno de outro personal, a resposta é a mesma usada para dado inexistente e não revela se o aluno, a atribuição ou o vínculo existem.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let weekOf = Date() // Date | Data civil contida na semana desejada; ausente devolve a semana de hoje. O servidor normaliza para a semana canônica e é a autoridade do intervalo. (optional)

// Ler a semana de treino do aluno vinculado
PersonalPrescriptionAPI.getPersonalStudentSchedule(studentId: studentId, acceptLanguage: acceptLanguage, weekOf: weekOf) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo ativo. Sem vínculo ativo, ou para aluno de outro personal, a resposta é a mesma usada para dado inexistente e não revela se o aluno, a atribuição ou o vínculo existem. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **weekOf** | **Date** | Data civil contida na semana desejada; ausente devolve a semana de hoje. O servidor normaliza para a semana canônica e é a autoridade do intervalo. | [optional]

### Return type

[**PersonalStudentScheduleView**](PersonalStudentScheduleView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **publishPersonalPrescriptionDraft**
```swift
    open class func publishPersonalPrescriptionDraft(draftId: String, idempotencyKey: String, ifMatch: String, publishPrescriptionDraftRequest: PublishPrescriptionDraftRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PrescriptionVersionView?, _ error: Error?) -> Void)
```

Publicar o rascunho como versão imutável

Transição `DRAFT → PUBLISHED` do próprio rascunho, com `If-Match` obrigatório. **Publicar não é `PUT` destrutivo**: o número da versão, o instante de publicação e a supersessão da versão anterior são emitidos pelo servidor, as versões anteriores permanecem íntegras e legíveis, e nenhuma sessão já iniciada muda de versão — ela continua fixada na que a originou. A publicação é idempotente pela identidade e pela `Idempotency-Key`: repetir devolve a mesma versão em vez de criar outra. Um rascunho que ainda não forma uma prescrição válida (treino sem exercício, exercício sem série, variante inativa, alternativa sem tipo coerente) é `422 DRAFT_INCOMPLETE` com `fieldErrors` apontando o caminho, sem publicar nada. Um aluno que ainda não pode receber prescrição nova — anamnese não concluída, prontidão aguardando liberação, autorização de responsável ausente — é `409 STUDENT_NOT_ELIGIBLE`, com `blockingReasons` nomeando o que falta. Não é borda: é o caminho comum de quem acabou de aceitar o convite. O corpo enviado estava correto e nada nele conserta a recusa, por isso não é `422`; o rascunho permanece editável e volta a poder ser publicado quando a elegibilidade mudar. **Rascunhar continua aberto**: o portão incide sobre entregar prescrição ao aluno, e não sobre o personal escrever.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let draftId = "draftId_example" // String | Rascunho a publicar; a versão publicada preserva esta identidade.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let publishPrescriptionDraftRequest = PublishPrescriptionDraftRequest(draftId: "draftId_example") // PublishPrescriptionDraftRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Publicar o rascunho como versão imutável
PersonalPrescriptionAPI.publishPersonalPrescriptionDraft(draftId: draftId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, publishPrescriptionDraftRequest: publishPrescriptionDraftRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **draftId** | **String** | Rascunho a publicar; a versão publicada preserva esta identidade. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **publishPrescriptionDraftRequest** | [**PublishPrescriptionDraftRequest**](PublishPrescriptionDraftRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PrescriptionVersionView**](PrescriptionVersionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **retirePersonalStudentWorkoutAssignment**
```swift
    open class func retirePersonalStudentWorkoutAssignment(studentId: String, assignmentId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutAssignmentView?, _ error: Error?) -> Void)
```

Retirar uma atribuição de treino do aluno

Retira a atribuição de uma data. É **fato registrado**, não remoção: a atribuição continua presente com `status: RETIRED`, de modo que o cliente distinga atribuição ausente de atribuição retirada, e o delta a projeta como `UPSERT`, nunca como tombstone. Nenhuma sessão histórica é apagada e nenhuma sessão em andamento muda de versão. Repetir a retirada converge e devolve o mesmo estado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String |
let assignmentId = "assignmentId_example" // String |
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Retirar uma atribuição de treino do aluno
PersonalPrescriptionAPI.retirePersonalStudentWorkoutAssignment(studentId: studentId, assignmentId: assignmentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** |  |
 **assignmentId** | **String** |  |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutAssignmentView**](WorkoutAssignmentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePersonalPrescriptionDraft**
```swift
    open class func updatePersonalPrescriptionDraft(idempotencyKey: String, ifMatch: String, draftId: String, updatePrescriptionDraftRequest: UpdatePrescriptionDraftRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PrescriptionDraftView?, _ error: Error?) -> Void)
```

Editar a estrutura do rascunho com revisão esperada

Substitui a estrutura autorada do rascunho por compare-and-set. `If-Match` com a `revision` lida é obrigatório: duas edições concorrentes **nunca** aplicam last-write-wins — a perdedora recebe `412 PRECONDITION_FAILED` e o conteúdo do servidor permanece como estava, para que o personal reconcilie explicitamente. A edição alcança somente o estado `DRAFT`. Uma versão já publicada é imutável: editá-la é `409 DRAFT_NOT_EDITABLE`, e revisar exige criar um rascunho novo derivado dela. Carga, repetições, descanso e política de ordem pertencem à série e ao exercício prescritos; ausência legítima permanece ausente e nunca vira zero.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let draftId = "draftId_example" // String | Identidade do rascunho, criada pelo cliente.
let updatePrescriptionDraftRequest = UpdatePrescriptionDraftRequest(content: PrescriptionDraftContent(name: "name_example", workouts: [PrescriptionDraftWorkout(workoutId: "workoutId_example", name: "name_example", focus: "focus_example", position: 123, exercises: [PrescriptionDraftExercise(prescribedExerciseId: "prescribedExerciseId_example", exerciseId: "exerciseId_example", prescribedVariantId: "prescribedVariantId_example", position: 123, orderPolicy: PrescribedOrderPolicy(), blockKey: "blockKey_example", dependsOnPrescribedExerciseId: "dependsOnPrescribedExerciseId_example", notes: "notes_example", restRange: PrescribedRestRange(minSeconds: 123, maxSeconds: 123), sets: [PrescriptionDraftSet(prescribedSetId: "prescribedSetId_example", setIndex: 123, target: PrescribedTarget(repsMin: 123, repsMax: 123, repsExact: 123, loadValue: 123, loadUnit: PrescribedLoadUnit(), effortType: PrescribedEffortType(), effortValue: 123))], alternatives: [PrescriptionDraftAlternative(alternativeId: "alternativeId_example", alternativeType: PrescribedAlternativeType(), variantId: "variantId_example", exerciseId: "exerciseId_example", priority: 123, authorizationScope: PrescribedAuthorizationScope())])])])) // UpdatePrescriptionDraftRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Editar a estrutura do rascunho com revisão esperada
PersonalPrescriptionAPI.updatePersonalPrescriptionDraft(idempotencyKey: idempotencyKey, ifMatch: ifMatch, draftId: draftId, updatePrescriptionDraftRequest: updatePrescriptionDraftRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **draftId** | **String** | Identidade do rascunho, criada pelo cliente. |
 **updatePrescriptionDraftRequest** | [**UpdatePrescriptionDraftRequest**](UpdatePrescriptionDraftRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PrescriptionDraftView**](PrescriptionDraftView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
