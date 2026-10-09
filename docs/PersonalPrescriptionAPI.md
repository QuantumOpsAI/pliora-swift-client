# PersonalPrescriptionAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activatePersonalStudentPlan**](PersonalPrescriptionAPI.md#activatepersonalstudentplan) | **POST** /personal/students/{studentId}/plan-activations | Ativar uma versão publicada do plano do aluno, por dias da semana ou em sequência
[**archivePersonalWorkoutTemplate**](PersonalPrescriptionAPI.md#archivepersonalworkouttemplate) | **DELETE** /personal/workout-templates/{templateId} | Arquivar (excluir) o modelo de treino
[**assignPersonalStudentWorkout**](PersonalPrescriptionAPI.md#assignpersonalstudentworkout) | **POST** /personal/students/{studentId}/workout-assignments | Atribuir um treino de versão publicada a uma data do aluno
[**createPersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#createpersonalprescriptiondraft) | **POST** /personal/prescription-drafts | Criar rascunho de prescrição, em branco, revisão, cópia de outro aluno ou a partir de um modelo
[**createPersonalWorkoutTemplate**](PersonalPrescriptionAPI.md#createpersonalworkouttemplate) | **POST** /personal/workout-templates | Criar modelo de treino, vazio, a partir de um plano ou duplicando outro modelo
[**deletePersonalStudentReferenceLoad**](PersonalPrescriptionAPI.md#deletepersonalstudentreferenceload) | **DELETE** /personal/students/{studentId}/reference-loads/{variantId} | Remover a carga de referência confirmada de uma variante do aluno
[**discardPersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#discardpersonalprescriptiondraft) | **DELETE** /personal/prescription-drafts/{draftId} | Descartar o rascunho aberto do aluno
[**endPersonalStudentPlanActivation**](PersonalPrescriptionAPI.md#endpersonalstudentplanactivation) | **POST** /personal/students/{studentId}/plan-activations/{activationId}/end | Encerrar a ativação vigente do plano do aluno
[**getPersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#getpersonalprescriptiondraft) | **GET** /personal/prescription-drafts/{draftId} | Ler o rascunho de prescrição em edição
[**getPersonalPrescriptionVersion**](PersonalPrescriptionAPI.md#getpersonalprescriptionversion) | **GET** /personal/prescription-versions/{versionId} | Ler o conteúdo de uma versão publicada do plano
[**getPersonalStudentPlanActivation**](PersonalPrescriptionAPI.md#getpersonalstudentplanactivation) | **GET** /personal/students/{studentId}/plan-activation | Ler a programação vigente do plano de um aluno
[**getPersonalStudentPrescription**](PersonalPrescriptionAPI.md#getpersonalstudentprescription) | **GET** /personal/students/{studentId}/prescription | Ler o contexto do plano de treino de um aluno
[**getPersonalStudentReferenceLoads**](PersonalPrescriptionAPI.md#getpersonalstudentreferenceloads) | **GET** /personal/students/{studentId}/reference-loads | Ler as cargas de referência de um aluno
[**getPersonalStudentSchedule**](PersonalPrescriptionAPI.md#getpersonalstudentschedule) | **GET** /personal/students/{studentId}/schedule | Ler a semana de treino do aluno vinculado
[**getPersonalWorkoutTemplate**](PersonalPrescriptionAPI.md#getpersonalworkouttemplate) | **GET** /personal/workout-templates/{templateId} | Ler o modelo de treino inteiro
[**importPersonalPrescriptionDraftContent**](PersonalPrescriptionAPI.md#importpersonalprescriptiondraftcontent) | **POST** /personal/prescription-drafts/{draftId}/imports | Acrescentar ao rascunho treinos de um modelo ou de uma versão publicada
[**listPersonalPrescriptions**](PersonalPrescriptionAPI.md#listpersonalprescriptions) | **GET** /personal/prescriptions | Listar os planos de treino dos alunos do personal (aba Treinos)
[**listPersonalStudentPrescriptionVersions**](PersonalPrescriptionAPI.md#listpersonalstudentprescriptionversions) | **GET** /personal/students/{studentId}/prescription/versions | Listar o histórico de versões publicadas do plano de um aluno
[**listPersonalWorkoutTemplates**](PersonalPrescriptionAPI.md#listpersonalworkouttemplates) | **GET** /personal/workout-templates | Listar os modelos de treino do personal (seção Modelos da aba Treinos)
[**publishPersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#publishpersonalprescriptiondraft) | **POST** /personal/prescription-drafts/{draftId}/publication | Publicar o rascunho como versão imutável
[**putPersonalStudentReferenceLoad**](PersonalPrescriptionAPI.md#putpersonalstudentreferenceload) | **PUT** /personal/students/{studentId}/reference-loads/{variantId} | Confirmar a carga de referência de uma variante do aluno
[**retirePersonalStudentWorkoutAssignment**](PersonalPrescriptionAPI.md#retirepersonalstudentworkoutassignment) | **POST** /personal/students/{studentId}/workout-assignments/{assignmentId}/retirement | Retirar uma atribuição de treino do aluno
[**updatePersonalPrescriptionDraft**](PersonalPrescriptionAPI.md#updatepersonalprescriptiondraft) | **PUT** /personal/prescription-drafts/{draftId} | Editar a estrutura do rascunho com revisão esperada
[**updatePersonalStudentPlanActivation**](PersonalPrescriptionAPI.md#updatepersonalstudentplanactivation) | **PUT** /personal/students/{studentId}/plan-activations/{activationId} | Alterar a programação da ativação vigente do aluno
[**updatePersonalWorkoutTemplate**](PersonalPrescriptionAPI.md#updatepersonalworkouttemplate) | **PUT** /personal/workout-templates/{templateId} | Editar o modelo de treino com revisão esperada


# **activatePersonalStudentPlan**
```swift
    open class func activatePersonalStudentPlan(studentId: String, idempotencyKey: String, activatePlanRequest: ActivatePlanRequest, acceptLanguage: String? = nil, ifMatch: String? = nil, ifNoneMatch: IfNoneMatch_activatePersonalStudentPlan? = nil, completion: @escaping (_ data: PlanActivationChangeView?, _ error: Error?) -> Void)
```

Ativar uma versão publicada do plano do aluno, por dias da semana ou em sequência

Diz como uma versão **publicada** chega ao aluno: por **dias da semana** (`WEEKDAYS`, com `weekdaySlots`) ou por **sequência livre** (`SEQUENCE`, com `sequence`); o personal escolhe **um modo por plano**. Publicar e ativar são dois efeitos distintos — o app os oferece como uma ação só e a tela de resultado informa cada um —, e esta operação **não publica**: versão em rascunho é `409 PRESCRIPTION_VERSION_NOT_PUBLISHED`, e versão publicada já substituída por outra, `409 PRESCRIPTION_VERSION_NOT_CURRENT`. **Uma ativação vigente por vínculo.** Ativar sobre outra a **substitui** na mesma operação: a anterior é encerrada e as atribuições `AVAILABLE` futuras **que ela materializou**, a partir de `startDate`, são retiradas — fato `RETIRED`, nunca remoção. A atribuição que o personal fez à mão permanece, e a atribuição em que o aluno já iniciou a sessão não é retirada: a sessão fica na versão que a originou. `outcome` diz `ACTIVATED` ou `REPLACED`, e `retiredAssignmentCount` quantas atribuições foram retiradas. A regra de uma atribuição por data permanece. **Compare-and-set.** A ativação vigente é estado mutável que outro aparelho pode ter mudado, e substituí-la sem tê-la visto seria last-write-wins sobre o que o aluno recebe: com ativação vigente, `If-Match` ecoa o `ETag` lido — o mesmo valor de `activation.revision`; **sem nenhuma**, o pedido leva `If-None-Match: *`. Exatamente um dos dois: nenhum, ou os dois, é `422 VALIDATION_FAILED`. Revisão velha, ou `If-None-Match: *` com ativação já vigente, é `412 PRECONDITION_FAILED`, **sem gravar**, e o app lê de novo e decide. O `ETag` da resposta é a revisão nova. **Vigência.** A ativação só serve o aluno a partir de `startDate`. Com início futuro, entre hoje e `startDate` o aluno é servido pelas atribuições que já existem — as `AVAILABLE` da anterior até a véspera do início, que só então são retiradas —, e nem `sequencePlan` nem `planMode` aparecem; uma anterior em `SEQUENCE`, que não tem atribuição antecipada, deixa de servir ao ser substituída, e por isso o app só adianta o início quando há atribuições a manter. **Datas.** `startDate` ausente é o \"hoje\" do servidor no fuso do vínculo — o app não calcula \"hoje\", e nenhuma data de device o desloca; anterior a hoje é `422 VALIDATION_FAILED` com `fieldErrors` `START_DATE_IN_PAST`. `endDate`, opcional nos dois modos, é o último dia de validade e nunca anterior ao início (`END_DATE_BEFORE_START`); ausente, a ativação não tem data de término. Vencida, a ativação continua servindo treinos e consta como `EXPIRING` ao personal. A validade **nunca aparece ao aluno**. **Programação.** Em `WEEKDAYS`, `weekdaySlots` lista, por treino da versão, os dias da semana em que ele cai: um dia da semana pertence a **no máximo um** treino (`WEEKDAY_REPEATED`), um treino aparece em **um só** slot (`WORKOUT_REPEATED`) e ao menos um slot é exigido — todos os dias em descanso é recusado. O servidor materializa a atribuição por data civil, em janela rolante, no fuso do vínculo; dia sem treino não gera atribuição e é lido como se lê um dia sem atribuição. Em `SEQUENCE`, `sequence` é a **lista ordenada** dos treinos, sem repetição (`WORKOUT_REPEATED`): não há atribuição antecipada, o próximo treino é o seguinte, em ordem circular, ao último concluído, e a atribuição da data nasce quando o aluno inicia a sessão. `weekdaySlots` em `SEQUENCE` e `sequence` em `WEEKDAYS` são recusados, e treino que a versão não tem é `WORKOUT_NOT_IN_VERSION`. Treino da versão que a programação não alcança fica sem dia ou fora da sequência, e a resposta o lista em `unscheduledWorkoutIds`. **Elegibilidade.** Ativar entrega prescrição ao aluno: aluno que ainda não pode recebê-la é `409 STUDENT_NOT_ELIGIBLE` com `blockingReasons`, a mesma recusa, com o mesmo código e o mesmo vocabulário, de publicar e de atribuir — inclusive a condição opcional da anamnese (`DEC-PHOME-19` §5), avaliada no mesmo ponto transacional. A materialização de dias de um plano já ativado não é liberação nova e nunca a avalia. **Efeito nas leituras.** Depois de ativar, `getPersonalStudentPrescription` passa a trazer `activation` e `validity` e o plano da aba Treinos deixa de ser `NOT_ACTIVATED` e passa a `ACTIVE` — ou `EXPIRING`, na janela de aviso. Vínculo pausado ou encerrado é `403 RELATIONSHIP_INACTIVE`. Aluno ou versão inexistentes, e de outro personal, respondem o mesmo `404 PRESCRIPTION_RESOURCE_NOT_FOUND`. **Repetição.** A mesma `Idempotency-Key` com o mesmo corpo e a mesma precondição devolve o resultado guardado, sem novo efeito; com outro corpo é `409 IDEMPOTENCY_CONFLICT`. **Ordem das recusas**, a mesma em toda chamada: corpo ou precondição malformados — `weekdaySlots` fora de `WEEKDAYS`, `sequence` fora de `SEQUENCE`, a lista do modo ausente, nenhum ou os dois cabeçalhos de precondição — são `422` antes de tudo; depois o aluno (`404` fora do vínculo; `403 RELATIONSHIP_INACTIVE`); depois a versão (`404` quando não é do vínculo, antes de qualquer regra sobre o estado dela); depois a precondição (`412`); depois as regras da programação, todas `422` (`WEEKDAY_REPEATED`, `WORKOUT_REPEATED`, `WORKOUT_NOT_IN_VERSION`, `START_DATE_IN_PAST`, `END_DATE_BEFORE_START`); e por último os `409`, nesta ordem: `PLAN_ACTIVATION_IDENTITY_DIVERGENT`, `PRESCRIPTION_VERSION_NOT_PUBLISHED`, `PRESCRIPTION_VERSION_NOT_CURRENT` e `STUDENT_NOT_ELIGIBLE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let activatePlanRequest = ActivatePlanRequest(activationId: "activationId_example", prescriptionVersionId: "prescriptionVersionId_example", mode: PlanActivationMode(), startDate: Date(), endDate: Date(), weekdaySlots: [PlanWeekdaySlot(workoutId: "workoutId_example", weekdays: [PlanWeekday()])], sequence: ["sequence_example"]) // ActivatePlanRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let ifMatch = "ifMatch_example" // String | `ETag` da ativação vigente lida, o mesmo valor de `activation.revision`. Obrigatório quando já existe ativação vigente, e então exclui `If-None-Match`; revisão velha é `412`, sem gravar. (optional)
let ifNoneMatch = "ifNoneMatch_example" // String | `*`, só na primeira ativação do aluno: afirma que o personal não viu nenhuma ativação vigente. Se uma já existe, é `412`, sem gravar. Exclui `If-Match`. (optional)

// Ativar uma versão publicada do plano do aluno, por dias da semana ou em sequência
PersonalPrescriptionAPI.activatePersonalStudentPlan(studentId: studentId, idempotencyKey: idempotencyKey, activatePlanRequest: activatePlanRequest, acceptLanguage: acceptLanguage, ifMatch: ifMatch, ifNoneMatch: ifNoneMatch) { (response, error) in
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
 **activatePlanRequest** | [**ActivatePlanRequest**](ActivatePlanRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **ifMatch** | **String** | &#x60;ETag&#x60; da ativação vigente lida, o mesmo valor de &#x60;activation.revision&#x60;. Obrigatório quando já existe ativação vigente, e então exclui &#x60;If-None-Match&#x60;; revisão velha é &#x60;412&#x60;, sem gravar. | [optional]
 **ifNoneMatch** | **String** | &#x60;*&#x60;, só na primeira ativação do aluno: afirma que o personal não viu nenhuma ativação vigente. Se uma já existe, é &#x60;412&#x60;, sem gravar. Exclui &#x60;If-Match&#x60;. | [optional]

### Return type

[**PlanActivationChangeView**](PlanActivationChangeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **archivePersonalWorkoutTemplate**
```swift
    open class func archivePersonalWorkoutTemplate(idempotencyKey: String, ifMatch: String, templateId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Arquivar (excluir) o modelo de treino

Arquiva o modelo do personal, com `If-Match` obrigatório: arquivar é compare-and-set como a edição, e quem exclui um modelo que outro aparelho acabou de editar recebe `412 PRECONDITION_FAILED` e nada é arquivado, porque excluir é destruir trabalho e não pode vencer uma edição que o personal ainda não viu. **Arquivar não afeta nenhum plano** — rascunho, versão publicada ou ativação — que nasceu do modelo, e libera uma vaga dos 200. **A identidade arquivada não renasce**: criar de novo exige identidade nova, e reaproveitar a antiga é `409 TEMPLATE_IDENTITY_DIVERGENT`. Depois do arquivamento, ler, editar ou arquivar o modelo, ou usá-lo como origem, responde `404 PRESCRIPTION_RESOURCE_NOT_FOUND`. A resposta é `204`. Repetir com a mesma `Idempotency-Key` e a mesma revisão responde `204` outra vez, sem novo efeito; repetir com outra chave depois de concluído é `404`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let templateId = "templateId_example" // String | Identidade do modelo, criada pelo cliente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Arquivar (excluir) o modelo de treino
PersonalPrescriptionAPI.archivePersonalWorkoutTemplate(idempotencyKey: idempotencyKey, ifMatch: ifMatch, templateId: templateId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **templateId** | **String** | Identidade do modelo, criada pelo cliente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **assignPersonalStudentWorkout**
```swift
    open class func assignPersonalStudentWorkout(studentId: String, idempotencyKey: String, assignWorkoutRequest: AssignWorkoutRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutAssignmentView?, _ error: Error?) -> Void)
```

Atribuir um treino de versão publicada a uma data do aluno

Disponibiliza um treino de uma versão **publicada** para uma data civil do aluno. A atribuição referencia a versão por identidade e **nunca copia** o conteúdo prescrito para o dia; alterar a prescrição gera versão nova e atribuição nova, sem reescrever sessões históricas. Uma versão em rascunho é recusada com `409 PRESCRIPTION_VERSION_NOT_PUBLISHED`. Existe no máximo uma atribuição vigente por par aluno/data: uma segunda é `409 ASSIGNMENT_DATE_CONFLICT`, explícita, sem last-write-wins e sem o relógio do device arbitrar o desempate. A data civil é resolvida no timezone do vínculo, que é autoridade do servidor. Um aluno que ainda não pode receber prescrição nova é `409 STUDENT_NOT_ELIGIBLE`, com `blockingReasons` nomeando o que falta — a mesma recusa, com o mesmo código e o mesmo vocabulário, que `publishPersonalPrescriptionDraft` emite, inclusive `ANAMNESIS_NOT_COMPLETED` só quando o personal exige a conclusão da ficha deste vínculo para novas liberações (`DEC-PHOME-19` §5), avaliada no mesmo ponto transacional da atribuição. A elegibilidade incide sobre entregar prescrição nova ao aluno; **retirar uma atribuição nunca é recusado por ela**, porque retirar remove em vez de entregar, e bloqueá-la prenderia o aluno a um treino que ninguém poderia tirar.

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

Criar rascunho de prescrição, em branco, revisão, cópia de outro aluno ou a partir de um modelo

Cria o rascunho que o personal edita antes de publicar. O rascunho é a própria versão de prescrição no estado `DRAFT`: publicar depois preserva esta identidade em vez de emitir outra. **A identidade nasce no cliente.** `draftId` é gerado no device e adotado pelo servidor, de modo que o retry convirja para uma única identidade; o replay com o mesmo corpo devolve o rascunho original sem duplicar — **salvo** se esse rascunho já foi descartado: a identidade descartada não renasce e reaproveitá-la é `409 DRAFT_IDENTITY_DIVERGENT` (ver `discardPersonalPrescriptionDraft`) — e a mesma identidade com corpo diferente é `409 DRAFT_IDENTITY_DIVERGENT`, nunca sobrescrita silenciosa. **Origem do conteúdo.** Sem `source` o rascunho nasce em branco. Com `source` o servidor copia a estrutura para o rascunho novo, **com identidades novas** em todo treino, exercício, série e alternativa, e **nunca altera a origem**, que permanece imutável e legível. `source.kind` é `REVISION` (versão publicada do **mesmo** aluno: nova versão do mesmo plano, com os `derivedFrom…` gravados pelo servidor), `CLONE` (plano de **outro** aluno do mesmo personal, por `prescriptionVersionId` — a vigente ou uma anterior — ou por `draftId`, o rascunho aberto dele) ou `TEMPLATE` (`templateId` e os `workoutIds` do modelo que entram). `REVISION` e `CLONE` copiam o plano inteiro; só `TEMPLATE` escolhe treinos. `loadPolicy` e `notesPolicy` são **obrigatórios com `CLONE` e `TEMPLATE`** e **proibidos** sem `source` e com `REVISION`, que continua o plano do mesmo aluno: `CLEAR_ABSOLUTE` remove `loadValue` e `loadUnit` de todo alvo e mantém `loadPercent`, e `CLEAR` remove o `notes` de todo exercício, que pode citar condição do aluno de origem; nenhum outro texto autorado muda. A carga de referência **nunca** é copiada, pois é do aluno de origem. O nome do rascunho é o do pedido, e não o da origem. **A origem é autorizada antes de qualquer outra regra.** Versão, rascunho ou modelo inexistente, de outro personal ou arquivado — e, em `REVISION`, de outro vínculo — responde `404 PRESCRIPTION_RESOURCE_NOT_FOUND`, sempre de forma indistinguível; isso inclui a origem de `CLONE` cujo vínculo **não é ativo** (encerrado ou pausado), porque o encerramento revoga a leitura operacional do ex-personal e a observação pode citar condição do aluno. Só então valem as demais recusas, que só alcançam recurso do próprio personal: `CLONE` com origem no vínculo do **próprio** aluno de destino é `422 VALIDATION_FAILED` (`source.kind`, código `SOURCE_IN_SAME_RELATIONSHIP`: para continuar o plano dele a origem é `REVISION`); `prescriptionVersionId` que designa rascunho aberto é `409 PRESCRIPTION_VERSION_NOT_PUBLISHED`; `draftId` já publicado é `409 DRAFT_ALREADY_PUBLISHED`; `workoutIds` que o modelo não tem é `422 VALIDATION_FAILED` (`WORKOUT_NOT_IN_SOURCE`). A escrita é autorizada somente ao personal do vínculo ativo; um aluno fora do vínculo responde de forma indistinguível de inexistente. **Ordem das recusas**, a mesma em toda chamada: corpo malformado — origem incoerente com o `kind`, política ausente ou proibida — é `422` antes de tudo; depois o aluno de destino (`404` fora do vínculo; `403 RELATIONSHIP_INACTIVE`); depois a **autorização da origem** (`404`), que vem antes de qualquer regra sobre o estado dela; depois as recusas da origem (`422` `SOURCE_IN_SAME_RELATIONSHIP` e `WORKOUT_NOT_IN_SOURCE`, e então `409` `PRESCRIPTION_VERSION_NOT_PUBLISHED` e `DRAFT_ALREADY_PUBLISHED`); e por último `409 DRAFT_ALREADY_OPEN`. **Um vínculo tem uma prescrição e no máximo um rascunho aberto.** Criar um rascunho em vínculo que já tem prescrição cria a **versão seguinte** do mesmo plano, e não um plano novo; criar um segundo rascunho enquanto há um aberto é `409 DRAFT_ALREADY_OPEN`, que carrega em `existingDraftId` a identidade do rascunho que já existe, para o app oferecer continuar nele ou descartá-lo (`discardPersonalPrescriptionDraft`) e começar de novo. O replay do **mesmo** `draftId` com o mesmo corpo, enquanto o rascunho está aberto, não é segundo rascunho: devolve o original, sem `DRAFT_ALREADY_OPEN`. O servidor registra a origem em `originKind` — `BLANK` sem `source`, e `REVISION`, `CLONE` ou `TEMPLATE` conforme `source.kind` —, e só `REVISION` publica `sourcePrescriptionVersionId` nas respostas: `CLONE` e `TEMPLATE` são cópias independentes e a referência da origem não é publicada. Vínculo pausado: a criação é recusada com `403 RELATIONSHIP_INACTIVE`; ler o plano continua respondendo. **Clonar para vários alunos não tem operação de lote.** O app chama esta operação **uma vez por aluno de destino**, cada chamada com `draftId`, `studentId` e `Idempotency-Key` próprios, e apresenta o resultado por aluno. O resultado de uma chamada nunca depende do de outra, e a falha de um destino não desfaz nem impede o de outro: `201` é rascunho criado; `409 DRAFT_ALREADY_OPEN` traz `existingDraftId`, e o app oferece abrir esse rascunho, substituí-lo — descartá-lo com `discardPersonalPrescriptionDraft` e criar de novo com identidade nova — ou pular o aluno; `403 RELATIONSHIP_INACTIVE` é vínculo pausado ou encerrado; falha de transporte ou `503` repete com a mesma `Idempotency-Key` e o mesmo corpo. Criar rascunho **não** exige que o aluno seja elegível e nada é publicado por criar: a elegibilidade (`STUDENT_NOT_ELIGIBLE`) e a validação do conteúdo valem na publicação, por aluno.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createPrescriptionDraftRequest = CreatePrescriptionDraftRequest(draftId: "draftId_example", studentId: "studentId_example", name: "name_example", source: PrescriptionDraftSource(kind: PrescriptionDraftSourceKind(), prescriptionVersionId: "prescriptionVersionId_example", draftId: "draftId_example", templateId: "templateId_example", workoutIds: ["workoutIds_example"]), loadPolicy: PrescriptionLoadPolicy(), notesPolicy: PrescriptionNotesPolicy()) // CreatePrescriptionDraftRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Criar rascunho de prescrição, em branco, revisão, cópia de outro aluno ou a partir de um modelo
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

# **createPersonalWorkoutTemplate**
```swift
    open class func createPersonalWorkoutTemplate(idempotencyKey: String, createWorkoutTemplateRequest: CreateWorkoutTemplateRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutTemplateView?, _ error: Error?) -> Void)
```

Criar modelo de treino, vazio, a partir de um plano ou duplicando outro modelo

Cria um modelo do personal. **A identidade nasce no cliente**: `templateId` é gerado no device e adotado pelo servidor; o replay com o mesmo corpo devolve o modelo original sem duplicar — **mesmo no limite de 200** —, e a mesma identidade com corpo diferente, ou uma identidade que já foi arquivada, é `409 TEMPLATE_IDENTITY_DIVERGENT`: a identidade arquivada não renasce. Sem `source` o modelo nasce **sem treinos**, com o nome e os metadados do pedido, e o conteúdo entra por `updatePersonalWorkoutTemplate`. Com `source` — um `prescriptionVersionId` ou o `draftId` de um plano de aluno de vínculo **ativo** do mesmo personal (\"salvar como modelo\"), ou o `templateId` de outro modelo dele (\"duplicar\") — o servidor copia os `workoutIds` escolhidos, **com identidades novas**, e **nunca altera a origem**. O modelo copiado não tem `derivedFrom…`. `loadPolicy` (`KEEP` ou `CLEAR_ABSOLUTE`) e `notesPolicy` (`KEEP` ou `CLEAR`) são **obrigatórios com `source` e proibidos sem ele**: a escolha é do personal e o servidor não a presume. `CLEAR_ABSOLUTE` remove `loadValue` e `loadUnit` de todo alvo copiado e mantém `loadPercent`; `CLEAR` remove o `notes` de todo exercício copiado, que pode citar condição do aluno de origem; nenhum outro texto autorado muda. A carga de referência do aluno **nunca** vai para o modelo. Origem inexistente, de outro personal, de vínculo que não é ativo ou arquivada responde `404 PRESCRIPTION_RESOURCE_NOT_FOUND`, de forma indistinguível. Versão que designa rascunho aberto do próprio personal é `409 PRESCRIPTION_VERSION_NOT_PUBLISHED`; `draftId` de rascunho já publicado é `409 DRAFT_ALREADY_PUBLISHED`. Um `workoutIds` que a origem não tem é `422 VALIDATION_FAILED` com `fieldErrors` de código `WORKOUT_NOT_IN_SOURCE`. **Limite de 200 modelos ativos por personal.** Passar dele é `409 TEMPLATE_LIMIT_REACHED`, sem gravar; **arquivar** um modelo libera a vaga. O modelo não tem estado de publicação nem versão: é documento editável com `revision`. É **online-only e não tem command de sync**.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createWorkoutTemplateRequest = CreateWorkoutTemplateRequest(templateId: "templateId_example", name: "name_example", description: "description_example", tags: ["tags_example"], goal: WorkoutTemplateGoal(), level: WorkoutTemplateLevel(), source: WorkoutTemplateSource(prescriptionVersionId: "prescriptionVersionId_example", draftId: "draftId_example", templateId: "templateId_example", workoutIds: ["workoutIds_example"]), loadPolicy: PrescriptionLoadPolicy(), notesPolicy: PrescriptionNotesPolicy()) // CreateWorkoutTemplateRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Criar modelo de treino, vazio, a partir de um plano ou duplicando outro modelo
PersonalPrescriptionAPI.createPersonalWorkoutTemplate(idempotencyKey: idempotencyKey, createWorkoutTemplateRequest: createWorkoutTemplateRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **createWorkoutTemplateRequest** | [**CreateWorkoutTemplateRequest**](CreateWorkoutTemplateRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutTemplateView**](WorkoutTemplateView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePersonalStudentReferenceLoad**
```swift
    open class func deletePersonalStudentReferenceLoad(idempotencyKey: String, ifMatch: String, studentId: String, variantId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remover a carga de referência confirmada de uma variante do aluno

Remove o valor confirmado daquela variante, com **compare-and-set**: `If-Match` é obrigatório e ecoa o `ETag` lido, o mesmo valor de `confirmed.revision`. Apagar o que outro aparelho confirmou depois da leitura é apagar um valor que o personal não viu: revisão velha é `412 PRECONDITION_FAILED` e nada é removido. Sem confirmação a remover não há revisão que bata, e a resposta também é `412`; o replay da mesma `Idempotency-Key` devolve `204` outra vez, sem efeito. Não apaga histórico de execução, não altera prescrição nenhuma e não confirma a estimativa no lugar. A estimativa continua sendo lida, se houver. **Efeito sobre alvos:** a sessão iniciada mantém o alvo que já calculou; as seguintes, sem referência confirmada, têm o alvo de carga **ausente** e seguem a regra vigente de valor inicial, nunca zero. Vínculo pausado ou encerrado: `403 RELATIONSHIP_INACTIVE`. Aluno ou variante inexistentes e aluno de outro personal respondem o mesmo `404 PRESCRIPTION_RESOURCE_NOT_FOUND`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let variantId = "variantId_example" // String | Variante cuja carga de referência se confirma ou remove; a referência é por variante.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Remover a carga de referência confirmada de uma variante do aluno
PersonalPrescriptionAPI.deletePersonalStudentReferenceLoad(idempotencyKey: idempotencyKey, ifMatch: ifMatch, studentId: studentId, variantId: variantId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente. |
 **variantId** | **String** | Variante cuja carga de referência se confirma ou remove; a referência é por variante. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **discardPersonalPrescriptionDraft**
```swift
    open class func discardPersonalPrescriptionDraft(idempotencyKey: String, ifMatch: String, draftId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Descartar o rascunho aberto do aluno

Descarta o rascunho aberto do personal autor, com `If-Match` obrigatório: o descarte é compare-and-set como a edição, e quem descarta um rascunho que outro aparelho acabou de editar recebe `412 PRECONDITION_FAILED` e nada é removido, porque descartar é destruir trabalho e não pode vencer uma edição que o personal ainda não viu. **Um vínculo tem uma prescrição e no máximo um rascunho aberto.** Descartar libera essa vaga: depois do `204` o aluno volta a poder receber um rascunho novo em `createPersonalPrescriptionDraft`, e a versão publicada vigente permanece exatamente como estava. O descarte alcança **somente** o estado `DRAFT`: uma versão publicada é imutável e nunca é descartada — um `draftId` que já foi publicado responde `409 DRAFT_ALREADY_PUBLISHED`, sem remover nada. **A identidade descartada não renasce.** Um `draftId` descartado nunca volta a designar rascunho; criar de novo exige uma identidade nova, e reaproveitar a antiga é `409 DRAFT_IDENTITY_DIVERGENT`. Quem edita ou publica o rascunho depois do descarte recebe `404 PRESCRIPTION_RESOURCE_NOT_FOUND`, e é essa a resposta que a tela trata como \"este rascunho não está mais aberto\". A resposta é `204`: o rascunho deixa de existir e projetá-lo de volta contradiria o descarte. Repetir o descarte com a mesma `Idempotency-Key` e a mesma revisão responde `204` outra vez, sem novo efeito; repeti-lo com outra chave depois de concluído é `404`, porque já não há rascunho. Um rascunho de outro personal e um rascunho inexistente respondem de forma idêntica, sem revelar existência de conta, vínculo ou prescrição. Vínculo pausado ou encerrado: `403 RELATIONSHIP_INACTIVE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let draftId = "draftId_example" // String | Identidade do rascunho, criada pelo cliente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Descartar o rascunho aberto do aluno
PersonalPrescriptionAPI.discardPersonalPrescriptionDraft(idempotencyKey: idempotencyKey, ifMatch: ifMatch, draftId: draftId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **endPersonalStudentPlanActivation**
```swift
    open class func endPersonalStudentPlanActivation(studentId: String, activationId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PlanActivationChangeView?, _ error: Error?) -> Void)
```

Encerrar a ativação vigente do plano do aluno

**Encerrar plano** (PR1). A versão publicada continua sendo o plano do aluno, agora **sem ativação vigente**: `getPersonalStudentPrescription` volta a vir sem `activation` e sem `validity`, e a aba Treinos o mostra como `NOT_ACTIVATED`. As atribuições `AVAILABLE` que a ativação materializou, de hoje em diante — no fuso do vínculo —, são retiradas (fato `RETIRED`, nunca remoção), e `retiredAssignmentCount` diz quantas; a atribuição que o personal fez à mão permanece, e a atribuição em que o aluno já iniciou a sessão não é retirada: a sessão continua e termina na versão que a originou. Em `SEQUENCE` o aluno deixa de ter próximo treino. **Encerrar nunca é recusado por elegibilidade**: ele remove em vez de entregar, e bloqueá-lo prenderia o aluno a um plano que ninguém poderia tirar. **Compare-and-set**: `If-Match` é obrigatório e ecoa o `ETag` lido, o mesmo valor de `activation.revision`; revisão velha é `412 PRECONDITION_FAILED` e nada é encerrado. Ativação já encerrada, substituída ou encerrada pelo vínculo é `409 PLAN_ACTIVATION_NOT_ACTIVE`; repetir a mesma `Idempotency-Key` devolve o mesmo resultado, sem novo efeito. A resposta (`outcome: ENDED`) não tem `ETag`: não resta ativação. Vínculo pausado ou encerrado é `403 RELATIONSHIP_INACTIVE` — e ele próprio já encerrou a ativação; aluno ou ativação inexistentes e de outro personal respondem o mesmo `404 PRESCRIPTION_RESOURCE_NOT_FOUND`. **Ordem das recusas**, a mesma em toda chamada: o aluno (`404` fora do vínculo; `403 RELATIONSHIP_INACTIVE`); depois a ativação (`404` quando não é do aluno; `409 PLAN_ACTIVATION_NOT_ACTIVE` quando já não está vigente); e por último a revisão (`412`).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let activationId = "activationId_example" // String | Ativação vigente a encerrar, a mesma de `activation.activationId`.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Encerrar a ativação vigente do plano do aluno
PersonalPrescriptionAPI.endPersonalStudentPlanActivation(studentId: studentId, activationId: activationId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **activationId** | **String** | Ativação vigente a encerrar, a mesma de &#x60;activation.activationId&#x60;. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PlanActivationChangeView**](PlanActivationChangeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
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

# **getPersonalPrescriptionVersion**
```swift
    open class func getPersonalPrescriptionVersion(versionId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PrescriptionVersionView?, _ error: Error?) -> Void)
```

Ler o conteúdo de uma versão publicada do plano

Leitura sem efeito colateral do conteúdo **inteiro** de uma versão publicada, vigente ou substituída, para o personal do vínculo ativo. É o que a tela de versão anterior abre em modo somente leitura, e a origem de \"Usar como base\". Versão publicada é imutável: o conteúdo lido hoje é o conteúdo lido amanhã, e por isso a resposta não carrega `revision` nem pede `If-Match` — nada a edita. **A autorização é avaliada antes do estado.** Um `versionId` que designa um **rascunho do próprio personal** não é versão: responde `409 PRESCRIPTION_VERSION_NOT_PUBLISHED`, e o rascunho é lido em `getPersonalPrescriptionDraft`. Um `versionId` — de versão ou de rascunho — de outro personal e um inexistente respondem de forma idêntica, `404 PRESCRIPTION_RESOURCE_NOT_FOUND`, sem revelar existência de conta, vínculo ou prescrição: o `409` nunca chega a quem não é o dono. Vínculo pausado: a leitura responde; encerrado: `403 RELATIONSHIP_INACTIVE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let versionId = "versionId_example" // String | Identidade da versão publicada, igual à do rascunho que a originou.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o conteúdo de uma versão publicada do plano
PersonalPrescriptionAPI.getPersonalPrescriptionVersion(versionId: versionId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **versionId** | **String** | Identidade da versão publicada, igual à do rascunho que a originou. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PrescriptionVersionView**](PrescriptionVersionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentPlanActivation**
```swift
    open class func getPersonalStudentPlanActivation(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentPlanActivationView?, _ error: Error?) -> Void)
```

Ler a programação vigente do plano de um aluno

Leitura da tela Programação (PR11): a ativação vigente do plano do aluno — como a versão publicada chega a ele, por **dias da semana** (`WEEKDAYS`) ou por **sequência livre** (`SEQUENCE`) — e o `asOf` do servidor, com o dia civil dele no fuso do vínculo (`asOfDate`), de modo que o app nunca depende do relógio do aparelho. **Um vínculo tem no máximo uma ativação vigente.** `activation` **ausente** diz que não há ativação vigente — o plano nunca foi ativado, a ativação foi encerrada, ou o vínculo está pausado — e nunca que a leitura falhou; sem ela não há validade a dizer. `relationshipState` é `ACTIVE` ou `PAUSED` e é explícito: **vínculo pausado ou encerrado encerra a ativação**, e retira — como `endPersonalStudentPlanActivation`, a partir do dia do vínculo — as atribuições `AVAILABLE` futuras que ela materializou e em que nenhuma sessão começou (a atribuição à mão permanece), de modo que nada sobra para colidir com a regra de uma atribuição por data; reativar o vínculo não restaura a ativação nem as atribuições — o personal ativa de novo. Uma ativação com `startDate` depois de `asOfDate` é lida normalmente e ainda não serve o aluno. Com `PAUSED` a ativação é sempre ausente; as leituras de um vínculo pausado respondem, as mutações são `403 RELATIONSHIP_INACTIVE`, e vínculo encerrado é `403 RELATIONSHIP_INACTIVE` também aqui. Com ativação, `activation.validity` e `activation.daysUntilEnd` seguem a mesma regra de `getPersonalStudentPrescription`, medida a partir de `asOfDate`: `EXPIRED` se `daysUntilEnd` é negativo, `EXPIRING` de 0 a 6, `VALID` de 7 em diante, `OPEN_ENDED` sem data de término. **Vencer não apaga nem bloqueia a ativação**: ela continua servindo treinos ao aluno. O `ETag` da resposta é `activation.revision`, o valor que `If-Match` ecoa ao alterar, encerrar ou ativar outra; **sem ativação não há `ETag`**, e a primeira ativação leva `If-None-Match: *`. Um aluno de outro personal e um aluno inexistente respondem de forma idêntica, `404 PRESCRIPTION_RESOURCE_NOT_FOUND`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a programação vigente do plano de um aluno
PersonalPrescriptionAPI.getPersonalStudentPlanActivation(studentId: studentId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentPlanActivationView**](PersonalStudentPlanActivationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentPrescription**
```swift
    open class func getPersonalStudentPrescription(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentPrescriptionView?, _ error: Error?) -> Void)
```

Ler o contexto do plano de treino de um aluno

Leitura da tela Plano de treino do aluno. **Um vínculo tem uma prescrição e no máximo um rascunho aberto**, e esta resposta é a fotografia desse par: a versão publicada vigente resumida, a ativação, o rascunho aberto, a elegibilidade do aluno e o `asOf` do servidor, com o dia civil dele no fuso do vínculo (`asOfDate`), de modo que o app nunca depende do relógio do aparelho. Vínculo pausado: a leitura responde (as mutações é que são recusadas); encerrado: `403 RELATIONSHIP_INACTIVE`. O aluno é identificado com o mesmo par da carteira (`listPersonalStudents`): `studentName`, o nome que o **próprio aluno** informou no Perfil, que o servidor junta à leitura e que **nunca é nulo** — a leitura só responde para vínculo ativo ou pausado, e o nome é obrigatório no onboarding do aluno (`DEC-PHOME-6`) —, e `studentLabel`, o rótulo autorado no convite, quando houver. **A tela mostra `studentName`, com `studentLabel` como linha secundária quando os dois existem e diferem**; o app nunca junta a carteira a esta leitura para achar o nome (`DEC-PHOME-3`). `currentVersion` é a versão publicada que o aluno recebe hoje e `currentWorkouts` lista os treinos dela com a contagem de exercícios; os dois ausentes dizem que o aluno **ainda não tem plano publicado**, e nunca que a leitura falhou. `openDraft` é o rascunho aberto, quando há, com `nextVersionNumber`, o número que a versão terá **se for publicada agora**: é uma previsão do servidor, a numeração definitiva continua sendo emitida na publicação. Sem plano o número previsto é `1`; com plano vigente é o número dela mais um. `openDraft.revision` é a revisão que `discardPersonalPrescriptionDraft` e `updatePersonalPrescriptionDraft` ecoam em `If-Match`. `activation` é o resumo da programação vigente; **ausente quando o plano publicado não tem ativação vigente** — ainda não foi ativado ou a ativação foi encerrada. `validity` existe **somente junto de `activation`**: sem ativação não há validade a dizer, e o plano é um plano publicado e não ativado, nunca \"em andamento\" nem `OPEN_ENDED`. Com ativação, `validity` é dada por `activation.daysUntilEnd`, os dias civis entre `asOfDate` e `activation.endDate` no fuso do vínculo: `EXPIRED` se negativo, `EXPIRING` de 0 a 6 (a data de término cai nos sete dias civis que começam hoje), `VALID` de 7 em diante, e `OPEN_ENDED` quando a ativação não tem data de término. **Vencer não apaga nem bloqueia o plano**: um plano `EXPIRED` continua sendo o vigente e continua servindo treinos ao aluno. `eligibility` é a mesma decisão que `GET /personal/students/{studentId}/anamnesis` publica sobre o mesmo aluno, reusada e não recriada. Ela incide sobre publicar e ativar, nunca sobre ler nem sobre rascunhar. Um aluno de outro personal e um aluno inexistente respondem de forma idêntica, `404 PRESCRIPTION_RESOURCE_NOT_FOUND`, sem revelar existência de conta, vínculo ou prescrição.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o contexto do plano de treino de um aluno
PersonalPrescriptionAPI.getPersonalStudentPrescription(studentId: studentId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentPrescriptionView**](PersonalStudentPrescriptionView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentReferenceLoads**
```swift
    open class func getPersonalStudentReferenceLoads(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentReferenceLoadsView?, _ error: Error?) -> Void)
```

Ler as cargas de referência de um aluno

Leitura da tela Cargas de referência. A carga de referência é a **base do percentual** (`PrescribedTarget.loadPercent`): é **sempre um valor que o personal confirmou**, por aluno e **por variante** — nunca por exercício, e nunca transportada de uma variante para outra —, e nunca é copiada entre alunos nem para modelo. Cada item traz, para uma variante, o valor confirmado (`confirmed`, com o dia da confirmação e, quando veio de uma estimativa aceita, a base) e/ou a **estimativa sugerida** (`estimate`). A estimativa é **projeção calculada na leitura**, nunca persistida como referência: fórmula de Epley, `carga × (1 + repetições / 30)`, sobre a série executada de maior resultado dessa fórmula nas últimas 12 semanas, com 1 a 12 repetições, na mesma variante, arredondada ao **múltiplo mais próximo** do alvo (1 kg; 2,5 lb) — no empate exato, no meio entre dois múltiplos, **para cima** — e acompanhada da série que a originou (`basis`). Não é recomendação de carga nem rótulo de desempenho. **Uma estimativa nova não altera o alvo de ninguém**: o alvo só muda quando o personal confirma outra referência, porque sem isso o percentual seria progressão automática de carga. **Variante sem valor confirmado e sem histórico elegível não aparece na lista**: a ausência diz \"sem referência confirmada\" e, quando é o caso, \"sem série registrada nesta variante\", e nunca é zero nem item vazio. A lista devolve **todas** as variantes do aluno com valor confirmado ou série elegível, **sem corte e sem paginação**: ela é limitada pelo que o aluno executou nas últimas 12 semanas mais o que o personal confirmou, e uma resposta nunca é truncada em silêncio. Vínculo pausado: a leitura responde; encerrado: `403 RELATIONSHIP_INACTIVE`. Aluno de outro personal e aluno inexistente respondem de forma idêntica, `404 PRESCRIPTION_RESOURCE_NOT_FOUND`. A leitura do aluno sobre a própria carga e o cálculo do alvo na sessão não são desta operação.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler as cargas de referência de um aluno
PersonalPrescriptionAPI.getPersonalStudentReferenceLoads(studentId: studentId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentReferenceLoadsView**](StudentReferenceLoadsView.md)

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

# **getPersonalWorkoutTemplate**
```swift
    open class func getPersonalWorkoutTemplate(templateId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutTemplateView?, _ error: Error?) -> Void)
```

Ler o modelo de treino inteiro

Leitura sem efeito colateral do modelo do próprio personal: metadados e conteúdo inteiro na forma de `PrescriptionDraftContent`, com a `revision` opaca que a edição e o arquivamento precisam ecoar em `If-Match` (também em `ETag`). Um modelo de outro personal, um arquivado e um inexistente respondem de forma idêntica, `404 PRESCRIPTION_RESOURCE_NOT_FOUND`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let templateId = "templateId_example" // String | Identidade do modelo, criada pelo cliente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o modelo de treino inteiro
PersonalPrescriptionAPI.getPersonalWorkoutTemplate(templateId: templateId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **templateId** | **String** | Identidade do modelo, criada pelo cliente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutTemplateView**](WorkoutTemplateView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **importPersonalPrescriptionDraftContent**
```swift
    open class func importPersonalPrescriptionDraftContent(draftId: String, idempotencyKey: String, ifMatch: String, importPrescriptionDraftContentRequest: ImportPrescriptionDraftContentRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PrescriptionDraftImportView?, _ error: Error?) -> Void)
```

Acrescentar ao rascunho treinos de um modelo ou de uma versão publicada

Soma ao rascunho aberto os treinos escolhidos de **um modelo** (`templateId`) ou de **uma versão publicada** (`prescriptionVersionId`) — a de qualquer aluno de vínculo **ativo** do mesmo personal, inclusive o do próprio aluno do rascunho. Os treinos são copiados para o **fim** do rascunho, na ordem de `position` da origem e não na ordem de `workoutIds`, com `position` continuando a numeração do rascunho, e **com identidades novas** em todo treino, exercício, série e alternativa. Nada do que o rascunho já tinha muda e a origem **nunca é alterada**. O treino copiado não tem `derivedFrom…`, nem em rascunho `REVISION`: a revisão o mostra como novo. `dependsOnPrescribedExerciseId` aponta para o exercício correspondente da cópia e é omitido quando o exercício de que dependia não entra nela. A carga de referência do aluno **nunca** é copiada. `loadPolicy` (`KEEP` ou `CLEAR_ABSOLUTE`) e `notesPolicy` (`KEEP` ou `CLEAR`) são **obrigatórios**: a escolha é do personal e o servidor não a presume. `CLEAR_ABSOLUTE` remove `loadValue` e `loadUnit` de todo alvo copiado e mantém `loadPercent`; `CLEAR` remove o `notes` de todo exercício copiado; nenhum outro texto autorado muda. **Compare-and-set.** `If-Match` com a `revision` lida do rascunho é obrigatório, como na edição: quem importa sobre um rascunho que outro aparelho acabou de editar recebe `412 PRECONDITION_FAILED` e nada é gravado. A resposta traz o rascunho inteiro com a `revision` nova em `ETag`. Repetir com a mesma `Idempotency-Key`, o mesmo corpo e a mesma revisão devolve o resultado guardado, sem importar de novo; repetir depois de aplicada, com **outra** chave e a revisão antiga, é `412`, e nunca uma segunda importação silenciosa. O rascunho que passaria de 20 treinos é `422 VALIDATION_FAILED` com `fieldErrors` de código `WORKOUT_LIMIT_EXCEEDED` em `source.workoutIds`, sem gravar nada; um `workoutIds` que a origem não tem é `WORKOUT_NOT_IN_SOURCE`. Origem inexistente, de outro personal, de vínculo que não é ativo ou arquivada responde `404 PRESCRIPTION_RESOURCE_NOT_FOUND`, de forma indistinguível, avaliada antes do estado. Versão que designa rascunho aberto do próprio personal é `409 PRESCRIPTION_VERSION_NOT_PUBLISHED`. Rascunho já publicado é `409 DRAFT_NOT_EDITABLE`; descartado, ou de outro personal, é `404`. Vínculo pausado ou encerrado: `403 RELATIONSHIP_INACTIVE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let draftId = "draftId_example" // String | Identidade do rascunho aberto que recebe os treinos, criada pelo cliente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let importPrescriptionDraftContentRequest = ImportPrescriptionDraftContentRequest(source: PrescriptionImportSource(templateId: "templateId_example", prescriptionVersionId: "prescriptionVersionId_example", workoutIds: ["workoutIds_example"]), loadPolicy: PrescriptionLoadPolicy(), notesPolicy: PrescriptionNotesPolicy()) // ImportPrescriptionDraftContentRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Acrescentar ao rascunho treinos de um modelo ou de uma versão publicada
PersonalPrescriptionAPI.importPersonalPrescriptionDraftContent(draftId: draftId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, importPrescriptionDraftContentRequest: importPrescriptionDraftContentRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **draftId** | **String** | Identidade do rascunho aberto que recebe os treinos, criada pelo cliente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **importPrescriptionDraftContentRequest** | [**ImportPrescriptionDraftContentRequest**](ImportPrescriptionDraftContentRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PrescriptionDraftImportView**](PrescriptionDraftImportView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalPrescriptions**
```swift
    open class func listPersonalPrescriptions(acceptLanguage: String? = nil, query: String? = nil, state: PrescriptionListState? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalPrescriptionPage?, _ error: Error?) -> Void)
```

Listar os planos de treino dos alunos do personal (aba Treinos)

Leitura da seção **Planos** da aba Treinos: **um item por aluno** do vínculo ativo que tem plano publicado, rascunho aberto ou os dois. Aluno sem nenhum dos dois não aparece aqui — ele é lido em `listPersonalStudents`. Como um vínculo tem uma prescrição e no máximo um rascunho aberto, a lista nunca repete um aluno. `query` filtra pelo `studentLabel`, o nome autorado no convite que originou o vínculo, ignorando caixa e acento. Cada item identifica o aluno com o mesmo par da carteira (`listPersonalStudents`): `studentName` é o nome que o **próprio aluno** informou no Perfil, que o servidor junta ao item e que **nunca é nulo** — a lista só traz vínculos ativos, e o nome é obrigatório no onboarding do aluno, antes do vínculo (`DEC-PHOME-6`) —; `studentLabel` é **somente** o rótulo autorado no convite, nunca lido do perfil do aluno. **A tela mostra `studentName`, com `studentLabel` como linha secundária quando os dois existem e diferem**; o app nunca junta a carteira a esta leitura para achar o nome (`DEC-PHOME-3`). A lista nunca publica e-mail, contato ou dado de saúde. `state` é opcional e filtra por um dos quatro estados de plano (`PrescriptionListState`): `ACTIVE` é plano publicado com ativação vigente que ainda não está para vencer, `DRAFT` é aluno com rascunho aberto, `EXPIRING` é plano com ativação cuja validade termina na janela de aviso **ou já terminou**, e `NOT_ACTIVATED` é plano publicado **sem ativação vigente** — recém-publicado e ainda não ativado, ou com a ativação encerrada. Um aluno com plano e rascunho aberto casa com o estado do plano e com `DRAFT`, e cada item declara em `states` todos os estados em que casa. A paginação é exclusivamente por cursor opaco (`cursor`, `limit`), a ordem e o limite efetivo são do servidor, o padrão é 20 itens e o máximo é 100. O agrupamento da tela (rascunhos em aberto, a renovar, em andamento) é do app, a partir de `states`. Só o personal autenticado lê a própria carteira: plano de aluno de outro personal nunca aparece nem é contado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let query = "query_example" // String | Texto livre procurado no rótulo do aluno, ignorando caixa e acento. Ausente ou vazio não filtra; o máximo é de 120 caracteres. (optional)
let state = PrescriptionListState() // PrescriptionListState | Estado de plano pedido. Ausente devolve todos os alunos com plano ou rascunho. `EXPIRING` inclui os planos já vencidos. (optional)
let cursor = "cursor_example" // String | Cursor opaco retornado por uma coleção paginada. (optional)
let limit = 987 // Int | Quantidade solicitada pelo cliente; o limite efetivo é definido pela operação. (optional)

// Listar os planos de treino dos alunos do personal (aba Treinos)
PersonalPrescriptionAPI.listPersonalPrescriptions(acceptLanguage: acceptLanguage, query: query, state: state, cursor: cursor, limit: limit) { (response, error) in
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
 **query** | **String** | Texto livre procurado no rótulo do aluno, ignorando caixa e acento. Ausente ou vazio não filtra; o máximo é de 120 caracteres. | [optional]
 **state** | [**PrescriptionListState**](.md) | Estado de plano pedido. Ausente devolve todos os alunos com plano ou rascunho. &#x60;EXPIRING&#x60; inclui os planos já vencidos. | [optional]
 **cursor** | **String** | Cursor opaco retornado por uma coleção paginada. | [optional]
 **limit** | **Int** | Quantidade solicitada pelo cliente; o limite efetivo é definido pela operação. | [optional]

### Return type

[**PersonalPrescriptionPage**](PersonalPrescriptionPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentPrescriptionVersions**
```swift
    open class func listPersonalStudentPrescriptionVersions(studentId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PrescriptionVersionPage?, _ error: Error?) -> Void)
```

Listar o histórico de versões publicadas do plano de um aluno

Histórico do plano do aluno, **da versão mais nova para a mais antiga**, só com versões publicadas: a vigente (`PUBLISHED`) e as anteriores (`SUPERSEDED`). O rascunho aberto **não** é versão e nunca aparece aqui; ele é lido em `getPersonalStudentPrescription`. Cada item é um resumo; o conteúdo de uma versão é lido em `getPersonalPrescriptionVersion`. Versão publicada é imutável: o histórico só cresce, e uma versão substituída permanece íntegra e legível. Como um vínculo tem uma prescrição, a numeração é contínua e sem repetição dentro desta lista. A paginação é exclusivamente por cursor opaco; o padrão é 20 itens e o máximo é 50. Aluno sem plano publicado responde página vazia. Aluno de outro personal e aluno inexistente respondem `404` idêntico.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco retornado por uma coleção paginada. (optional)
let limit = 987 // Int | Quantidade solicitada pelo cliente; o limite efetivo é definido pela operação. (optional)

// Listar o histórico de versões publicadas do plano de um aluno
PersonalPrescriptionAPI.listPersonalStudentPrescriptionVersions(studentId: studentId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco retornado por uma coleção paginada. | [optional]
 **limit** | **Int** | Quantidade solicitada pelo cliente; o limite efetivo é definido pela operação. | [optional]

### Return type

[**PrescriptionVersionPage**](PrescriptionVersionPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalWorkoutTemplates**
```swift
    open class func listPersonalWorkoutTemplates(acceptLanguage: String? = nil, query: String? = nil, tag: String? = nil, goal: WorkoutTemplateGoal? = nil, level: WorkoutTemplateLevel? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: WorkoutTemplatePage?, _ error: Error?) -> Void)
```

Listar os modelos de treino do personal (seção Modelos da aba Treinos)

Lista os **modelos ativos do próprio personal**, a biblioteca de planos que ele reaproveita. Um modelo é um plano sem aluno: nome, descrição, etiquetas, objetivo, nível e treinos. A lista traz o resumo — o suficiente para o cartão (\"3 treinos · 18 exercícios\") — e o conteúdo inteiro é `getPersonalWorkoutTemplate`. Modelo arquivado nunca aparece; modelo de outro personal nunca aparece nem é contado, e não existe compartilhamento de modelo entre personals. `query` procura no nome do modelo e `tag` é uma etiqueta exata, ambos ignorando caixa e acento; `goal` e `level` filtram pelo objetivo e pelo nível, e os filtros informados valem juntos. Um filtro sem resultado é página vazia, nunca erro. A paginação é exclusivamente por cursor opaco (`cursor`, `limit`); a ordem e o limite efetivo são do servidor, o padrão é 20 itens e o máximo é 100. O servidor não publica lista de etiquetas já usadas: o app sugere as que leu. Modelo é **online-only e não tem command de sync**: não existe `commandType` nem entidade de delta de modelo, e ele nunca aparece em `/sync/changes` nem em `/sync/snapshot`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let query = "query_example" // String | Texto procurado no nome do modelo, ignorando caixa e acento. Ausente ou vazio não filtra; o máximo é de 120 caracteres. (optional)
let tag = "tag_example" // String | Etiqueta exata, ignorando caixa e acento; uma só por pedido. (optional)
let goal = WorkoutTemplateGoal() // WorkoutTemplateGoal | Objetivo declarado do modelo. (optional)
let level = WorkoutTemplateLevel() // WorkoutTemplateLevel | Nível declarado do modelo. (optional)
let cursor = "cursor_example" // String | Cursor opaco retornado por uma coleção paginada. (optional)
let limit = 987 // Int | Quantidade solicitada pelo cliente; o limite efetivo é definido pela operação. (optional)

// Listar os modelos de treino do personal (seção Modelos da aba Treinos)
PersonalPrescriptionAPI.listPersonalWorkoutTemplates(acceptLanguage: acceptLanguage, query: query, tag: tag, goal: goal, level: level, cursor: cursor, limit: limit) { (response, error) in
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
 **query** | **String** | Texto procurado no nome do modelo, ignorando caixa e acento. Ausente ou vazio não filtra; o máximo é de 120 caracteres. | [optional]
 **tag** | **String** | Etiqueta exata, ignorando caixa e acento; uma só por pedido. | [optional]
 **goal** | [**WorkoutTemplateGoal**](.md) | Objetivo declarado do modelo. | [optional]
 **level** | [**WorkoutTemplateLevel**](.md) | Nível declarado do modelo. | [optional]
 **cursor** | **String** | Cursor opaco retornado por uma coleção paginada. | [optional]
 **limit** | **Int** | Quantidade solicitada pelo cliente; o limite efetivo é definido pela operação. | [optional]

### Return type

[**WorkoutTemplatePage**](WorkoutTemplatePage.md)

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

Transição `DRAFT → PUBLISHED` do próprio rascunho, com `If-Match` obrigatório. **Publicar não é `PUT` destrutivo**: o número da versão, o instante de publicação e a supersessão da versão anterior são emitidos pelo servidor, as versões anteriores permanecem íntegras e legíveis, e nenhuma sessão já iniciada muda de versão — ela continua fixada na que a originou. A publicação é idempotente pela identidade e pela `Idempotency-Key`: repetir devolve a mesma versão em vez de criar outra. Um rascunho que ainda não forma uma prescrição válida (treino sem exercício, exercício sem série, variante inativa, alternativa sem tipo coerente) é `422 DRAFT_INCOMPLETE` com `fieldErrors` apontando o caminho, sem publicar nada. Um exercício próprio arquivado (`archivePersonalExercise`) é variante inativa e vem com o `code` estável `EXERCISE_ARCHIVED`, no caminho do campo que referencia a variante (`prescribedVariantId` do exercício ou `variantId` da alternativa). A publicação também recusa o que os métodos de treino exigem, cada caso com o seu `code` em `fieldErrors` e o caminho do elemento: bloco combinado com menos de dois exercícios (`BLOCK_TOO_SMALL`), com exercícios que não são contíguos na ordem do treino (`BLOCK_NOT_CONTIGUOUS`) ou com número de séries diferente entre os exercícios (`BLOCK_SET_COUNT_MISMATCH`, apontando `sets` do exercício que diverge do primeiro do bloco), `blockKey` repetido em `blocks[]` (`BLOCK_KEY_REPEATED`), exercício de bloco que não é `LOCKED` (`BLOCK_ORDER_NOT_LOCKED`) ou que declara descanso próprio (`BLOCK_EXERCISE_HAS_OWN_REST`), e `DROP_SET` como primeira série do exercício (`DROP_SET_FIRST`, apontando o `setType` dela). Série em percentual sem carga de referência confirmada **não** impede publicar: é aviso do app, e o aluno vê o percentual sem valor calculado. Um aluno que ainda não pode receber prescrição nova — ficha de anamnese deste vínculo não concluída **quando o personal exige a conclusão para novas liberações**, prontidão aguardando liberação, autorização de responsável ausente — é `409 STUDENT_NOT_ELIGIBLE`, com `blockingReasons` nomeando o que falta. A condição opcional da anamnese (`DEC-PHOME-19` §5) é avaliada pelo servidor no mesmo ponto transacional da publicação, sobre a ficha do vínculo destinatário; ligá-la depois nunca despublica nem bloqueia o que já foi publicado. Não é borda: é o caminho comum de quem acabou de aceitar o convite. O corpo enviado estava correto e nada nele conserta a recusa, por isso não é `422`; o rascunho permanece editável e volta a poder ser publicado quando a elegibilidade mudar. **Rascunhar continua aberto**: o portão incide sobre entregar prescrição ao aluno, e não sobre o personal escrever. **Programação.** Publicar e ativar são efeitos distintos, e esta operação **não ativa**. Mas publicar uma `REVISION` de um plano com ativação vigente **mantém a programação**, na mesma transação e sem pedido do app: o servidor reaponta a ativação para a versão nova e os slots — ou a sequência — pelos `derivedFromWorkoutId`; treino novo fica sem dia, e aparece em `unscheduledWorkoutIds` de `getPersonalStudentPlanActivation`, até o personal defini-lo; treino removido deixa de ter slot. A ativação segue com a mesma identidade, o mesmo modo e a mesma data de término, e a `revision` dela muda. A publicação que falhar não reaponta nada. Quem quiser outra programação a altera depois (`updatePersonalStudentPlanActivation`) ou ativa de novo (`activatePersonalStudentPlan`), com o `ETag` que lê.

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

# **putPersonalStudentReferenceLoad**
```swift
    open class func putPersonalStudentReferenceLoad(idempotencyKey: String, studentId: String, variantId: String, putStudentReferenceLoadRequest: PutStudentReferenceLoadRequest, acceptLanguage: String? = nil, ifMatch: String? = nil, ifNoneMatch: IfNoneMatch_putPersonalStudentReferenceLoad? = nil, completion: @escaping (_ data: StudentReferenceLoadItem?, _ error: Error?) -> Void)
```

Confirmar a carga de referência de uma variante do aluno

Confirma o valor que passa a ser a carga de referência do aluno naquela variante, **informado** pelo personal (`source: INFORMED`) ou **aceito da estimativa** (`source: ACCEPTED_ESTIMATE`). A referência confirmada é a única que existe: a estimativa nunca é gravada por si. Aceitar a estimativa exige que `value` e `unit` sejam **os da estimativa que o servidor calcula agora**; se ela mudou ou deixou de existir desde a leitura, a resposta é `409 REFERENCE_LOAD_ESTIMATE_STALE` e o app lê de novo, em vez de gravar um número que o personal não viu. Nesse caso o servidor registra a `basis` da estimativa, e o cliente nunca a declara. `confirmedOn` é o dia civil que o valor informado representa; ausente, é o dia civil do servidor no fuso do vínculo. Não pode ser futuro, e só existe com `INFORMED`: aceitar a estimativa é confirmar hoje. **Compare-and-set.** Escrever sobre uma confirmação que o personal não viu é last-write-wins, e aqui isso mudaria o alvo do aluno em silêncio: a escrita exige precondição. Com confirmação existente, `If-Match` ecoa o `ETag` lido — o mesmo valor de `confirmed.revision`; **na primeira confirmação**, quando não há nenhuma, o pedido leva `If-None-Match: *`. Exatamente um dos dois: nenhum, ou os dois, é `422 VALIDATION_FAILED`. Revisão velha, ou `If-None-Match: *` com confirmação já existente, é `412 PRECONDITION_FAILED`, **sem gravar**, e o app lê de novo e decide: o que outro aparelho confirmou nunca é sobrescrito sem ser visto. O `ETag` da resposta é a revisão nova. A estimativa que não mudou **não** vale como precondição: o `409 REFERENCE_LOAD_ESTIMATE_STALE` cobre só o número aceito, e a revisão cobre o que está confirmado. Repetir a mesma `Idempotency-Key` devolve o mesmo resultado sem novo efeito. **Efeito sobre alvos:** a nova referência vale a partir da **próxima** sessão; um alvo já calculado numa sessão iniciada não muda. A carga de referência é dado de treino do aluno e não é copiada entre alunos nem para modelo. Vínculo pausado ou encerrado: `403 RELATIONSHIP_INACTIVE`. Aluno ou variante inexistentes e aluno de outro personal respondem o mesmo `404 PRESCRIPTION_RESOURCE_NOT_FOUND`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let variantId = "variantId_example" // String | Variante cuja carga de referência se confirma ou remove; a referência é por variante.
let putStudentReferenceLoadRequest = PutStudentReferenceLoadRequest(source: ReferenceLoadConfirmationSource(), value: 123, unit: PrescribedLoadUnit(), confirmedOn: Date()) // PutStudentReferenceLoadRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let ifMatch = "ifMatch_example" // String | `ETag` da confirmação lida, o mesmo valor de `confirmed.revision`. Obrigatório quando já existe confirmação para a variante, e então exclui `If-None-Match`; revisão velha é `412`, sem gravar. (optional)
let ifNoneMatch = "ifNoneMatch_example" // String | `*`, só na primeira confirmação de uma variante: afirma que o personal não viu nenhuma. Se outra já existe, é `412`, sem gravar. Exclui `If-Match`. (optional)

// Confirmar a carga de referência de uma variante do aluno
PersonalPrescriptionAPI.putPersonalStudentReferenceLoad(idempotencyKey: idempotencyKey, studentId: studentId, variantId: variantId, putStudentReferenceLoadRequest: putStudentReferenceLoadRequest, acceptLanguage: acceptLanguage, ifMatch: ifMatch, ifNoneMatch: ifNoneMatch) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente. |
 **variantId** | **String** | Variante cuja carga de referência se confirma ou remove; a referência é por variante. |
 **putStudentReferenceLoadRequest** | [**PutStudentReferenceLoadRequest**](PutStudentReferenceLoadRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **ifMatch** | **String** | &#x60;ETag&#x60; da confirmação lida, o mesmo valor de &#x60;confirmed.revision&#x60;. Obrigatório quando já existe confirmação para a variante, e então exclui &#x60;If-None-Match&#x60;; revisão velha é &#x60;412&#x60;, sem gravar. | [optional]
 **ifNoneMatch** | **String** | &#x60;*&#x60;, só na primeira confirmação de uma variante: afirma que o personal não viu nenhuma. Se outra já existe, é &#x60;412&#x60;, sem gravar. Exclui &#x60;If-Match&#x60;. | [optional]

### Return type

[**StudentReferenceLoadItem**](StudentReferenceLoadItem.md)

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

Substitui a estrutura autorada do rascunho por compare-and-set. `If-Match` com a `revision` lida é obrigatório: duas edições concorrentes **nunca** aplicam last-write-wins — a perdedora recebe `412 PRECONDITION_FAILED` e o conteúdo do servidor permanece como estava, para que o personal reconcilie explicitamente. A edição alcança somente o estado `DRAFT`. Uma versão já publicada é imutável: editá-la é `409 DRAFT_NOT_EDITABLE`, e revisar exige criar um rascunho novo derivado dela. Carga, repetições, descanso e política de ordem pertencem à série e ao exercício prescritos; ausência legítima permanece ausente e nunca vira zero. **Métodos de treino.** O conteúdo carrega, além do que já carregava, os blocos combinados do treino (`blocks[]`), o rótulo do exercício na prescrição (`displayName`, obrigatório), a cadência e a técnica do exercício, o tipo de cada série (`setType`, obrigatório), a duração alvo da série por tempo e a carga em percentual da carga de referência. As **exclusões mútuas** — `durationSeconds` com qualquer repetição prescrita, e `loadPercent` com `loadValue` ou `loadUnit` — e a cadência toda zerada são corpo inválido: `422 VALIDATION_FAILED`, sem gravar. As regras que dependem do conjunto — bloco, tipo de série — não impedem salvar um rascunho ainda incompleto: são recusadas na publicação. Os campos `derivedFrom…` pertencem ao servidor, que os grava quando o rascunho é `REVISION`; quem reenvia o conteúdo lido pode ecoá-los, e o servidor os ignora.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let draftId = "draftId_example" // String | Identidade do rascunho, criada pelo cliente.
let updatePrescriptionDraftRequest = UpdatePrescriptionDraftRequest(content: PrescriptionDraftContent(name: "name_example", workouts: [PrescriptionDraftWorkout(workoutId: "workoutId_example", derivedFromWorkoutId: "derivedFromWorkoutId_example", name: "name_example", focus: "focus_example", position: 123, blocks: [PrescribedBlock(blockKey: "blockKey_example", blockType: PrescribedBlockType(), restRange: PrescribedRestRange(minSeconds: 123, maxSeconds: 123), stationRestSeconds: 123)], exercises: [PrescriptionDraftExercise(prescribedExerciseId: "prescribedExerciseId_example", exerciseId: "exerciseId_example", prescribedVariantId: "prescribedVariantId_example", displayName: "displayName_example", derivedFromPrescribedExerciseId: "derivedFromPrescribedExerciseId_example", position: 123, orderPolicy: PrescribedOrderPolicy(), blockKey: "blockKey_example", cadence: PrescribedCadence(eccentricSeconds: 123, bottomPauseSeconds: 123, concentricSeconds: 123, topPauseSeconds: 123), technique: PrescribedTechnique(), dependsOnPrescribedExerciseId: "dependsOnPrescribedExerciseId_example", notes: "notes_example", restRange: nil, sets: [PrescriptionDraftSet(prescribedSetId: "prescribedSetId_example", setIndex: 123, setType: PrescribedSetType(), derivedFromPrescribedSetId: "derivedFromPrescribedSetId_example", target: PrescribedTarget(repsMin: 123, repsMax: 123, repsExact: 123, durationSeconds: 123, loadValue: 123, loadUnit: PrescribedLoadUnit(), loadPercent: 123, effortType: PrescribedEffortType(), effortValue: 123))], alternatives: [PrescriptionDraftAlternative(alternativeId: "alternativeId_example", alternativeType: PrescribedAlternativeType(), displayName: "displayName_example", variantId: "variantId_example", exerciseId: "exerciseId_example", priority: 123, authorizationScope: PrescribedAuthorizationScope())])])])) // UpdatePrescriptionDraftRequest |
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

# **updatePersonalStudentPlanActivation**
```swift
    open class func updatePersonalStudentPlanActivation(studentId: String, activationId: String, idempotencyKey: String, ifMatch: String, updatePlanActivationRequest: UpdatePlanActivationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PlanActivationChangeView?, _ error: Error?) -> Void)
```

Alterar a programação da ativação vigente do aluno

**Alterar programação** (PR1, PR10 e PR11): muda o modo, os slots ou a sequência e a data de término da ativação vigente **sem criar outra** — a identidade, o início e a versão ficam. É `PUT`: o corpo substitui a programação, e `endDate` ausente é ativação sem data de término; o início não se altera aqui. A programação nova vale a partir de **hoje**, no fuso do vínculo: as atribuições `AVAILABLE` que a ativação materializou de hoje em diante são retiradas e as novas nascem da programação nova; o que veio antes de hoje não muda, a atribuição que o personal fez à mão permanece e a atribuição em que o aluno já iniciou a sessão não é retirada: a sessão fica na versão que a originou. `outcome` é `ALTERED` e `retiredAssignmentCount` diz quantas foram retiradas. As regras da programação são as de `activatePersonalStudentPlan` (`weekdaySlots` ou `sequence` conforme o modo, `WEEKDAY_REPEATED`, `WORKOUT_REPEATED`, `WORKOUT_NOT_IN_VERSION`, `END_DATE_BEFORE_START`), valendo os treinos da versão que a ativação serve. **Compare-and-set**: `If-Match` é obrigatório e ecoa o `ETag` lido, o mesmo valor de `activation.revision`; revisão velha é `412 PRECONDITION_FAILED`, sem gravar, e a escrita de outro aparelho nunca é sobrescrita sem ser vista. Ativação já encerrada ou substituída é `409 PLAN_ACTIVATION_NOT_ACTIVE`. Alterar reentrega prescrição ao aluno, e por isso aluno que deixou de poder recebê-la é `409 STUDENT_NOT_ELIGIBLE`, com o mesmo vocabulário de publicar e ativar — inclusive a condição opcional da anamnese (`DEC-PHOME-19` §5): trocar a programação vale a partir de hoje e por isso conta como nova liberação, recusada com `ANAMNESIS_NOT_COMPLETED` quando o personal exige a conclusão e a ficha deste vínculo não está concluída. Nada já liberado é retirado e sessão em andamento nunca é afetada. Vínculo pausado ou encerrado é `403 RELATIONSHIP_INACTIVE`; aluno ou ativação inexistentes e de outro personal respondem o mesmo `404 PRESCRIPTION_RESOURCE_NOT_FOUND`. **Repetição.** A mesma `Idempotency-Key` com o mesmo corpo e a mesma revisão devolve o resultado guardado, sem novo efeito; com outro corpo é `409 IDEMPOTENCY_CONFLICT`. **Ordem das recusas**, a mesma em toda chamada: corpo malformado — `weekdaySlots` fora de `WEEKDAYS`, `sequence` fora de `SEQUENCE`, a lista do modo ausente — é `422` antes de tudo; depois o aluno (`404` fora do vínculo; `403 RELATIONSHIP_INACTIVE`); depois a ativação (`404` quando não é do aluno; `409 PLAN_ACTIVATION_NOT_ACTIVE` quando já não está vigente); depois a revisão (`412`); depois as regras da programação, todas `422`; e por último `409 STUDENT_NOT_ELIGIBLE`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo; fora do vínculo a resposta é indistinguível de inexistente.
let activationId = "activationId_example" // String | Ativação vigente a alterar, a mesma de `activation.activationId`.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let updatePlanActivationRequest = UpdatePlanActivationRequest(mode: PlanActivationMode(), endDate: Date(), weekdaySlots: [PlanWeekdaySlot(workoutId: "workoutId_example", weekdays: [PlanWeekday()])], sequence: ["sequence_example"]) // UpdatePlanActivationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Alterar a programação da ativação vigente do aluno
PersonalPrescriptionAPI.updatePersonalStudentPlanActivation(studentId: studentId, activationId: activationId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, updatePlanActivationRequest: updatePlanActivationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **activationId** | **String** | Ativação vigente a alterar, a mesma de &#x60;activation.activationId&#x60;. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exata da revisão lida pelo cliente; impede last-write-wins. |
 **updatePlanActivationRequest** | [**UpdatePlanActivationRequest**](UpdatePlanActivationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PlanActivationChangeView**](PlanActivationChangeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePersonalWorkoutTemplate**
```swift
    open class func updatePersonalWorkoutTemplate(idempotencyKey: String, ifMatch: String, templateId: String, updateWorkoutTemplateRequest: UpdateWorkoutTemplateRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: WorkoutTemplateView?, _ error: Error?) -> Void)
```

Editar o modelo de treino com revisão esperada

Substitui o conteúdo e os metadados do modelo por compare-and-set, como o rascunho. `If-Match` com a `revision` lida é obrigatório: duas edições concorrentes **nunca** aplicam last-write-wins — a perdedora recebe `412 PRECONDITION_FAILED` e o servidor permanece como estava. O pedido **substitui**: `description`, `goal` e `level` ausentes removem o valor que o modelo tinha, e `tags` ausente é nenhuma etiqueta. O nome do modelo é `content.name`. O conteúdo é o do rascunho e obedece às mesmas regras de corpo — exclusões mútuas, cadência, `displayName` e `setType` obrigatórios, limites de tamanho —, recusadas com `422 VALIDATION_FAILED` sem gravar. O que depende do conjunto e só é exigido na publicação (bloco, `DROP_SET` primeiro, exercício sem série) **não** impede salvar: modelo não publica. O modelo nunca tem `derivedFrom…`; um valor reenviado é ignorado. Editar o modelo **não altera nenhum plano** que já nasceu dele, e editar o plano não altera o modelo.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let templateId = "templateId_example" // String | Identidade do modelo, criada pelo cliente.
let updateWorkoutTemplateRequest = UpdateWorkoutTemplateRequest(description: "description_example", tags: ["tags_example"], goal: WorkoutTemplateGoal(), level: WorkoutTemplateLevel(), content: PrescriptionDraftContent(name: "name_example", workouts: [PrescriptionDraftWorkout(workoutId: "workoutId_example", derivedFromWorkoutId: "derivedFromWorkoutId_example", name: "name_example", focus: "focus_example", position: 123, blocks: [PrescribedBlock(blockKey: "blockKey_example", blockType: PrescribedBlockType(), restRange: PrescribedRestRange(minSeconds: 123, maxSeconds: 123), stationRestSeconds: 123)], exercises: [PrescriptionDraftExercise(prescribedExerciseId: "prescribedExerciseId_example", exerciseId: "exerciseId_example", prescribedVariantId: "prescribedVariantId_example", displayName: "displayName_example", derivedFromPrescribedExerciseId: "derivedFromPrescribedExerciseId_example", position: 123, orderPolicy: PrescribedOrderPolicy(), blockKey: "blockKey_example", cadence: PrescribedCadence(eccentricSeconds: 123, bottomPauseSeconds: 123, concentricSeconds: 123, topPauseSeconds: 123), technique: PrescribedTechnique(), dependsOnPrescribedExerciseId: "dependsOnPrescribedExerciseId_example", notes: "notes_example", restRange: nil, sets: [PrescriptionDraftSet(prescribedSetId: "prescribedSetId_example", setIndex: 123, setType: PrescribedSetType(), derivedFromPrescribedSetId: "derivedFromPrescribedSetId_example", target: PrescribedTarget(repsMin: 123, repsMax: 123, repsExact: 123, durationSeconds: 123, loadValue: 123, loadUnit: PrescribedLoadUnit(), loadPercent: 123, effortType: PrescribedEffortType(), effortValue: 123))], alternatives: [PrescriptionDraftAlternative(alternativeId: "alternativeId_example", alternativeType: PrescribedAlternativeType(), displayName: "displayName_example", variantId: "variantId_example", exerciseId: "exerciseId_example", priority: 123, authorizationScope: PrescribedAuthorizationScope())])])])) // UpdateWorkoutTemplateRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Editar o modelo de treino com revisão esperada
PersonalPrescriptionAPI.updatePersonalWorkoutTemplate(idempotencyKey: idempotencyKey, ifMatch: ifMatch, templateId: templateId, updateWorkoutTemplateRequest: updateWorkoutTemplateRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **templateId** | **String** | Identidade do modelo, criada pelo cliente. |
 **updateWorkoutTemplateRequest** | [**UpdateWorkoutTemplateRequest**](UpdateWorkoutTemplateRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**WorkoutTemplateView**](WorkoutTemplateView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
