# StudentOnboardingAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acknowledgePersonalStudentAnamnesisCorrection**](StudentOnboardingAPI.md#acknowledgepersonalstudentanamnesiscorrection) | **POST** /personal/students/{studentId}/anamnesis/analysis/decisions/correction-acknowledgement | Confirmar que a nova versão concluída corrige a resposta anterior
[**answerStudentAnamnesisClarification**](StudentOnboardingAPI.md#answerstudentanamnesisclarification) | **POST** /student/anamnesis/analysis/cases/{caseId}/clarification-requests/{clarificationRequestId}/answer | Responder a pergunta de esclarecimento pendente do caso vigente
[**completeStudentOnboarding**](StudentOnboardingAPI.md#completestudentonboarding) | **POST** /student/onboarding/complete | Concluir a anamnese funcional, fixando uma versão concluída imutável
[**correctPersonalStudentBodyAssessment**](StudentOnboardingAPI.md#correctpersonalstudentbodyassessment) | **POST** /personal/students/{studentId}/body-assessments/{assessmentId}/corrections | Corrigir uma avaliação por substituição integral append-only, sem tocar o original
[**createPersonalStudentBodyAssessment**](StudentOnboardingAPI.md#createpersonalstudentbodyassessment) | **POST** /personal/students/{studentId}/body-assessments | Registrar, como personal do vínculo, uma avaliação corporal manual do aluno
[**declarePersonalStudentAnamnesisCleared**](StudentOnboardingAPI.md#declarepersonalstudentanamnesiscleared) | **POST** /personal/students/{studentId}/anamnesis/analysis/decisions/medical-declaration | Declarar que viu a liberação médica do aluno, com prova de step-up
[**getPersonalStudentAnamnesis**](StudentOnboardingAPI.md#getpersonalstudentanamnesis) | **GET** /personal/students/{studentId}/anamnesis | Ler, como personal do vínculo, a anamnese deste vínculo
[**getPersonalStudentAnamnesisAnalysis**](StudentOnboardingAPI.md#getpersonalstudentanamnesisanalysis) | **GET** /personal/students/{studentId}/anamnesis/analysis | Ler o caso de análise vigente da ficha deste vínculo
[**getPersonalStudentAnamnesisControls**](StudentOnboardingAPI.md#getpersonalstudentanamnesiscontrols) | **GET** /personal/students/{studentId}/anamnesis/controls | Ler a exigência opcional e a solicitação de preenchimento da ficha deste vínculo
[**getPersonalStudentAnamnesisVersion**](StudentOnboardingAPI.md#getpersonalstudentanamnesisversion) | **GET** /personal/students/{studentId}/anamnesis/versions/{anamnesisVersionId} | Ler o conteúdo de uma versão da ficha deste vínculo
[**getPersonalStudentBodyAssessment**](StudentOnboardingAPI.md#getpersonalstudentbodyassessment) | **GET** /personal/students/{studentId}/body-assessments/{assessmentId} | Ler, como personal do vínculo, o registro profissional completo de uma avaliação
[**getPersonalStudentBodyAuthorization**](StudentOnboardingAPI.md#getpersonalstudentbodyauthorization) | **GET** /personal/students/{studentId}/body-authorization | Ler, como personal do vínculo, a situação atual da autorização corporal do aluno
[**getStudentAnamnesisAnalysis**](StudentOnboardingAPI.md#getstudentanamnesisanalysis) | **GET** /student/anamnesis/analysis | Ler o caso de análise vigente do próprio aluno
[**getStudentAnamnesisAnalysisPending**](StudentOnboardingAPI.md#getstudentanamnesisanalysispending) | **GET** /student/anamnesis/analysis/pending | Pendência mínima da análise de anamnese para a Hoje do aluno
[**getStudentAnamnesisConsent**](StudentOnboardingAPI.md#getstudentanamnesisconsent) | **GET** /student/anamnesis/consent | Recuperar o termo exato aceito no vínculo atual
[**getStudentBodyAssessment**](StudentOnboardingAPI.md#getstudentbodyassessment) | **GET** /student/relationships/{relationshipId}/body-assessments/{assessmentId} | Ler, como aluno do vínculo, o registro profissional completo de uma avaliação
[**getStudentBodyAuthorization**](StudentOnboardingAPI.md#getstudentbodyauthorization) | **GET** /student/relationships/{relationshipId}/body-authorization | Ler a autorização corporal específica do aluno neste vínculo
[**getStudentOnboarding**](StudentOnboardingAPI.md#getstudentonboarding) | **GET** /student/onboarding | Ler a entrada do aluno — onboarding, anamnese funcional, prontidão e elegibilidade
[**grantPersonalStudentAnamnesisExemption**](StudentOnboardingAPI.md#grantpersonalstudentanamnesisexemption) | **POST** /personal/students/{studentId}/anamnesis/analysis/decisions/professional-exemption | Assumir a responsabilidade profissional e liberar, com prova de step-up
[**listPersonalStudentAnamnesisAnalysisActs**](StudentOnboardingAPI.md#listpersonalstudentanamnesisanalysisacts) | **GET** /personal/students/{studentId}/anamnesis/analysis/history | Histórico protegido dos atos de análise da ficha deste vínculo
[**listPersonalStudentBodyAssessments**](StudentOnboardingAPI.md#listpersonalstudentbodyassessments) | **GET** /personal/students/{studentId}/body-assessments | Ler, como personal do vínculo, o histórico de avaliações corporais registradas
[**listPersonalStudentBodyDeclarations**](StudentOnboardingAPI.md#listpersonalstudentbodydeclarations) | **GET** /personal/students/{studentId}/anamnesis/body-declarations | Ler, como personal do vínculo, o histórico declarado do aluno
[**listStudentAnamnesisAnalysisActs**](StudentOnboardingAPI.md#liststudentanamnesisanalysisacts) | **GET** /student/anamnesis/analysis/history | Histórico protegido dos atos de análise do próprio aluno
[**listStudentAnamnesisVersions**](StudentOnboardingAPI.md#liststudentanamnesisversions) | **GET** /student/anamnesis/versions | Ler o próprio acervo de versões concluídas da anamnese, de todos os vínculos
[**listStudentBodyAssessments**](StudentOnboardingAPI.md#liststudentbodyassessments) | **GET** /student/relationships/{relationshipId}/body-assessments | Ler o histórico próprio de avaliações corporais profissionais deste vínculo
[**listStudentBodyDeclarations**](StudentOnboardingAPI.md#liststudentbodydeclarations) | **GET** /student/anamnesis/body-declarations | Ler o próprio histórico de declarações corporais por versão integral
[**openPersonalStudentAnamnesisAnalysis**](StudentOnboardingAPI.md#openpersonalstudentanamnesisanalysis) | **POST** /personal/students/{studentId}/anamnesis/analysis | Abrir o caso de análise da anamnese por exceção deste vínculo
[**refusePersonalStudentAnamnesisPrescription**](StudentOnboardingAPI.md#refusepersonalstudentanamnesisprescription) | **POST** /personal/students/{studentId}/anamnesis/analysis/decisions/refusal | Registrar a decisão de não liberar nova prescrição neste vínculo
[**requestPersonalStudentAnamnesisClarification**](StudentOnboardingAPI.md#requestpersonalstudentanamnesisclarification) | **POST** /personal/students/{studentId}/anamnesis/analysis/clarification-requests | Perguntar esclarecimento ao aluno dentro do caso de análise vigente
[**requestPersonalStudentAnamnesisCompletion**](StudentOnboardingAPI.md#requestpersonalstudentanamnesiscompletion) | **PUT** /personal/students/{studentId}/anamnesis/controls/completion-request | Solicitar, dentro do app, o preenchimento da ficha deste vínculo
[**saveStudentAnamnesisSection**](StudentOnboardingAPI.md#savestudentanamnesissection) | **PUT** /student/onboarding/anamnesis/{sectionKey} | Salvar uma seção tipada da anamnese no rascunho privado do aluno
[**setPersonalStudentAnamnesisRequirement**](StudentOnboardingAPI.md#setpersonalstudentanamnesisrequirement) | **PUT** /personal/students/{studentId}/anamnesis/controls/requirement | Exigir, ou deixar de exigir, a conclusão da ficha deste vínculo para novas liberações
[**setStudentBodyAuthorization**](StudentOnboardingAPI.md#setstudentbodyauthorization) | **PUT** /student/relationships/{relationshipId}/body-authorization | Registrar a escolha explícita do aluno sobre dados corporais manuais
[**supersedePersonalStudentAnamnesisDecision**](StudentOnboardingAPI.md#supersedepersonalstudentanamnesisdecision) | **POST** /personal/students/{studentId}/anamnesis/analysis/decisions/{decisionId}/supersession | Revogar, reconsiderar ou corrigir a decisão em vigor do caso
[**withdrawPersonalStudentAnamnesisClarification**](StudentOnboardingAPI.md#withdrawpersonalstudentanamnesisclarification) | **POST** /personal/students/{studentId}/anamnesis/analysis/clarification-requests/{clarificationRequestId}/withdrawal | Retirar a pergunta pendente e encerrar o caso sem decisão de mérito


# **acknowledgePersonalStudentAnamnesisCorrection**
```swift
    open class func acknowledgePersonalStudentAnamnesisCorrection(studentId: String, idempotencyKey: String, ifMatch: String, acknowledgePersonalStudentAnamnesisCorrectionRequest: AcknowledgePersonalStudentAnamnesisCorrectionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Confirmar que a nova versão concluída corrige a resposta anterior

Registra a decisão `ANSWER_CORRECTION_ACKNOWLEDGED` (`DEC-PHOME-19` §5.3): o aluno concluiu **nova versão** da ficha — sem resposta positiva na triagem — e o personal confirma que ela corrige a versão que abriu o caso. `correctedAnamnesisVersionId` tem de nomear versão concluída **posterior** à versão de origem e livre de sinal positivo; versão inexistente, anterior ou ainda positiva é `409 ANAMNESIS_CORRECTION_NOT_RECORDED`. Não é declaração de liberação médica nem dispensa — é ato próprio, que nunca sobe ao passo de validade profissional. O commit anexa `DECISION_RECORDED`, põe a decisão em vigor, o caso vira `RELEASED_FOR_NEW_PRESCRIPTION` e a razão da análise sai da elegibilidade. Uma resposta positiva que vira negativa **nunca** fecha o caso sozinha: é esta confirmação profissional que encerra. Exige o caso `AWAITING_PERSONAL` sem decisão em vigor — `NOT_RELEASED` pede reconsideração antes, e caso reaberto que ainda carrega decisão em vigor é `409 ANAMNESIS_ANALYSIS_NOT_OPEN`; o caminho é a supersunção — e `If-Match` com a revisão corrente, nunca `*`; divergência é `412 PRECONDITION_FAILED` com `currentRevision`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem novo ato; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let acknowledgePersonalStudentAnamnesisCorrectionRequest = AcknowledgePersonalStudentAnamnesisCorrectionRequest(relationshipId: "relationshipId_example", caseId: "caseId_example", correctedAnamnesisVersionId: "correctedAnamnesisVersionId_example") // AcknowledgePersonalStudentAnamnesisCorrectionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Confirmar que a nova versão concluída corrige a resposta anterior
StudentOnboardingAPI.acknowledgePersonalStudentAnamnesisCorrection(studentId: studentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acknowledgePersonalStudentAnamnesisCorrectionRequest: acknowledgePersonalStudentAnamnesisCorrectionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **acknowledgePersonalStudentAnamnesisCorrectionRequest** | [**AcknowledgePersonalStudentAnamnesisCorrectionRequest**](AcknowledgePersonalStudentAnamnesisCorrectionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **answerStudentAnamnesisClarification**
```swift
    open class func answerStudentAnamnesisClarification(caseId: String, clarificationRequestId: String, idempotencyKey: String, ifMatch: String, answerStudentAnamnesisClarificationRequest: AnswerStudentAnamnesisClarificationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Responder a pergunta de esclarecimento pendente do caso vigente

Responde a pergunta **pendente** do caso de análise do próprio vínculo (`DEC-PHOME-19` §5.2): `answer` é texto autorado, preservado verbatim com o teto do contrato, e o servidor grava autor e `answeredAt` do relógio do servidor — nunca do cliente. O commit anexa o ato imutável `CLARIFICATION_ANSWERED`, marca a pergunta como respondida e o caso volta a `AWAITING_PERSONAL`. Responder **não é** decisão nem confirmação de aptidão: não altera prontidão nem elegibilidade por si — quem decide é sempre o personal. Exige a pergunta ainda pendente: já respondida ou retirada é `409 ANAMNESIS_CLARIFICATION_NOT_PENDING`; `caseId` que não é o caso vigente é `409 ANAMNESIS_ANALYSIS_CASE_MISMATCH`; sem caso vigente é `409 ANAMNESIS_ANALYSIS_NOT_OPEN`; pergunta fora do caso é `404`. `If-Match` carrega a revisão corrente do caso — eco da leitura, nunca `*`; divergência é `412 PRECONDITION_FAILED` com `currentRevision`. Corrida com a retirada é decidida pelo compare-and-set: quem chega depois recebe `412` e, relendo, encontra a pergunta já retirada. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem novo ato; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let caseId = "caseId_example" // String | Caso de análise vigente do próprio vínculo do aluno autenticado.
let clarificationRequestId = "clarificationRequestId_example" // String | Pergunta ainda pendente a responder.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let answerStudentAnamnesisClarificationRequest = AnswerStudentAnamnesisClarificationRequest(relationshipId: "relationshipId_example", caseId: "caseId_example", answer: "answer_example") // AnswerStudentAnamnesisClarificationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Responder a pergunta de esclarecimento pendente do caso vigente
StudentOnboardingAPI.answerStudentAnamnesisClarification(caseId: caseId, clarificationRequestId: clarificationRequestId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, answerStudentAnamnesisClarificationRequest: answerStudentAnamnesisClarificationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **caseId** | **String** | Caso de análise vigente do próprio vínculo do aluno autenticado. |
 **clarificationRequestId** | **String** | Pergunta ainda pendente a responder. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **answerStudentAnamnesisClarificationRequest** | [**AnswerStudentAnamnesisClarificationRequest**](AnswerStudentAnamnesisClarificationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentAnamnesisAnalysisOutcome**](StudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **completeStudentOnboarding**
```swift
    open class func completeStudentOnboarding(idempotencyKey: String, ifMatch: String, completeStudentAnamnesisRequest: CompleteStudentAnamnesisRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentOnboardingCompletionView?, _ error: Error?) -> Void)
```

Concluir a anamnese funcional, fixando uma versão concluída imutável

Transforma o rascunho privado vigente em uma **versão concluída imutável**, com `If-Match` obrigatório, ecoando a mesma e única revisão desta superfície — `anamnesis.draft.revision`, publicada como `ETag` na leitura. Concluir **cria versão**; editar depois e concluir de novo cria **outra** versão e **preserva** a anterior, que continua consultável. Nenhuma versão é reescrita, apagada ou substituída em silêncio. A idempotência é **por versão, não por aluno**: repetir a mesma tentativa sobre a mesma `revision` devolve a mesma versão em vez de criar outra, e portanto produz no máximo uma notificação por versão concluída. A entrega real ao personal **não** é pós-condição desta operação e não é afirmada por ela. **Resposta canônica única, sem ramificação por idade.** Menor e adulto concluem exatamente da mesma forma. Triagem de prontidão pendente e autorização de responsável ausente **não** impedem concluir: elas aparecem apenas como motivos nomeados e acumuláveis em `prescriptionEligibility`. Não existe, aqui, resposta de \"conclusão pendente por responsável\", nem operação de autorização embutida. Concluir afirma que existe versão concluída; **não** afirma elegibilidade para prescrição. **Conclui a ficha do vínculo atual, não uma anamnese global (`DEC-PHOME-19`).** O corpo repete `relationshipId`, o vínculo dono da ficha lida; vínculo trocado depois da leitura é `409 ANAMNESIS_RELATIONSHIP_MISMATCH` e vínculo encerrado, sem outro atual, é `403 RELATIONSHIP_INACTIVE` — a ficha encerrada fica congelada, sem versão nova. Com o vínculo pausado a conclusão é aceita. A versão nasce com o aluno como autor, a ficha e o vínculo de origem, a revisão do rascunho e o instante do servidor; `versionNumber` é local à ficha. A conclusão é **única por ficha e revisão do rascunho**: duas conclusões concorrentes da mesma revisão, mesmo com chaves diferentes, devolvem a mesma versão, sem número duplicado; revisão velha é `412`, nunca last-write-wins. Nada de outra ficha conclui esta, e nenhuma versão de outra ficha a substitui. A conclusão satisfaz, no mesmo commit, a solicitação de preenchimento pendente desta ficha. A repetição reautoriza o vínculo antes de devolver o resultado guardado. Quando a ficha tem caso de análise por exceção vigente, a versão nova assume o alvo do caso **no mesmo commit**: o ato `TARGET_VERSION_SUPERSEDED` fica gravado no histórico, perguntas ainda pendentes ganham `supersededAt` e passam a recusar resposta tardia, a `revision` do caso avança — `If-Match` com a revisão anterior é `412` — e um caso pendente volta a `AWAITING_PERSONAL` sem que a razão `ANAMNESIS_ANALYSIS_PENDING` saia da elegibilidade. **`BODY_DATA` na conclusão (`DOC-STUDENT-JOURNEY-BODY-TECH` §3/§5.2).** A versão integral congela o rascunho inteiro — inclusive a seção `BODY_DATA`, quando presente — e publica a declaração somente nesta transação. Um rascunho `PROVIDED` **com números** exige autorização corporal efetiva **atual**: sem ela a conclusão é recusada com `403 BODY_AUTHORIZATION_REQUIRED` — nunca concluída em silêncio com valores ocultos — e com o vínculo `PAUSED` é `409 RELATIONSHIP_INACTIVE`; nas duas recusas nada é congelado, a resposta funcional do rascunho é preservada e o aluno continua depois de descartar os números ou salvar `SKIPPED`, sem nova aceitação funcional. `BODY_DATA` ausente ou `SKIPPED` não bloqueia nada: a seção nunca entra nas faltas de `ANAMNESIS_INCOMPLETE` nem em qualquer gate de conclusão funcional.

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

# **correctPersonalStudentBodyAssessment**
```swift
    open class func correctPersonalStudentBodyAssessment(studentId: String, assessmentId: String, idempotencyKey: String, ifMatch: String, correctPersonalStudentBodyAssessmentRequest: CorrectPersonalStudentBodyAssessmentRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: BodyAssessmentView?, _ error: Error?) -> Void)
```

Corrigir uma avaliação por substituição integral append-only, sem tocar o original

Correção **append-only** da avaliação endereçada (`DOC-STUDENT-JOURNEY-BODY-TECH` §5.1): o corpo traz a **substituição integral** dos campos — omissão **não** conserva valor antigo — mais `reason`, a justificativa simples da correção de 1–200 caracteres, sem solicitar diagnóstico. O servidor cria **outro** `assessmentId`, `authorId` e `recordedAt` com `supersedesId` apontando o predecessor: o original é **imutável**, a origem `PERSONAL_MEASURED` nunca muda e a cadeia permanece linear — duas correções com chaves diferentes do mesmo predecessor terminam com uma confirmada e a perdedora recebendo `409 BODY_ASSESSMENT_SUPERSEDED`, nunca bifurcação. `Idempotency-Key` é obrigatória e `If-Match` carrega o `ETag` **do registro predecessor lido**: ausente, vazio ou `*` é `428 PRECONDITION_REQUIRED`, divergente é `412 PRECONDITION_FAILED` com `currentRevision`. A repetição confirmada é reautorizada no estado atual **antes** de servir o `201` guardado e antes de recusar a revisão que a própria primeira escrita consumiu; mesma chave com corpo diferente é `409 IDEMPOTENCY_CONFLICT`. Um personal diferente **não** corrige registro de outro vínculo — alvo fora do par é `404`. As mesmas regras fechadas de `createPersonalStudentBodyAssessment` valem para data civil, método, procedência, métricas e composição; exige vínculo `ACTIVE` e autorização corporal efetiva, e campo forjado — `origin`, `authorId`, `recordedAt`, `supersedesId` — é `422`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo do personal autenticado.
let assessmentId = "assessmentId_example" // String | Registro profissional de avaliação corporal endereçado dentro do vínculo. ID que não alcança um registro **deste** vínculo e deste par responde `404`, indistinguível de inexistente — nenhuma resposta confirma avaliação de outro vínculo.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato do **registro predecessor** lido — o mesmo valor de `revision` emitido por `getPersonalStudentBodyAssessment` ou pelo `201` do próprio registro, enviado verbatim. Não é o `ETag` do vínculo, da autorização corporal nem de uma coleção, e nunca se deriva de `revision`. O curinga `*` não é elegível — quem nunca leu o registro também o enviaria, e derrubaria a precondição —; ausente, vazio ou `*` é `428 PRECONDITION_REQUIRED` e divergente é `412 PRECONDITION_FAILED` com `currentRevision`, sem registro novo. O predecessor já corrigido recusa por `409 BODY_ASSESSMENT_SUPERSEDED`, não por esta precondição.
let correctPersonalStudentBodyAssessmentRequest = CorrectPersonalStudentBodyAssessmentRequest(relationshipId: "relationshipId_example", reason: "reason_example", measuredOn: Date(), timeZone: "timeZone_example", method: BodyAssessmentMethod(), methodDescription: "methodDescription_example", _protocol: BodyAssessmentProvenance(status: BodyAssessmentProvenanceStatus(), description: "description_example"), device: nil, metrics: BodyAssessmentMetrics(weightKg: 123, heightCm: 123, waistCm: 123, hipCm: 123, chestCm: 123, leftUpperArmCm: 123, rightUpperArmCm: 123, leftThighCm: 123, rightThighCm: 123, leftCalfCm: 123, rightCalfCm: 123, bodyFatPercent: 123, fatMassKg: 123, leanMassKg: 123)) // CorrectPersonalStudentBodyAssessmentRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Corrigir uma avaliação por substituição integral append-only, sem tocar o original
StudentOnboardingAPI.correctPersonalStudentBodyAssessment(studentId: studentId, assessmentId: assessmentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, correctPersonalStudentBodyAssessmentRequest: correctPersonalStudentBodyAssessmentRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo do personal autenticado. |
 **assessmentId** | **String** | Registro profissional de avaliação corporal endereçado dentro do vínculo. ID que não alcança um registro **deste** vínculo e deste par responde &#x60;404&#x60;, indistinguível de inexistente — nenhuma resposta confirma avaliação de outro vínculo. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | &#x60;ETag&#x60; exato do **registro predecessor** lido — o mesmo valor de &#x60;revision&#x60; emitido por &#x60;getPersonalStudentBodyAssessment&#x60; ou pelo &#x60;201&#x60; do próprio registro, enviado verbatim. Não é o &#x60;ETag&#x60; do vínculo, da autorização corporal nem de uma coleção, e nunca se deriva de &#x60;revision&#x60;. O curinga &#x60;*&#x60; não é elegível — quem nunca leu o registro também o enviaria, e derrubaria a precondição —; ausente, vazio ou &#x60;*&#x60; é &#x60;428 PRECONDITION_REQUIRED&#x60; e divergente é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem registro novo. O predecessor já corrigido recusa por &#x60;409 BODY_ASSESSMENT_SUPERSEDED&#x60;, não por esta precondição. |
 **correctPersonalStudentBodyAssessmentRequest** | [**CorrectPersonalStudentBodyAssessmentRequest**](CorrectPersonalStudentBodyAssessmentRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**BodyAssessmentView**](BodyAssessmentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalStudentBodyAssessment**
```swift
    open class func createPersonalStudentBodyAssessment(studentId: String, idempotencyKey: String, createPersonalStudentBodyAssessmentRequest: CreatePersonalStudentBodyAssessmentRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: BodyAssessmentView?, _ error: Error?) -> Void)
```

Registrar, como personal do vínculo, uma avaliação corporal manual do aluno

Registro de uma **avaliação corporal manual** do aluno deste vínculo pelo personal autenticado (`DOC-STUDENT-JOURNEY-BODY-TECH` §4–§5.1). A autoria é do servidor: o request **nunca** recebe `origin`, `authorId`, nome de autor, `recordedAt` nem número de versão — `origin` é sempre `PERSONAL_MEASURED`, `authorId` deriva da conta autenticada e `recordedAt` é o instante UTC do servidor; campo forjado é `422`. O formulário começa vazio: nenhum número declarado pelo aluno é copiado como medição nem preenchido em background. O conjunto é **fechado**: `measuredOn` civil ISO não futura ao relógio do servidor na `timeZone` IANA enviada e validada; `method` em `ANTHROPOMETRY`, `SKINFOLDS`, `BIOIMPEDANCE` ou `OTHER` — `OTHER` exige `methodDescription` de 1–120 code points, `SKINFOLDS` exige `protocol` e `BIOIMPEDANCE` exige `device`, cada um com `status` `KNOWN` (exige `description` 1–120) ou `NOT_RECORDED` (proíbe `description`), e nunca se inventa protocolo ou aparelho; `metrics` fecha em 14 campos com unidade e limite próprios, exige **pelo menos um** valor e recusa campo desconhecido, zero, negativo, texto, notação inválida ou mais de **2 casas decimais** com `422`. Métrica de composição corporal (`bodyFatPercent`, `fatMassKg`, `leanMassKg`) exige método `SKINFOLDS`, `BIOIMPEDANCE` ou `OTHER` — nunca se produz composição a partir de peso e altura, e este contrato **não calcula soma, IMC, meta, laudo nem campo clínico livre**. `Idempotency-Key` é obrigatória, escopada a ator+vínculo+operação: a repetição confirmada é reautorizada no estado atual e devolve a resposta `201` original, sem inserir outro registro; mesma chave com corpo diferente é `409 IDEMPOTENCY_CONFLICT`. `relationshipId` do corpo precisa ser o vínculo atual do par personal+aluno — divergente é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`, estrangeiro é `404`. Coleta numérica exige vínculo `ACTIVE` e autorização corporal efetiva: `PAUSED`/`ENDED` é `409 RELATIONSHIP_INACTIVE`, sem grant é `403 BODY_AUTHORIZATION_REQUIRED`, base de compartilhamento retirada é `403 SHARING_GRANT_REQUIRED`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createPersonalStudentBodyAssessmentRequest = CreatePersonalStudentBodyAssessmentRequest(relationshipId: "relationshipId_example", measuredOn: Date(), timeZone: "timeZone_example", method: BodyAssessmentMethod(), methodDescription: "methodDescription_example", _protocol: BodyAssessmentProvenance(status: BodyAssessmentProvenanceStatus(), description: "description_example"), device: nil, metrics: BodyAssessmentMetrics(weightKg: 123, heightCm: 123, waistCm: 123, hipCm: 123, chestCm: 123, leftUpperArmCm: 123, rightUpperArmCm: 123, leftThighCm: 123, rightThighCm: 123, leftCalfCm: 123, rightCalfCm: 123, bodyFatPercent: 123, fatMassKg: 123, leanMassKg: 123)) // CreatePersonalStudentBodyAssessmentRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Registrar, como personal do vínculo, uma avaliação corporal manual do aluno
StudentOnboardingAPI.createPersonalStudentBodyAssessment(studentId: studentId, idempotencyKey: idempotencyKey, createPersonalStudentBodyAssessmentRequest: createPersonalStudentBodyAssessmentRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo do personal autenticado. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **createPersonalStudentBodyAssessmentRequest** | [**CreatePersonalStudentBodyAssessmentRequest**](CreatePersonalStudentBodyAssessmentRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**BodyAssessmentView**](BodyAssessmentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **declarePersonalStudentAnamnesisCleared**
```swift
    open class func declarePersonalStudentAnamnesisCleared(studentId: String, idempotencyKey: String, ifMatch: String, declarePersonalStudentAnamnesisClearedRequest: DeclarePersonalStudentAnamnesisClearedRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Declarar que viu a liberação médica do aluno, com prova de step-up

Registra a decisão `MEDICAL_CLEARANCE_DECLARED` (`DEC-PHOME-19` §5.3): o personal **declara ter visto** a liberação médica do aluno e descreve a condição a que ela se refere em `conditionSummary`. Nenhum relatório, atestado ou exame é anexado, transcrito ou armazenado — o registro é a declaração, nunca o documento. É ato protegido por **step-up** (`pliora-contracts#315`): `stepUpProof` tem de ser prova válida de `MEDICAL_CLEARANCE_DECLARATION`, de uso único, vinculada a conta, sessão, `caseId`, versão e revisão esperadas e `mutationIntentId` deste pedido; prova ausente, divergente, expirada ou já consumida é `STEP_UP_PROOF_REQUIRED`, `STEP_UP_PROOF_MISMATCH`, `STEP_UP_PROOF_EXPIRED` ou `STEP_UP_PROOF_CONSUMED`, e a prova só é consumida **atomicamente** com o ato — falha na gravação não a consome, e repetição idempotente devolve o resultado guardado sem nova prova. O commit anexa `DECISION_RECORDED`, põe a decisão em vigor, o caso vira `RELEASED_FOR_NEW_PRESCRIPTION`, a prontidão vira `CLEARED` e a razão de bloqueio da análise sai da elegibilidade — liberando **só** a publicação de prescrição nova; prescrição já publicada nunca é tocada. Exige o caso `AWAITING_PERSONAL` **sem decisão em vigor** — `NOT_RELEASED` pede reconsideração, não decisão por cima, e caso reaberto que ainda carrega decisão em vigor é `409 ANAMNESIS_ANALYSIS_NOT_OPEN`: o caminho é a supersunção explícita da decisão, nunca decidir por cima dela — e `If-Match` com a revisão corrente, nunca `*`; divergência é `412 PRECONDITION_FAILED` com `currentRevision`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem novo ato nem novo consumo; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let declarePersonalStudentAnamnesisClearedRequest = DeclarePersonalStudentAnamnesisClearedRequest(relationshipId: "relationshipId_example", caseId: "caseId_example", conditionSummary: "conditionSummary_example", mutationIntentId: "mutationIntentId_example", stepUpProof: "stepUpProof_example") // DeclarePersonalStudentAnamnesisClearedRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Declarar que viu a liberação médica do aluno, com prova de step-up
StudentOnboardingAPI.declarePersonalStudentAnamnesisCleared(studentId: studentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, declarePersonalStudentAnamnesisClearedRequest: declarePersonalStudentAnamnesisClearedRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **declarePersonalStudentAnamnesisClearedRequest** | [**DeclarePersonalStudentAnamnesisClearedRequest**](DeclarePersonalStudentAnamnesisClearedRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

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

Ler, como personal do vínculo, a anamnese deste vínculo

Leitura sem efeito colateral, autorizada somente ao personal do vínculo **ativo**, e reautorizada a cada chamada (`DEC-PHOME-19`). Cada novo vínculo tem a sua ficha, mesmo quando o aluno volta ao mesmo personal; a resposta fala da ficha **deste** vínculo, e de nada mais (`DEC-PHOME-20`): nenhuma versão de outra ficha é visível aqui — nem conteúdo, metadados, referência nem a existência dela. **Duas dimensões separadas, no mesmo bloco da linha operacional.** `anamnesis` publica o preenchimento da ficha deste vínculo e a referência da versão concluída mais recente dela; `authorizedVersions` publica as versões concluídas **da ficha deste vínculo** por referência; nenhuma dimensão é inferida de outra. **O que autoriza cada versão.** Toda versão legível aqui é da ficha deste vínculo, legível porque o aluno aceitou explicitamente o termo no commit do vínculo — consentimento registrado, não presumido, sem alternância. Não existe autorização de versões de outros vínculos. A autorização é aplicada **antes** de selecionar a versão mais recente, contar, ordenar e projetar metadados: o servidor nunca entrega o acervo para o app filtrar. **Antes da primeira conclusão desta ficha a resposta é apenas estado:** `currentFormState` `NO_ANAMNESIS` ou `IN_PROGRESS`, sem conteúdo, resumo, contagem, percentual, data ou prontidão do rascunho. **Depois dela** viajam a referência e o conteúdo da versão mais recente da ficha deste vínculo, em `latestCurrentVersion`. Uma edição em curso do aluno é invisível aqui e **não** devolve o estado a \"em andamento\": o personal continua vendo a última versão concluída até que outra seja concluída. Falha de leitura é erro com nova tentativa, nunca uma ausência declarada. O conteúdo de cada versão da ficha deste vínculo é lido em `getPersonalStudentAnamnesisVersion`, com o mesmo predicado. A operação existe porque a leitura profissional não cabe, de modo compatível, na projeção do próprio aluno: o ator, a autorização e o recorte projetado são outros, e colapsá-los exporia rascunho privado. Ela **não** expõe identidade, nome ou contato de responsável, **não** oferece caminho para conceder, revogar ou consultar autorização de responsável e **não** registra liberação médica ou dispensa: essas superfícies não têm contrato nesta fatia. A autorização de responsável aparece exclusivamente como motivo nomeado em `prescriptionEligibility`. Um aluno inexistente e um aluno de outra relação respondem de forma indistinguível. Vínculo pausado ou encerrado é `403` próprio, e nenhuma recusa expõe nada sobre outras fichas. Resposta `private, no-store`: nada fica em cache que restaure, depois de uma revogação, o que deixou de ser autorizado. **`BODY_DATA` segue autorização própria.** A seção viaja nas versões somente quando a autorização corporal específica do vínculo (`effectiveAccess` `ALLOWED` em `getPersonalStudentBodyAuthorization`) permite a leitura na transação; sem ela o mapper a retira da versão projetada, sem flag, contagem nem marca de \"dado oculto\" — `GOAL`, `HISTORY` e `TRAINING_CONTEXT` legitimamente autorizadas seguem intactas.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler, como personal do vínculo, a anamnese deste vínculo
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

# **getPersonalStudentAnamnesisAnalysis**
```swift
    open class func getPersonalStudentAnamnesisAnalysis(studentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisView?, _ error: Error?) -> Void)
```

Ler o caso de análise vigente da ficha deste vínculo

Leitura protegida do **caso de análise vigente** da ficha deste vínculo, para o personal autorizado (`DEC-PHOME-19` §5, `pliora-contracts#317`). É a forma dedicada do mesmo recorte que `getPersonalStudentAnamnesis` já publica em `analysisCase` — o destino protegido para onde a fila de atenção aponta (`DOC-PERSONAL-DESTINATIONS` §8.4) — e nunca uma segunda projeção: mesmo predicado, mesmos campos, mesma `revision` que `If-Match` ecoa nos comandos. **Autorização revalidada a cada leitura**, nesta ordem e sem atalho: credencial e contexto de personal, vínculo `ACTIVE` com este `studentId` e base de acesso em vigor — o aceite real de `SHARE_DATA_WITH_PERSONAL` gravado no vínculo. O que falhar vira a recusa correspondente: `404` para aluno que não é deste personal (inexistente e alheio indistinguíveis, nunca revelando vínculo de outro personal), `403` com `FORBIDDEN`, `RELATIONSHIP_PAUSED`, `RELATIONSHIP_INACTIVE` ou `SHARING_GRANT_REQUIRED`. `analysis` ausente é **ausência confirmada** — não há caso vigente na ficha deste vínculo — e nunca indisponibilidade, recusa nem silêncio sobre um caso que exista. Nada sobre a ficha de outro vínculo viaja aqui: nem o caso dela, nem a contagem, nem a existência (`DEC-PHOME-20`). O `ETag` acompanha `analysis` quando presente e carrega a revisão do caso — o eco que o próximo comando exige.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o caso de análise vigente da ficha deste vínculo
StudentOnboardingAPI.getPersonalStudentAnamnesisAnalysis(studentId: studentId, acceptLanguage: acceptLanguage) { (response, error) in
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

[**PersonalStudentAnamnesisAnalysisView**](PersonalStudentAnamnesisAnalysisView.md)

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

Ler o conteúdo de uma versão da ficha deste vínculo

Conteúdo de **uma** versão concluída da ficha **deste vínculo**, relido e reautorizado a cada chamada pelo **mesmo predicado** de `getPersonalStudentAnamnesis` (`DEC-PHOME-19`): a versão é legível pelo aceite real do termo. Desde `DEC-PHOME-20` nenhuma versão de outra ficha é legível aqui, por nenhum caminho. O identificador opaco não concede acesso: versão inexistente, de outro aluno ou **de qualquer ficha que não a deste vínculo** respondem o **mesmo** `404 STUDENT_RESOURCE_NOT_FOUND`, sem confirmar existência, número ou data. Vínculo pausado ou encerrado é o `403` próprio. Rascunho nunca é legível aqui. Resposta `private, no-store`: depois de uma revogação, nenhuma releitura devolve o conteúdo antes autorizado. A seção `BODY_DATA` viaja somente com a autorização corporal efetiva do vínculo; sem ela a versão projetada a omite, sem flag, contagem nem marca de omissão.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let anamnesisVersionId = "anamnesisVersionId_example" // String | Versão pedida; identidade opaca, que não autoriza nada por si.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o conteúdo de uma versão da ficha deste vínculo
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

# **getPersonalStudentBodyAssessment**
```swift
    open class func getPersonalStudentBodyAssessment(studentId: String, assessmentId: String, relationshipId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: BodyAssessmentView?, _ error: Error?) -> Void)
```

Ler, como personal do vínculo, o registro profissional completo de uma avaliação

Leitura sem efeito colateral, reautorizada a cada chamada, do **registro profissional completo** de uma avaliação corporal deste vínculo (`DOC-STUDENT-JOURNEY-BODY-TECH` §4–§6): identidade, autor opaco, origem `PERSONAL_MEASURED`, `measuredOn` civil e `timeZone` originais, `recordedAt` UTC do servidor, método e procedência, números e cadeia de correção (`supersedesId`, `correctionReason`). O `ETag` desta resposta é o `revision` do registro e é o `If-Match` que `correctPersonalStudentBodyAssessment` exige sobre o predecessor — sempre o do **registro**, nunca o do vínculo nem o de uma coleção. `relationshipId` na query é **obrigatório** e precisa ser o vínculo atual do par: divergente é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`, e vínculo ou `assessmentId` que não alcançam este par respondem `404`, indistinguível de inexistente. A permissão é reavaliada: base retirada é `403 SHARING_GRANT_REQUIRED`, sem grant é `403 BODY_AUTHORIZATION_REQUIRED`, `PAUSED`/`ENDED` é `409 RELATIONSHIP_INACTIVE`, sem payload corporal. Resposta `private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo do personal autenticado.
let assessmentId = "assessmentId_example" // String | Registro profissional de avaliação corporal endereçado dentro do vínculo. ID que não alcança um registro **deste** vínculo e deste par responde `404`, indistinguível de inexistente — nenhuma resposta confirma avaliação de outro vínculo.
let relationshipId = "relationshipId_example" // String | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`; ID que não alcança um vínculo deste par é `404`, indistinguível de aluno inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler, como personal do vínculo, o registro profissional completo de uma avaliação
StudentOnboardingAPI.getPersonalStudentBodyAssessment(studentId: studentId, assessmentId: assessmentId, relationshipId: relationshipId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo do personal autenticado. |
 **assessmentId** | **String** | Registro profissional de avaliação corporal endereçado dentro do vínculo. ID que não alcança um registro **deste** vínculo e deste par responde &#x60;404&#x60;, indistinguível de inexistente — nenhuma resposta confirma avaliação de outro vínculo. |
 **relationshipId** | **String** | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é &#x60;409 ANAMNESIS_RELATIONSHIP_MISMATCH&#x60;; ID que não alcança um vínculo deste par é &#x60;404&#x60;, indistinguível de aluno inexistente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**BodyAssessmentView**](BodyAssessmentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentBodyAuthorization**
```swift
    open class func getPersonalStudentBodyAuthorization(studentId: String, relationshipId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentBodyAuthorizationView?, _ error: Error?) -> Void)
```

Ler, como personal do vínculo, a situação atual da autorização corporal do aluno

Leitura sem efeito colateral, autorizada somente ao personal do vínculo **ativo** com o aluno do path, e reautorizada a cada chamada (`DOC-STUDENT-JOURNEY-BODY-TECH` §2). Publica **somente a situação atual pertinente**: vínculo, scope `MANUAL_BODY_DATA`, `decision`, `effectiveAccess`, `revision`, `asOf` e a única ação permitida ao personal — `ADVISE_STUDENT`, orientar o aluno. O personal **não concede nem altera** esta autorização e nenhuma resposta daqui a presume: a escolha é ato exclusivo do aluno na rota dele. Nunca viajam `presentationId`, texto apresentado, digest, prova do ato, instante nem identidade do autor, e nenhum consentimento por outros pessoais. `relationshipId` na query é **obrigatório** e precisa ser o vínculo atual com o aluno do path — um vínculo anterior do mesmo par, ou qualquer ID divergente do resolvido, responde `409 ANAMNESIS_RELATIONSHIP_MISMATCH` e nada se resolve silenciosamente; ID que não alcança um vínculo deste par responde `404`, indistinguível de aluno inexistente ou de outra relação. Vínculo pausado é `403 RELATIONSHIP_PAUSED`, só vínculos encerrados é `403 RELATIONSHIP_INACTIVE` e a base de compartilhamento retirada é `403 SHARING_GRANT_REQUIRED` — o mesmo predicado da leitura da anamnese. Resposta `private, no-store`: nada fica em cache que restaure, depois de uma retirada, o que deixou de ser autorizado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo do personal autenticado.
let relationshipId = "relationshipId_example" // String | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`; ID que não alcança um vínculo deste par é `404`, indistinguível de aluno inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler, como personal do vínculo, a situação atual da autorização corporal do aluno
StudentOnboardingAPI.getPersonalStudentBodyAuthorization(studentId: studentId, relationshipId: relationshipId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo do personal autenticado. |
 **relationshipId** | **String** | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é &#x60;409 ANAMNESIS_RELATIONSHIP_MISMATCH&#x60;; ID que não alcança um vínculo deste par é &#x60;404&#x60;, indistinguível de aluno inexistente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentBodyAuthorizationView**](PersonalStudentBodyAuthorizationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentAnamnesisAnalysis**
```swift
    open class func getStudentAnamnesisAnalysis(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisAnalysisView?, _ error: Error?) -> Void)
```

Ler o caso de análise vigente do próprio aluno

Leitura protegida do caso de análise do **próprio** aluno, na moldura do vínculo atual (`DEC-PHOME-19` §5, `pliora-contracts#317`) — o destino protegido que o toque na pendência da Hoje relê antes de qualquer ato. O aluno lê o próprio caso **mesmo com o aceite de compartilhamento revogado**: o termo governa o acesso do personal, nunca o do titular — registro revogado só é lido pelo próprio aluno. A moldura continua sendo o vínculo atual: sem vínculo vigente, ou sem contexto de aluno, a resposta é `403`, nunca um caso solto de relação encerrada; vínculo pausado não esconde do aluno o que é dele. `analysis` ausente é **ausência confirmada** — não há caso vigente — e nunca indisponibilidade, credencial expirada ou recusa disfarçada. O recorte é o de `StudentAnamnesisAnalysisCase`, o mesmo publicado por `getStudentOnboarding`: estado, revisão e as perguntas com as próprias respostas — sem decisão projetada nem razão interna do personal; só em `NOT_RELEASED` o caso carrega `nextStep`, o próximo passo operacional que a pendência `VIEW_NEXT_STEP` manda abrir. O `ETag` acompanha `analysis` quando presente: é a revisão que `If-Match` ecoa ao responder à pergunta pendente.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o caso de análise vigente do próprio aluno
StudentOnboardingAPI.getStudentAnamnesisAnalysis(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentAnamnesisAnalysisView**](StudentAnamnesisAnalysisView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentAnamnesisAnalysisPending**
```swift
    open class func getStudentAnamnesisAnalysisPending(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentAnamnesisAnalysisPendingView?, _ error: Error?) -> Void)
```

Pendência mínima da análise de anamnese para a Hoje do aluno

A pendência mínima da análise para a Hoje (`DOC-STUDENT-HOME` §5.0, `DOC-STUDENT-HOME-TECH` §3.11, `pliora-contracts#317`) — leitura **nova e independente**, irmã das cinco projeções da Home do aluno e nunca parte do agregado reservado `getStudentToday`: nada aqui toca a sua rota, seus esquemas ou o seu grafo de `$ref`, que segue byte a byte idêntico. O servidor autentica o aluno, revalida o vínculo atual e devolve somente o sinal operacional: `asOf`, `state`, `nextAction` e `caseId` — este último só quando há destino autorizado, isto é, `state` diferente de `NO_PENDING`. `NO_PENDING` é **ausência confirmada**: não há caso vigente ou o caso encerrou (`RELEASED_FOR_NEW_PRESCRIPTION` ou `WITHDRAWN` saem da pendência atual e seus atos seguem no histórico protegido). Estado indeterminado é erro: `5xx`, nunca `NO_PENDING` enfeitado — falha de leitura não se apresenta como “sem pendências”. Sem vínculo vigente ou sem contexto de aluno é `403` e a região simplesmente não é exibida. Nenhum conteúdo viaja aqui: sem nome do personal, pergunta, resposta, item de triagem, condição, justificativa, tipo clínico de decisão, razão de bloqueio, contagem de versões nem prazo — esse material só existe no destino protegido. O `state`/`nextAction` anunciado reflete o estado do caso, **não uma concessão**: o toque na pendência ainda passa pela reautorização do próprio comando ou leitura protegida — aceite revogado ou vínculo pausado mantém o sinal legível para o titular e a recusa acontece no ato, nunca nesta projeção.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Pendência mínima da análise de anamnese para a Hoje do aluno
StudentOnboardingAPI.getStudentAnamnesisAnalysisPending(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentAnamnesisAnalysisPendingView**](StudentAnamnesisAnalysisPendingView.md)

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

# **getStudentBodyAssessment**
```swift
    open class func getStudentBodyAssessment(relationshipId: String, assessmentId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: BodyAssessmentView?, _ error: Error?) -> Void)
```

Ler, como aluno do vínculo, o registro profissional completo de uma avaliação

Leitura sem efeito colateral, reautorizada a cada chamada, do **registro profissional completo** de uma avaliação corporal deste vínculo (`DOC-STUDENT-JOURNEY-BODY-TECH` §4–§6): identidade, autor opaco, origem `PERSONAL_MEASURED`, `measuredOn` civil e `timeZone` originais, `recordedAt` UTC do servidor, método e procedência, os números medidos e a posição na cadeia de correção (`supersedesId`, `correctionReason`). Registro corrigido **permanece** na história e nunca é reescrito: a versão mais recente da cadeia convive com os originais imutáveis. `assessmentId` que não alcança registro deste vínculo responde `404`, indistinguível de inexistente — nenhum detalhe confirma registro de outro vínculo. A leitura de números reavalia a permissão atual: sem autorização corporal efetiva é `403 BODY_AUTHORIZATION_REQUIRED`; vínculo `PAUSED` ou `ENDED` é `409 RELATIONSHIP_INACTIVE`, sem payload corporal. O aluno não escreve registro profissional: esta resposta **não emite `ETag`** — nenhuma precondição de escrita se apoia nela. Resposta `private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let assessmentId = "assessmentId_example" // String | Registro profissional de avaliação corporal endereçado dentro do vínculo. ID que não alcança um registro **deste** vínculo e deste par responde `404`, indistinguível de inexistente — nenhuma resposta confirma avaliação de outro vínculo.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler, como aluno do vínculo, o registro profissional completo de uma avaliação
StudentOnboardingAPI.getStudentBodyAssessment(relationshipId: relationshipId, assessmentId: assessmentId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **assessmentId** | **String** | Registro profissional de avaliação corporal endereçado dentro do vínculo. ID que não alcança um registro **deste** vínculo e deste par responde &#x60;404&#x60;, indistinguível de inexistente — nenhuma resposta confirma avaliação de outro vínculo. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**BodyAssessmentView**](BodyAssessmentView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentBodyAuthorization**
```swift
    open class func getStudentBodyAuthorization(relationshipId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentBodyAuthorizationView?, _ error: Error?) -> Void)
```

Ler a autorização corporal específica do aluno neste vínculo

Estado da autorização corporal específica do aluno **deste vínculo**, no scope `MANUAL_BODY_DATA` (`DOC-STUDENT-JOURNEY-BODY-TECH` §2): a `decision` gravada, a `effectiveAccess` reavaliada pelo servidor a cada chamada e, quando há documento configurado para o scope, a `presentation` emitida para uma nova escolha — emitida a cada leitura, vinculada a esta conta, a este vínculo, ao scope e ao locale negociado, com validade **absoluta de 15 minutos** que nenhuma consulta prorroga. Versão, texto e digest do documento são escolhidos pelo servidor; a leitura não grava decisão nenhuma — só emite a apresentação oferecida. **Recurso separado do aceite do convite.** Os três `StudentConsentType` permanecem exatamente três e nenhum deles concede, revoga nem presume esta autorização; a escolha corporal nunca é lida de outro vínculo. `effectiveAccess` é `ALLOWED` somente com vínculo `ACTIVE`, relação e atores atuais, base de compartilhamento vigente e `decision` `GRANTED`; `UNAVAILABLE` significa ausência de documento configurado — não é `DECLINED` nem autorização presumida, e a UI não habilita escolha nesse estado. `revision` e o `ETag` desta resposta são o mesmo valor e são o `If-Match` que `setStudentBodyAuthorization` exige: o estado inicial `NOT_DECIDED` responde revisão `0` com `ETag` próprio, emitido aqui. Vínculo `PAUSED` responde `200` — a gestão da retirada continua nele — e `ENDED` responde `200` com o registro preservado e permissão `DENIED`: o que o encerramento não restaura é a coleta e a leitura de números, não o registro da escolha. Só a conta que é aluna **deste** vínculo lê; qualquer outra recebe `404`, indistinguível de inexistente.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler a autorização corporal específica do aluno neste vínculo
StudentOnboardingAPI.getStudentBodyAuthorization(relationshipId: relationshipId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentBodyAuthorizationView**](StudentBodyAuthorizationView.md)

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

# **grantPersonalStudentAnamnesisExemption**
```swift
    open class func grantPersonalStudentAnamnesisExemption(studentId: String, idempotencyKey: String, ifMatch: String, grantPersonalStudentAnamnesisExemptionRequest: GrantPersonalStudentAnamnesisExemptionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Assumir a responsabilidade profissional e liberar, com prova de step-up

Registra a decisão `PROFESSIONAL_WAIVER_GRANTED` (`DEC-PHOME-19` §5.3): o personal **assume a responsabilidade profissional** e libera o aluno para nova prescrição mesmo sem liberação médica — ato autônomo e distinto: dispensa **nunca** é parecer médico, nunca diz que o aluno está apto e nunca equivale a declaração de liberação médica. Exige `justification` obrigatória, `responsibilityAcknowledged` verdadeiro e a versão e o locale **exatos** do texto de responsabilidade apresentado e aceito (`responsibilityTextVersion`, `responsibilityTextLocale`) — versão ou locale que o servidor não aceita é `409 ANAMNESIS_RESPONSIBILITY_TEXT_NOT_ACCEPTED`, sem ato. É ato protegido por **step-up** (`pliora-contracts#315`): `stepUpProof` tem de ser prova válida de `PROFESSIONAL_WAIVER`, de uso único, vinculada a conta, sessão, `caseId`, versão e revisão esperadas e `mutationIntentId` deste pedido; prova ausente, divergente, expirada ou já consumida é `STEP_UP_PROOF_REQUIRED`, `STEP_UP_PROOF_MISMATCH`, `STEP_UP_PROOF_EXPIRED` ou `STEP_UP_PROOF_CONSUMED`, e a prova só é consumida **atomicamente** com o ato. O commit anexa `DECISION_RECORDED`, põe a decisão em vigor, o caso vira `RELEASED_FOR_NEW_PRESCRIPTION`, a prontidão vira `WAIVER_GRANTED` e a razão da análise sai da elegibilidade — liberando **só** prescrição nova. A dispensa é revogável por supersunção, **preservando** o ato no histórico. Exige o caso `AWAITING_PERSONAL` sem decisão em vigor — `NOT_RELEASED` pede reconsideração, nunca dispensa por cima, e caso reaberto que ainda carrega decisão em vigor é `409 ANAMNESIS_ANALYSIS_NOT_OPEN`; o caminho é a supersunção explícita — e `If-Match` com a revisão corrente, nunca `*`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem novo ato nem novo consumo; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let grantPersonalStudentAnamnesisExemptionRequest = GrantPersonalStudentAnamnesisExemptionRequest(relationshipId: "relationshipId_example", caseId: "caseId_example", justification: "justification_example", responsibilityAcknowledged: false, responsibilityTextVersion: "responsibilityTextVersion_example", responsibilityTextLocale: Locale(), mutationIntentId: "mutationIntentId_example", stepUpProof: "stepUpProof_example") // GrantPersonalStudentAnamnesisExemptionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Assumir a responsabilidade profissional e liberar, com prova de step-up
StudentOnboardingAPI.grantPersonalStudentAnamnesisExemption(studentId: studentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, grantPersonalStudentAnamnesisExemptionRequest: grantPersonalStudentAnamnesisExemptionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **grantPersonalStudentAnamnesisExemptionRequest** | [**GrantPersonalStudentAnamnesisExemptionRequest**](GrantPersonalStudentAnamnesisExemptionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentAnamnesisAnalysisActs**
```swift
    open class func listPersonalStudentAnamnesisAnalysisActs(studentId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisHistoryPage?, _ error: Error?) -> Void)
```

Histórico protegido dos atos de análise da ficha deste vínculo

O histórico do caso protegido para o personal autorizado (`DEC-PHOME-19` §5, `pliora-contracts#317`): **todos** os atos de **todos** os casos que a ficha deste vínculo já teve, do primeiro ao último — nada é reescrito, reordenado ou removido, e os atos marcados por supersunção permanecem. O predicado é o de `getPersonalStudentAnamnesisAnalysis`, revalidado nesta leitura: credencial e contexto de personal, vínculo `ACTIVE` com este `studentId` e base de acesso em vigor. A autorização é aplicada **antes** de selecionar, contar, ordenar e paginar, de modo que ato de outro vínculo não existe aqui por nenhum caminho — nem item, nem posição, nem cursor (`DEC-PHOME-20`). A ordem é total e do servidor: sequência de nascimento do caso na ficha, sequência de commit do ato dentro do caso e `actId` crescente como desempate final; o cliente não reordena nem infere posições. Paginação por cursor opaco com `limit` (padrão 20, máximo 100); `nextCursor` nulo encerra a coleção. O cursor só vale para esta operação, esta conta e este vínculo — cursor de outra audiência, de outro alvo ou adulterado é `422 VALIDATION_FAILED`, nunca uma página forjada. Lista vazia é ausência confirmada de atos na ficha deste vínculo, nunca erro nem indisponibilidade.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco devolvido por esta operação — emitido para esta conta e este vínculo, nunca reinterpretado pelo cliente. (optional)
let limit = 987 // Int | Tamanho máximo da página; padrão 20 e teto de 100 itens. (optional) (default to 20)

// Histórico protegido dos atos de análise da ficha deste vínculo
StudentOnboardingAPI.listPersonalStudentAnamnesisAnalysisActs(studentId: studentId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **cursor** | **String** | Cursor opaco devolvido por esta operação — emitido para esta conta e este vínculo, nunca reinterpretado pelo cliente. | [optional]
 **limit** | **Int** | Tamanho máximo da página; padrão 20 e teto de 100 itens. | [optional] [default to 20]

### Return type

[**PersonalStudentAnamnesisAnalysisHistoryPage**](PersonalStudentAnamnesisAnalysisHistoryPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentBodyAssessments**
```swift
    open class func listPersonalStudentBodyAssessments(studentId: String, relationshipId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: BodyAssessmentPage?, _ error: Error?) -> Void)
```

Ler, como personal do vínculo, o histórico de avaliações corporais registradas

Leitura sem efeito colateral, reautorizada a cada chamada, do histórico de **avaliações corporais profissionais** registradas pelo personal **neste vínculo** (`DOC-STUDENT-JOURNEY-BODY-TECH` §4–§6), autorizada somente ao personal do vínculo com o aluno do path. É uma coleção **própria da origem `PERSONAL_MEASURED`**: nunca é timeline unificada com a declaração do aluno — o histórico declarado é outra coleção, com leitura e cursor próprios, e nenhum dos dois empresta item ou continuação ao outro. A ordem é total e do servidor: `recordedAt` (UTC) **DESC** e `assessmentId` **DESC**; o `asOf` é capturado na primeira página e a seleção cobre somente registros publicados `<=asOf`, de modo que correção ou medição retrodatada posteriores ao corte não reescrevem o retrato antigo. Registros corrigidos **permanecem** na história, lidos pela cadeia de `supersedesId`. `relationshipId` na query é **obrigatório** e precisa ser o vínculo atual do par personal+aluno: um vínculo anterior do mesmo par, ou qualquer ID divergente do resolvido, responde `409 ANAMNESIS_RELATIONSHIP_MISMATCH` e nada se resolve silenciosamente; ID que não alcança um vínculo deste par responde `404`, indistinguível de aluno inexistente. A paginação é só por cursor opaco, `limit` 1–100 (padrão 20), `nextCursor` nulo na última página; o cursor autentica **ator + origem + vínculo + asOf + posição** com expiração **absoluta de 5 minutos** — origem, ator, vínculo ou coleção trocados, ou token adulterado, é `422 INVALID_CURSOR` **sem** `fieldErrors` e sem revelar qual vínculo falhou; expirado é `410 CURSOR_EXPIRED`. A permissão é reavaliada em cada página: base de compartilhamento retirada é `403 SHARING_GRANT_REQUIRED`, sem autorização corporal efetiva é `403 BODY_AUTHORIZATION_REQUIRED`, e vínculo `PAUSED` ou `ENDED` é `409 RELATIONSHIP_INACTIVE`, sem payload corporal — nenhum registro, contagem ou `total` revela o que a permissão não alcança. Resposta `private, no-store`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo do personal autenticado.
let relationshipId = "relationshipId_example" // String | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`; ID que não alcança um vínculo deste par é `404`, indistinguível de aluno inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior desta coleção; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele autentica ator, origem `PERSONAL_MEASURED`, vínculo, `asOf` e posição da leitura que o emitiu, com expiração absoluta de 5 minutos: cursor de outra origem, outro ator, outro vínculo ou outra coleção é `422 INVALID_CURSOR`, e expirado é `410 CURSOR_EXPIRED`. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. Valor fora da faixa é `422 VALIDATION_ERROR`, nunca clamp silencioso. (optional) (default to 20)

// Ler, como personal do vínculo, o histórico de avaliações corporais registradas
StudentOnboardingAPI.listPersonalStudentBodyAssessments(studentId: studentId, relationshipId: relationshipId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **studentId** | **String** | Aluno do vínculo do personal autenticado. |
 **relationshipId** | **String** | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é &#x60;409 ANAMNESIS_RELATIONSHIP_MISMATCH&#x60;; ID que não alcança um vínculo deste par é &#x60;404&#x60;, indistinguível de aluno inexistente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior desta coleção; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele autentica ator, origem &#x60;PERSONAL_MEASURED&#x60;, vínculo, &#x60;asOf&#x60; e posição da leitura que o emitiu, com expiração absoluta de 5 minutos: cursor de outra origem, outro ator, outro vínculo ou outra coleção é &#x60;422 INVALID_CURSOR&#x60;, e expirado é &#x60;410 CURSOR_EXPIRED&#x60;. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. Valor fora da faixa é &#x60;422 VALIDATION_ERROR&#x60;, nunca clamp silencioso. | [optional] [default to 20]

### Return type

[**BodyAssessmentPage**](BodyAssessmentPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentBodyDeclarations**
```swift
    open class func listPersonalStudentBodyDeclarations(studentId: String, relationshipId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentBodyDeclarationsPage?, _ error: Error?) -> Void)
```

Ler, como personal do vínculo, o histórico declarado do aluno

Histórico declarado autorizado do vínculo **atual** deste par (`DOC-STUDENT-JOURNEY-BODY-TECH` §3/§6): os mesmos itens de `listStudentBodyDeclarations` — um por versão integral concluída da ficha deste vínculo que levou `BODY_DATA` `PROVIDED`, com `anamnesisVersionId`, `versionNumber` integral, `recordId`, autor, origem `STUDENT_DECLARED`, `declaredOn`/`timeZone`, números e `completedAt`. Somente versões concluídas: **nenhuma indicação de rascunho** viaja — nem número, nem existência de edição em curso, nem `updatedAt` privado. `relationshipId` é **obrigatório** e precisa ser o vínculo atual do par: divergente é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`, e ID que não alcança vínculo deste par é `404`, indistinguível de aluno inexistente. **A leitura é reautorizada a cada página.** Exige vínculo `ACTIVE` — `PAUSED`/`ENDED` é `409 RELATIONSHIP_INACTIVE`, sem payload corporal —, base de compartilhamento vigente e autorização corporal efetiva `ALLOWED`: sem ela é `403 BODY_AUTHORIZATION_REQUIRED`, e a recusa não carrega item, contagem nem sinal de \"ocultos\" — uma declaração sem permissão de leitura simplesmente não integra a página. Retirada ou pausa entre páginas recusa a continuação da mesma forma: nenhum snapshot antigo serve conteúdo depois de perdida a permissão. **Ordenação e continuação.** Items por `completedAt` DESC e `anamnesisVersionId` DESC, com `asOf` capturado na primeira página — somente registros publicados `<= asOf`. O `cursor` é opaco e autenticado: liga ator, origem `STUDENT_DECLARED`, vínculo, `asOf`, posição e expiração absoluta de 300 segundos, nunca prorrogada; cursor de outra origem, coleção, ator ou vínculo é `422` com `INVALID_CURSOR` em `fieldErrors`, e expirado é `410 CURSOR_EXPIRED`, ambos sem página. `limit` de 1 a 100, padrão 20; fora da faixa é `422`, nunca clamp.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let relationshipId = "relationshipId_example" // String | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`; ID que não alcança um vínculo deste par é `404`, indistinguível de aluno inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação emitido por esta operação para esta leitura; nunca é offset nem dado a ser interpretado pelo cliente. Token de outra origem, coleção, ator ou vínculo, ou adulterado, é `422` com `INVALID_CURSOR`; a expiração absoluta de 300 segundos é `410`. (optional)
let limit = 987 // Int | Tamanho de página solicitado; o padrão é 20 e o máximo é 100. Fora da faixa é `422` com `fieldErrors` — nunca clamp silencioso. (optional) (default to 20)

// Ler, como personal do vínculo, o histórico declarado do aluno
StudentOnboardingAPI.listPersonalStudentBodyDeclarations(studentId: studentId, relationshipId: relationshipId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **relationshipId** | **String** | Vínculo que a leitura endereça — **obrigatório** e igual ao vínculo atual do par personal+aluno: o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Divergente do vínculo atual é &#x60;409 ANAMNESIS_RELATIONSHIP_MISMATCH&#x60;; ID que não alcança um vínculo deste par é &#x60;404&#x60;, indistinguível de aluno inexistente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco de continuação emitido por esta operação para esta leitura; nunca é offset nem dado a ser interpretado pelo cliente. Token de outra origem, coleção, ator ou vínculo, ou adulterado, é &#x60;422&#x60; com &#x60;INVALID_CURSOR&#x60;; a expiração absoluta de 300 segundos é &#x60;410&#x60;. | [optional]
 **limit** | **Int** | Tamanho de página solicitado; o padrão é 20 e o máximo é 100. Fora da faixa é &#x60;422&#x60; com &#x60;fieldErrors&#x60; — nunca clamp silencioso. | [optional] [default to 20]

### Return type

[**PersonalStudentBodyDeclarationsPage**](PersonalStudentBodyDeclarationsPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStudentAnamnesisAnalysisActs**
```swift
    open class func listStudentAnamnesisAnalysisActs(acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: StudentAnamnesisAnalysisHistoryPage?, _ error: Error?) -> Void)
```

Histórico protegido dos atos de análise do próprio aluno

O histórico protegido do próprio aluno (`DEC-PHOME-19` §5, `pliora-contracts#317`): todos os atos de todos os casos que a ficha do vínculo atual já teve, na mesma ordem total e com o mesmo cursor opaco da leitura do personal — sequência de nascimento do caso na ficha, sequência de commit do ato e `actId` como desempate — mas com o predicado do titular: o aluno lê o que é seu **mesmo com o aceite de compartilhamento revogado**, e nenhum ato de outro vínculo aparece ou move posição, contagem ou cursor aqui. Sem vínculo vigente é `403`; cursor de outra audiência, de outro alvo ou adulterado é `422 VALIDATION_FAILED`; página vazia é ausência confirmada, nunca erro disfarçado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco devolvido por esta operação — emitido para esta conta e este vínculo, nunca reinterpretado pelo cliente. (optional)
let limit = 987 // Int | Tamanho máximo da página; padrão 20 e teto de 100 itens. (optional) (default to 20)

// Histórico protegido dos atos de análise do próprio aluno
StudentOnboardingAPI.listStudentAnamnesisAnalysisActs(acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **cursor** | **String** | Cursor opaco devolvido por esta operação — emitido para esta conta e este vínculo, nunca reinterpretado pelo cliente. | [optional]
 **limit** | **Int** | Tamanho máximo da página; padrão 20 e teto de 100 itens. | [optional] [default to 20]

### Return type

[**StudentAnamnesisAnalysisHistoryPage**](StudentAnamnesisAnalysisHistoryPage.md)

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

O acervo do **próprio** aluno (`DEC-PHOME-19` §3.2): toda versão concluída de que a conta é autora, de qualquer ficha, com o vínculo em que nasceu, sem conteúdo. O aluno **conserva** este acervo ao trocar de personal (`DEC-PHOME-20`): ele nunca perde as próprias versões — o que deixou de existir é a possibilidade de apresentá-las a outro profissional. Ler não copia, não importa e não pré-preenche a ficha atual, e não concede nada a ninguém. O personal **nunca** recebe este acervo. A autoria é o predicado: qualquer conta autenticada lê o próprio acervo, com ou sem vínculo vigente, e uma conta que nunca concluiu recebe lista vazia. Não reabre leitura profissional de vínculo encerrado.

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

# **listStudentBodyAssessments**
```swift
    open class func listStudentBodyAssessments(relationshipId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: BodyAssessmentPage?, _ error: Error?) -> Void)
```

Ler o histórico próprio de avaliações corporais profissionais deste vínculo

Leitura sem efeito colateral, reautorizada a cada chamada, do histórico de **avaliações corporais profissionais** registradas **neste vínculo** (`DOC-STUDENT-JOURNEY-BODY-TECH` §4–§6), autorizada somente à conta que é aluna deste vínculo — qualquer outra recebe `404`, indistinguível de inexistente. É uma coleção **própria da origem `PERSONAL_MEASURED`**: nunca é timeline unificada com a declaração do aluno — o histórico declarado é outra coleção, com leitura e cursor próprios, e nenhum dos dois empresta item ou continuação ao outro. A ordem é total e do servidor: `recordedAt` (instante UTC de registro) **DESC** e `assessmentId` **DESC**; o `asOf` é capturado na primeira página e a seleção cobre somente registros publicados `<=asOf` — uma medição retrodatada ou uma correção posteriores ao corte entram só em leitura nova, e o retrato antigo não muda. Registros corrigidos **permanecem** na história: a cadeia de correção se lê por `supersedesId`, sem apagar o original. A paginação é só por cursor opaco, `limit` 1–100 (padrão 20), `nextCursor` nulo na última página; o cursor autentica **ator + origem + vínculo + asOf + posição** com expiração **absoluta de 5 minutos** que nenhuma página prorroga — cursor de outra origem, outro ator ou outro vínculo, adulterado ou de outra coleção é `422 INVALID_CURSOR`, opaco e sem revelar qual vínculo falhou; expirado é `410 CURSOR_EXPIRED` e a leitura recomeça. A leitura de números reavalia a permissão atual em cada página: sem autorização corporal efetiva deste vínculo é `403 BODY_AUTHORIZATION_REQUIRED`, e vínculo `PAUSED` ou `ENDED` é `409 RELATIONSHIP_INACTIVE`, **sem payload corporal** — nenhum registro, contagem ou `total` revela o que a permissão não alcança. Resposta `private, no-store`: nada fica em cache que restaure, depois de uma retirada, o que deixou de ser autorizado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior desta coleção; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele autentica ator, origem `PERSONAL_MEASURED`, vínculo, `asOf` e posição da leitura que o emitiu, com expiração absoluta de 5 minutos: cursor de outra origem, outro ator, outro vínculo ou outra coleção é `422 INVALID_CURSOR`, e expirado é `410 CURSOR_EXPIRED`. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. Valor fora da faixa é `422 VALIDATION_ERROR`, nunca clamp silencioso. (optional) (default to 20)

// Ler o histórico próprio de avaliações corporais profissionais deste vínculo
StudentOnboardingAPI.listStudentBodyAssessments(relationshipId: relationshipId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior desta coleção; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele autentica ator, origem &#x60;PERSONAL_MEASURED&#x60;, vínculo, &#x60;asOf&#x60; e posição da leitura que o emitiu, com expiração absoluta de 5 minutos: cursor de outra origem, outro ator, outro vínculo ou outra coleção é &#x60;422 INVALID_CURSOR&#x60;, e expirado é &#x60;410 CURSOR_EXPIRED&#x60;. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. Valor fora da faixa é &#x60;422 VALIDATION_ERROR&#x60;, nunca clamp silencioso. | [optional] [default to 20]

### Return type

[**BodyAssessmentPage**](BodyAssessmentPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStudentBodyDeclarations**
```swift
    open class func listStudentBodyDeclarations(relationshipId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: StudentBodyDeclarationsPage?, _ error: Error?) -> Void)
```

Ler o próprio histórico de declarações corporais por versão integral

Histórico declarado do **próprio** aluno sobre um vínculo seu (`DOC-STUDENT-JOURNEY-BODY-TECH` §3/§6): um item por versão integral concluída da ficha daquele vínculo que levou `BODY_DATA` `PROVIDED` — `anamnesisVersionId`, `versionNumber` integral da ficha, `recordId`, autor, origem `STUDENT_DECLARED`, `declaredOn`/`timeZone`, os números declarados e o `completedAt` do servidor. Não existe versão corporal paralela: a declaração é a seção congelada da versão integral, e `versionNumber` é o da ficha inteira. Versões `SKIPPED` ou sem a seção não geram item — declaração é número publicado, não a escolha de pular. **Somente versões concluídas.** Rascunho privado, edição em curso, `updatedAt` privado, campos digitados sem concluir e progresso nunca aparecem aqui — publicar é o commit da conclusão, não o salvar. `relationshipId` é **obrigatório** e endereça o vínculo dono do histórico; inexistente ou de outra conta é `404`, indistinguível. **Leitura corporal exige vínculo `ACTIVE`** (`DOC-STUDENT-JOURNEY-BODY-TECH` §7): `PAUSED` e `ENDED` respondem `409 RELATIONSHIP_INACTIVE`, sem página e sem payload corporal — o encerramento não reabre a leitura de números por rota direta, e o acervo funcional segue em `listStudentAnamnesisVersions`. **Ordenação e continuação.** Items por `completedAt` DESC e `anamnesisVersionId` DESC, com `asOf` capturado na primeira página: somente registros publicados `<= asOf` entram, e uma conclusão posterior pertence a leitura nova. O `cursor` é opaco e autenticado — liga ator, origem `STUDENT_DECLARED`, vínculo, `asOf`, posição e expiração absoluta de 300 segundos, nunca prorrogada; cursor de outra origem, ator, vínculo ou adulterado é `422` com `INVALID_CURSOR` em `fieldErrors`, e expirado é `410 CURSOR_EXPIRED`, ambos sem página. `limit` de 1 a 100, padrão 20; fora da faixa é `422`, nunca clamp. Lista vazia é ausência declarada, não indisponibilidade.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo dono do histórico declarado que a leitura endereça — **obrigatório**; o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Inexistente ou de outra conta é `404`, indistinguível.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação emitido por esta operação para esta leitura; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Liga ator, origem `STUDENT_DECLARED`, vínculo, `asOf`, posição e `expiresAt` — token de outro escopo ou adulterado é `422` com `INVALID_CURSOR`, e a expiração absoluta de 300 segundos é `410`. (optional)
let limit = 987 // Int | Tamanho de página solicitado; o padrão é 20 e o máximo é 100. Fora da faixa é `422` com `fieldErrors` — nunca clamp silencioso. (optional) (default to 20)

// Ler o próprio histórico de declarações corporais por versão integral
StudentOnboardingAPI.listStudentBodyDeclarations(relationshipId: relationshipId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **relationshipId** | **String** | Vínculo dono do histórico declarado que a leitura endereça — **obrigatório**; o servidor nunca resolve outro vínculo da mesma pessoa silenciosamente. Inexistente ou de outra conta é &#x60;404&#x60;, indistinguível. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco de continuação emitido por esta operação para esta leitura; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Liga ator, origem &#x60;STUDENT_DECLARED&#x60;, vínculo, &#x60;asOf&#x60;, posição e &#x60;expiresAt&#x60; — token de outro escopo ou adulterado é &#x60;422&#x60; com &#x60;INVALID_CURSOR&#x60;, e a expiração absoluta de 300 segundos é &#x60;410&#x60;. | [optional]
 **limit** | **Int** | Tamanho de página solicitado; o padrão é 20 e o máximo é 100. Fora da faixa é &#x60;422&#x60; com &#x60;fieldErrors&#x60; — nunca clamp silencioso. | [optional] [default to 20]

### Return type

[**StudentBodyDeclarationsPage**](StudentBodyDeclarationsPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **openPersonalStudentAnamnesisAnalysis**
```swift
    open class func openPersonalStudentAnamnesisAnalysis(studentId: String, idempotencyKey: String, openPersonalStudentAnamnesisAnalysisRequest: OpenPersonalStudentAnamnesisAnalysisRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Abrir o caso de análise da anamnese por exceção deste vínculo

Abre o **caso de análise** da ficha deste vínculo (`DEC-PHOME-19` §5): o agregado operacional que amarra aluno, vínculo ativo, versão concluída endereçada, revisão corrente, pergunta ativa e histórico imutável de atos — e que, sozinho, **não decide nada**: abrir ou perguntar nunca é decisão de aptidão, liberação ou dispensa. A origem fica registrada: `SCREENING_SIGNAL` quando a conclusão da ficha abriu o caso por sinal da triagem — resposta positiva na triagem de prontidão já nasce com caso aberto, sem ato do personal — ou `PERSONAL_INITIATIVE` quando o personal abre por iniciativa própria, com `reason` obrigatória. `targetAnamnesisVersionId` tem de nomear a **última versão concluída** do vínculo; outra versão é `409 ANAMNESIS_VERSION_NOT_CURRENT`. Vale **um caso vigente por vínculo**: pedir de novo com caso vigente é `409 ANAMNESIS_ANALYSIS_ALREADY_OPEN`, sem ato novo. O corpo pode já trazer a primeira pergunta em `clarification` — mesmas regras da rodada de esclarecimento (pergunta e razão obrigatórias) — e então o caso já nasce `AWAITING_STUDENT`; sem ela nasce `AWAITING_PERSONAL`. A revisão nasce `1` e volta como `ETag`/`analysis.revision`, guarda de todo comando seguinte — a abertura não declara `If-Match` porque não há revisão anterior para guardar. `relationshipId` diferente do vínculo ativo é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`. Sem rede não há caso aberto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let openPersonalStudentAnamnesisAnalysisRequest = OpenPersonalStudentAnamnesisAnalysisRequest(relationshipId: "relationshipId_example", targetAnamnesisVersionId: "targetAnamnesisVersionId_example", reason: "reason_example", clarification: AnamnesisAnalysisClarificationInput(question: "question_example", reason: "reason_example")) // OpenPersonalStudentAnamnesisAnalysisRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Abrir o caso de análise da anamnese por exceção deste vínculo
StudentOnboardingAPI.openPersonalStudentAnamnesisAnalysis(studentId: studentId, idempotencyKey: idempotencyKey, openPersonalStudentAnamnesisAnalysisRequest: openPersonalStudentAnamnesisAnalysisRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **openPersonalStudentAnamnesisAnalysisRequest** | [**OpenPersonalStudentAnamnesisAnalysisRequest**](OpenPersonalStudentAnamnesisAnalysisRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **refusePersonalStudentAnamnesisPrescription**
```swift
    open class func refusePersonalStudentAnamnesisPrescription(studentId: String, idempotencyKey: String, ifMatch: String, refusePersonalStudentAnamnesisPrescriptionRequest: RefusePersonalStudentAnamnesisPrescriptionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Registrar a decisão de não liberar nova prescrição neste vínculo

Registra a decisão profissional `NOT_RELEASED` (`DEC-PHOME-19` §5.3): o personal **não libera** o aluno para nova prescrição e informa o próximo passo operacional em `nextStep` — `REVIEW_LATER` ou `EXTERNAL_EVALUATION_REFERRAL` — que a leitura protegida, a fila e a notificação projetam. O commit anexa o ato `DECISION_RECORDED`, põe a decisão em vigor — substituindo uma decisão anterior em vigor, que fica no histórico — e o caso vira `NOT_RELEASED`. É decisão de **escopo**: segura somente a publicação de prescrição nova (`ANAMNESIS_ANALYSIS_PENDING` permanece na elegibilidade), nunca bloqueia o app, a ficha nem o treino já liberado, e **nunca** retira, apaga ou reescreve prescrição já publicada. Não é diagnóstico, não é parecer médico e não carrega prova de step-up — é ato de não liberação. Exige o caso `AWAITING_PERSONAL`: pergunta pendente é `409 ANAMNESIS_CLARIFICATION_AWAITING_ANSWER`, caso encerrado ou com decisão de não liberação em vigor é `409 ANAMNESIS_ANALYSIS_NOT_OPEN` — de `NOT_RELEASED` o caminho é reconsiderar a decisão, nunca decidir de novo por cima — e `caseId` diverso é `409 ANAMNESIS_ANALYSIS_CASE_MISMATCH`. `If-Match` carrega a revisão corrente, nunca `*`; divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem novo ato; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let refusePersonalStudentAnamnesisPrescriptionRequest = RefusePersonalStudentAnamnesisPrescriptionRequest(relationshipId: "relationshipId_example", caseId: "caseId_example", nextStep: AnamnesisAnalysisNextStep()) // RefusePersonalStudentAnamnesisPrescriptionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Registrar a decisão de não liberar nova prescrição neste vínculo
StudentOnboardingAPI.refusePersonalStudentAnamnesisPrescription(studentId: studentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, refusePersonalStudentAnamnesisPrescriptionRequest: refusePersonalStudentAnamnesisPrescriptionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **refusePersonalStudentAnamnesisPrescriptionRequest** | [**RefusePersonalStudentAnamnesisPrescriptionRequest**](RefusePersonalStudentAnamnesisPrescriptionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestPersonalStudentAnamnesisClarification**
```swift
    open class func requestPersonalStudentAnamnesisClarification(studentId: String, idempotencyKey: String, ifMatch: String, requestPersonalStudentAnamnesisClarificationRequest: RequestPersonalStudentAnamnesisClarificationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Perguntar esclarecimento ao aluno dentro do caso de análise vigente

Abre **uma** pergunta de esclarecimento dentro do caso vigente (`DEC-PHOME-19` §5.2): `question` e `reason` são obrigatórias, com teto de tamanho, e ficam preservadas verbatim como conteúdo autorado. Vale **uma pergunta ativa por caso**: perguntar com outra pendente é `409 ANAMNESIS_CLARIFICATION_AWAITING_ANSWER`. O commit anexa o ato imutável `CLARIFICATION_REQUESTED` ao histórico, move o caso para `AWAITING_STUDENT`, avança a `revision` em um e registra **exatamente uma** intenção durável de notificação na mesma transação — confirmar aqui é registro, nunca entrega ou leitura. Exige o caso vigente deste vínculo: sem caso é `409 ANAMNESIS_ANALYSIS_NOT_OPEN`, `caseId` de outro caso é `409 ANAMNESIS_ANALYSIS_CASE_MISMATCH` e `relationshipId` divergente é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`. Perguntar sobre caso `NOT_RELEASED` **reabre** o caso — volta a `AWAITING_STUDENT`, limpa `closedAt` e `nextStep` do caso — e **não** aposenta a decisão em vigor: ela permanece registrada e em vigor até supersunção explícita, e decidir de novo exige `AWAITING_PERSONAL` sem decisão em vigor. Perguntar **não é** decisão de aptidão, não confirma nem nega nada e não altera elegibilidade por si — `ANAMNESIS_ANALYSIS_PENDING` permanece. `If-Match` carrega a revisão corrente do caso — eco de uma leitura ou do comando anterior, nunca `*`: divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem nova pergunta nem nova intenção; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let requestPersonalStudentAnamnesisClarificationRequest = RequestPersonalStudentAnamnesisClarificationRequest(relationshipId: "relationshipId_example", caseId: "caseId_example", question: "question_example", reason: "reason_example") // RequestPersonalStudentAnamnesisClarificationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Perguntar esclarecimento ao aluno dentro do caso de análise vigente
StudentOnboardingAPI.requestPersonalStudentAnamnesisClarification(studentId: studentId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, requestPersonalStudentAnamnesisClarificationRequest: requestPersonalStudentAnamnesisClarificationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **requestPersonalStudentAnamnesisClarificationRequest** | [**RequestPersonalStudentAnamnesisClarificationRequest**](RequestPersonalStudentAnamnesisClarificationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
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

Grava uma seção da anamnese funcional no **rascunho privado** do aluno. Salvar **não** conclui, **não** cria versão e **não** notifica o personal; antes da primeira conclusão o personal vê somente o fato de haver anamnese em andamento. **Não existe `answers` genérico.** O corpo carrega `section`, um `oneOf` discriminado por `sectionKey`, e cada membro fecha o próprio conteúdo com `additionalProperties: false`: uma seção sem membro publicado não é aceita por este contrato. A escrita é compare-and-set: `If-Match` com a revisão do rascunho — publicada tanto em `anamnesis.draft.revision` quanto no `ETag` da leitura, que são o mesmo valor — é obrigatório e duas edições concorrentes **nunca** aplicam last-write-wins — a perdedora recebe `412 PRECONDITION_FAILED` e o rascunho do servidor permanece exatamente como estava. A seção de **triagem de prontidão** (`READINESS_SCREENING` e o seu desdobramento) tem base própria de segurança da prestação do serviço: ela **não** tem pré-condição de consentimento destacado e **não** existe família de erro de consentimento nesta operação. Uma resposta positiva na triagem **não** impede continuar nem concluir; ela altera apenas a prontidão e a elegibilidade para prescrição. O contrato publica apenas a **chave** de cada pergunta do instrumento e a versão aplicada; a redação licenciada do instrumento não trafega por este contrato. **Ficha do vínculo atual (`DEC-PHOME-19`).** O corpo repete `relationshipId`, o vínculo dono da ficha lida (`anamnesis.relationshipId`): se o vínculo foi trocado ou encerrado depois da leitura, a escrita é `409 ANAMNESIS_RELATIONSHIP_MISMATCH` e nada é gravado — nem na ficha antiga, nem na nova. A revisão do rascunho não basta para isso, porque cada ficha tem a sua. Vínculo pausado aceita a escrita; vínculo encerrado congela a ficha (`403 RELATIONSHIP_INACTIVE`). Uma edição depois da conclusão continua privada: o personal não vê sequer que ela existe. A repetição com a mesma `Idempotency-Key` reautoriza o vínculo antes de devolver o resultado guardado. **Seção `BODY_DATA` (opcional, `DOC-STUDENT-JOURNEY-BODY-TECH` §3).** A escrita de `PROVIDED` **com ao menos um número** exige autorização corporal efetiva atual (`effectiveAccess` `ALLOWED` do scope `MANUAL_BODY_DATA` sobre vínculo `ACTIVE`): sem ela é `403 BODY_AUTHORIZATION_REQUIRED`, e com o vínculo `PAUSED` é `409 RELATIONSHIP_INACTIVE` — a coleta numérica para, sem payload corporal na recusa. `SKIPPED` e a limpeza explícita dos números do rascunho **continuam permitidos** ao aluno do vínculo atual mesmo em `PAUSED` ou sem autorização corporal: o guard incide sobre gravar números, nunca sobre pular ou descartar esses campos para prosseguir funcionalmente. `ENDED` congela a ficha inteira pelo `403 RELATIONSHIP_INACTIVE` já publicado. A escolha de autorização não viaja neste payload e nunca é inferida de `PROVIDED` — ela vive em `getStudentBodyAuthorization`/`setStudentBodyAuthorization`. Salvar continua alterando somente o rascunho privado: nenhum número é publicado aqui.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let sectionKey = StudentAnamnesisSectionKey() // StudentAnamnesisSectionKey | Seção endereçada. `PUT` substitui **somente** esta seção do rascunho; as demais permanecem exatamente como estavam. O `sectionKey` do corpo seleciona o membro tipado do `oneOf` e precisa ser igual a este segmento: divergir é `422 ANAMNESIS_SECTION_KEY_MISMATCH`, nunca escrita na seção errada.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let saveStudentAnamnesisSectionRequest = SaveStudentAnamnesisSectionRequest(relationshipId: "relationshipId_example", section: StudentAnamnesisSection(sectionKey: "sectionKey_example", primaryGoal: StudentTrainingGoal(), otherGoal: "otherGoal_example", secondaryGoals: [nil], otherSecondaryGoal: "otherSecondaryGoal_example", expectedTimeframe: StudentGoalTimeframe(), instrumentVersion: "instrumentVersion_example", answers: [StudentReadinessScreeningAnswer(questionKey: StudentReadinessQuestionKey(), answer: "answer_example")], followUps: [StudentReadinessFollowUp(questionKey: nil, conditionDescription: "conditionDescription_example", controlled: false, underMedicalGuidance: false)], injuriesAndSurgeries: [StudentAnamnesisHistoryEntry(description: "description_example", occurredOn: Date())], currentLimitations: [StudentAnamnesisBodyRegionLimitation(bodyRegion: StudentBodyRegion(), intensity: "intensity_example", notes: "notes_example")], reportedConditions: [nil], medicationsInUse: [StudentAnamnesisMedicationEntry(name: "name_example", purpose: "purpose_example")], previousExperience: StudentTrainingExperience(), availableDaysPerWeek: 123, sessionDuration: DurationMinutesRange(minimum: 123, maximum: 123), trainingLocation: StudentTrainingLocation(), otherTrainingLocation: "otherTrainingLocation_example", availableEquipment: [StudentAvailableEquipment()], preferredTimeOfDay: StudentPreferredTimeOfDay(), choice: "choice_example", weightKg: 123, heightCm: 123, declaredOn: Date(), timeZone: "timeZone_example")) // SaveStudentAnamnesisSectionRequest |
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

Registra a **escolha explícita** do personal, com autoria, vínculo, instante do servidor e revisão nova (`DEC-PHOME-19` §5, resposta A). **Somente novas liberações:** ligada, e enquanto a ficha deste vínculo não estiver concluída, `publishPersonalPrescriptionDraft`, `assignPersonalStudentWorkout` e `activatePersonalStudentPlan` recusam com `409 STUDENT_NOT_ELIGIBLE` e `ANAMNESIS_NOT_COMPLETED`, avaliado pelo servidor no mesmo ponto transacional da ação, sem confiar em leitura anterior do app — e também `updatePersonalStudentPlanActivation`, que troca a programação a partir de hoje. Nada já liberado é retirado, despublicado, suspenso ou bloqueado; iniciar, retomar ou concluir treino já liberado e sessão em andamento nunca são recusados por ela. Cada escolha fica num histórico **append-only** (autor, vínculo, instante, revisão); esta operação e a leitura publicam a vigente. Desligar retira **somente** esse motivo: prontidão, idade, vínculo e os demais portões continuam. A escolha não dispensa a ficha, que continua obrigatória como processo, não concede acesso a respostas e não muda `DEC-CONV-9`. Conclusão de outro vínculo, aceite do termo e reconhecimento de revisão não satisfazem a condição. **Compare-and-set:** `If-Match` ecoa `revision` lida em `getPersonalStudentAnamnesisControls`; revisão velha é `412 PRECONDITION_FAILED`, sem gravar e sem mesclar. `relationshipId` diferente do vínculo ativo — inclusive um vínculo anterior com o mesmo aluno — é `409 ANAMNESIS_RELATIONSHIP_MISMATCH`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado, sem novo ato, **depois** de reautorizar o vínculo: perdida a autorização, a repetição recebe a recusa corrente, nunca a resposta antiga. Outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`. Sem rede não há escolha confirmada.

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

# **setStudentBodyAuthorization**
```swift
    open class func setStudentBodyAuthorization(relationshipId: String, idempotencyKey: String, ifMatch: String, setStudentBodyAuthorizationRequest: SetStudentBodyAuthorizationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentBodyAuthorizationView?, _ error: Error?) -> Void)
```

Registrar a escolha explícita do aluno sobre dados corporais manuais

Grava a escolha explícita do aluno deste vínculo sobre o scope `MANUAL_BODY_DATA` (`DOC-STUDENT-JOURNEY-BODY-TECH` §2). O corpo fecha com `relationshipId`, `scope` e `decision` — `GRANTED` ou `DECLINED`, porque `NOT_DECIDED` é o **estado inicial**, nunca um ato que se escreve. `GRANTED` exige o `presentationId` de uma apresentação emitida por `getStudentBodyAuthorization` à mesma conta, vínculo, scope e locale, ainda válida e do documento ainda aceitável: ausente ou desconhecida responde `409 BODY_AUTHORIZATION_DOCUMENT_UNAVAILABLE`; apresentação expirada, superada ou de vínculo, scope, locale ou documento diverso responde `409 BODY_AUTHORIZATION_PRESENTATION_CHANGED` — texto atualizado exige nova leitura e nova escolha explícita, **nunca grant presumido**. `DECLINED` não exige documento novo: ninguém precisa aceitar texto para retirar acesso. `Idempotency-Key` é obrigatória, escopada a ator+vínculo+operação, e `If-Match` carrega o `ETag` **deste recurso** — nunca o do vínculo nem o do rascunho da anamnese —; ausente, vazio ou `*` é `428 PRECONDITION_REQUIRED`, divergente é `412 PRECONDITION_FAILED` com `currentRevision`. A repetição confirmada é reautorizada no estado atual antes de devolver o resultado guardado, e uma retirada que obteve o lock antes vence uma escrita concorrente. `GRANTED` exige vínculo `ACTIVE`; `DECLINED` continua possível em `PAUSED`; vínculo `ENDED` não recebe ato nenhum — fora de `ACTIVE` a concessão e qualquer escrita em `ENDED` respondem `409 RELATIONSHIP_INACTIVE`. O corpo não recebe `authorId`, `acceptedAt`, texto nem digest do documento: autor e instante são do servidor, e campo forjado é `422`. O personal nunca escreve aqui: esta rota é só do aluno do vínculo. Nenhum grant importa ficha, prova ou avaliação de outro vínculo.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let relationshipId = "relationshipId_example" // String | Vínculo endereçado, o mesmo `relationshipId` da carteira (personal) ou de `getStudentRelationship` (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde `404 RELATIONSHIP_NOT_FOUND`, indistinguível de inexistente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` exato da **autorização corporal específica** deste vínculo — o mesmo valor de `revision` emitido por `getStudentBodyAuthorization` ou pelo último `setStudentBodyAuthorization`, enviado verbatim. Não é o `ETag` do vínculo nem o do rascunho da anamnese, e nunca se deriva de `revision`. O curinga `*` não é elegível — quem nunca leu o recurso também o enviaria, e derrubaria a precondição —; ausente, vazio ou `*` é `428 PRECONDITION_REQUIRED` e divergente é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let setStudentBodyAuthorizationRequest = SetStudentBodyAuthorizationRequest(relationshipId: "relationshipId_example", scope: BodyAuthorizationScope(), decision: StudentConsentDecision(), presentationId: "presentationId_example") // SetStudentBodyAuthorizationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Registrar a escolha explícita do aluno sobre dados corporais manuais
StudentOnboardingAPI.setStudentBodyAuthorization(relationshipId: relationshipId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, setStudentBodyAuthorizationRequest: setStudentBodyAuthorizationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **relationshipId** | **String** | Vínculo endereçado, o mesmo &#x60;relationshipId&#x60; da carteira (personal) ou de &#x60;getStudentRelationship&#x60; (aluno). Vínculo inexistente, alheio ou de que a conta só é parte no outro papel responde &#x60;404 RELATIONSHIP_NOT_FOUND&#x60;, indistinguível de inexistente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | &#x60;ETag&#x60; exato da **autorização corporal específica** deste vínculo — o mesmo valor de &#x60;revision&#x60; emitido por &#x60;getStudentBodyAuthorization&#x60; ou pelo último &#x60;setStudentBodyAuthorization&#x60;, enviado verbatim. Não é o &#x60;ETag&#x60; do vínculo nem o do rascunho da anamnese, e nunca se deriva de &#x60;revision&#x60;. O curinga &#x60;*&#x60; não é elegível — quem nunca leu o recurso também o enviaria, e derrubaria a precondição —; ausente, vazio ou &#x60;*&#x60; é &#x60;428 PRECONDITION_REQUIRED&#x60; e divergente é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **setStudentBodyAuthorizationRequest** | [**SetStudentBodyAuthorizationRequest**](SetStudentBodyAuthorizationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentBodyAuthorizationView**](StudentBodyAuthorizationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **supersedePersonalStudentAnamnesisDecision**
```swift
    open class func supersedePersonalStudentAnamnesisDecision(studentId: String, decisionId: String, idempotencyKey: String, ifMatch: String, supersedePersonalStudentAnamnesisDecisionRequest: SupersedePersonalStudentAnamnesisDecisionRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Revogar, reconsiderar ou corrigir a decisão em vigor do caso

Substitui a decisão **em vigor** por outro ato — nunca reescreve o que já foi gravado (`DEC-PHOME-19` §5.3): `kind` escolhe o desfecho. `REVOKED` vale **somente** para `PROFESSIONAL_WAIVER_GRANTED`: revoga a dispensa — com `correction.justification` obrigatória — e o caso volta a `AWAITING_PERSONAL`, com a razão `ANAMNESIS_ANALYSIS_PENDING` de volta na elegibilidade e a prontidão de volta a `AWAITING_MEDICAL_CLEARANCE`. `RECONSIDERED` retira a decisão em vigor sem substituta e também devolve o caso a `AWAITING_PERSONAL`. `CORRECTED` registra nova decisão do **mesmo** tipo com conteúdo retificado em `correction` — corrigir uma decisão protegida (`MEDICAL_CLEARANCE_DECLARED`, `PROFESSIONAL_WAIVER_GRANTED`) consome nova prova de step-up da finalidade correspondente; corrigir decisão não protegida não exige prova. `decisionId` tem de nomear a decisão em vigor do caso: decisão já substituída ou de outro caso é `409 ANAMNESIS_DECISION_NOT_IN_FORCE`, e `decisionId` desconhecido é `404`. Pergunta de esclarecimento ainda pendente é `409 ANAMNESIS_CLARIFICATION_AWAITING_ANSWER`: a supersunção espera a resposta do aluno ou a retirada da pergunta — que encerra o caso —, nunca grava uma decisão nova com pergunta órfã em aberto. A decisão substituída permanece no histórico com `supersededAt`, `supersededByDecisionId` e `supersessionKind` — correção de declaração é ato próprio e audível, nunca confundida com revogação nem com decisão nova de mérito. `If-Match` carrega a revisão corrente do caso, nunca `*`; divergência é `412 PRECONDITION_FAILED` com `currentRevision`. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem novo ato nem novo consumo de prova; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let decisionId = "decisionId_example" // String | Decisão em vigor do caso a ser substituída.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let supersedePersonalStudentAnamnesisDecisionRequest = SupersedePersonalStudentAnamnesisDecisionRequest(relationshipId: "relationshipId_example", caseId: "caseId_example", kind: AnamnesisAnalysisSupersessionKind(), correction: AnamnesisAnalysisDecisionCorrection(nextStep: AnamnesisAnalysisNextStep(), conditionSummary: "conditionSummary_example", justification: "justification_example", responsibilityAcknowledged: false, responsibilityTextVersion: "responsibilityTextVersion_example", responsibilityTextLocale: Locale(), correctedAnamnesisVersionId: "correctedAnamnesisVersionId_example"), mutationIntentId: "mutationIntentId_example", stepUpProof: "stepUpProof_example") // SupersedePersonalStudentAnamnesisDecisionRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Revogar, reconsiderar ou corrigir a decisão em vigor do caso
StudentOnboardingAPI.supersedePersonalStudentAnamnesisDecision(studentId: studentId, decisionId: decisionId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, supersedePersonalStudentAnamnesisDecisionRequest: supersedePersonalStudentAnamnesisDecisionRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **decisionId** | **String** | Decisão em vigor do caso a ser substituída. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **supersedePersonalStudentAnamnesisDecisionRequest** | [**SupersedePersonalStudentAnamnesisDecisionRequest**](SupersedePersonalStudentAnamnesisDecisionRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **withdrawPersonalStudentAnamnesisClarification**
```swift
    open class func withdrawPersonalStudentAnamnesisClarification(studentId: String, clarificationRequestId: String, idempotencyKey: String, ifMatch: String, withdrawPersonalStudentAnamnesisClarificationRequest: WithdrawPersonalStudentAnamnesisClarificationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentAnamnesisAnalysisOutcome?, _ error: Error?) -> Void)
```

Retirar a pergunta pendente e encerrar o caso sem decisão de mérito

Retira a pergunta **ainda pendente** e encerra o caso **sem decisão de mérito** (`DEC-PHOME-19` §5.2): o commit anexa o ato imutável `CLARIFICATION_WITHDRAWN`, marca a pergunta como retirada — nunca como respondida — e o caso vira `WITHDRAWN`. A retirada remove **só** o motivo que ela sustentava: a razão `ANAMNESIS_ANALYSIS_PENDING` sai da elegibilidade neste mesmo commit, enquanto qualquer outra razão continua lá — uma retirada nunca é `approved`, nunca é dispensa e nunca é declaração de parecer médico. Uma pergunta já respondida não pode ser retirada: `409 ANAMNESIS_CLARIFICATION_NOT_PENDING`. Caso encerrado e reaberto depois por supersunção é episódio novo, preservado no histórico. `If-Match` carrega a revisão corrente do caso, nunca `*`; divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato. Corrida com a resposta do aluno é decidida pelo compare-and-set — o perdedor recebe `412` e, relendo, encontra a pergunta já respondida ou retirada. **Repetição:** a mesma `Idempotency-Key` com o mesmo corpo devolve o resultado guardado depois de reautorizar o vínculo, sem novo ato; outro corpo com a mesma chave é `409 IDEMPOTENCY_CONFLICT`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentId = "studentId_example" // String | Aluno do vínculo ativo do personal autenticado.
let clarificationRequestId = "clarificationRequestId_example" // String | Pergunta ainda pendente do caso vigente.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | `ETag` do caso de análise — eco de `analysis.revision` da última leitura ou resposta de comando; nunca `*`. Divergência é `412 PRECONDITION_FAILED` com `currentRevision`, sem ato gravado.
let withdrawPersonalStudentAnamnesisClarificationRequest = WithdrawPersonalStudentAnamnesisClarificationRequest(relationshipId: "relationshipId_example", caseId: "caseId_example") // WithdrawPersonalStudentAnamnesisClarificationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Retirar a pergunta pendente e encerrar o caso sem decisão de mérito
StudentOnboardingAPI.withdrawPersonalStudentAnamnesisClarification(studentId: studentId, clarificationRequestId: clarificationRequestId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, withdrawPersonalStudentAnamnesisClarificationRequest: withdrawPersonalStudentAnamnesisClarificationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **clarificationRequestId** | **String** | Pergunta ainda pendente do caso vigente. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | &#x60;ETag&#x60; do caso de análise — eco de &#x60;analysis.revision&#x60; da última leitura ou resposta de comando; nunca &#x60;*&#x60;. Divergência é &#x60;412 PRECONDITION_FAILED&#x60; com &#x60;currentRevision&#x60;, sem ato gravado. |
 **withdrawPersonalStudentAnamnesisClarificationRequest** | [**WithdrawPersonalStudentAnamnesisClarificationRequest**](WithdrawPersonalStudentAnamnesisClarificationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentAnamnesisAnalysisOutcome**](PersonalStudentAnamnesisAnalysisOutcome.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
