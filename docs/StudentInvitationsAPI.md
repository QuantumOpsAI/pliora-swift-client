# StudentInvitationsAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptStudentInvitation**](StudentInvitationsAPI.md#acceptstudentinvitation) | **POST** /student-invitations/accept | Confirmar o aceite do convite — a única transação que cria ou troca o vínculo
[**createPersonalStudentInvitation**](StudentInvitationsAPI.md#createpersonalstudentinvitation) | **POST** /personal/student-invitations | Criar um convite de aluno pelo personal
[**declineStudentInvitation**](StudentInvitationsAPI.md#declinestudentinvitation) | **POST** /student-invitations/decline | Recusar um convite de aluno
[**getPersonalStudentInvitationDetails**](StudentInvitationsAPI.md#getpersonalstudentinvitationdetails) | **GET** /personal/student-invitations/{invitationId} | Ler detalhes do convite do próprio personal
[**getPersonalStudentInvitationShareLink**](StudentInvitationsAPI.md#getpersonalstudentinvitationsharelink) | **GET** /personal/student-invitations/{invitationId}/share-link | Copiar o mesmo link do convite
[**getStudentInvitationAcceptanceContext**](StudentInvitationsAPI.md#getstudentinvitationacceptancecontext) | **POST** /student-invitations/acceptance-context | Ler o contexto autenticado que precede o aceite do convite
[**listPersonalStudentInvitationActivity**](StudentInvitationsAPI.md#listpersonalstudentinvitationactivity) | **GET** /personal/student-invitations/{invitationId}/activity | Ler histórico operacional do convite do próprio personal
[**listPersonalStudentInvitations**](StudentInvitationsAPI.md#listpersonalstudentinvitations) | **GET** /personal/student-invitations | Listar convites de aluno emitidos pelo personal
[**removePersonalStudentInvitation**](StudentInvitationsAPI.md#removepersonalstudentinvitation) | **POST** /personal/student-invitations/{invitationId}/removal | Excluir convite deliberadamente
[**renewPersonalStudentInvitation**](StudentInvitationsAPI.md#renewpersonalstudentinvitation) | **POST** /personal/student-invitations/{invitationId}/renewal | Renovar ou alterar validade do mesmo convite
[**resendPersonalStudentInvitation**](StudentInvitationsAPI.md#resendpersonalstudentinvitation) | **POST** /personal/student-invitations/{invitationId}/resend | Reenviar o mesmo convite
[**resolveStudentInvitation**](StudentInvitationsAPI.md#resolvestudentinvitation) | **POST** /student-invitations/resolve | Resolver um convite de aluno por credencial curta de jornada
[**startInvitationEmailOwnershipChallenge**](StudentInvitationsAPI.md#startinvitationemailownershipchallenge) | **POST** /student-invitations/email-ownership-challenges | Emitir o código de posse do endereço convidado, no escopo daquele convite
[**verifyInvitationEmailOwnershipChallenge**](StudentInvitationsAPI.md#verifyinvitationemailownershipchallenge) | **POST** /student-invitations/email-ownership-challenges/{challengeId}/verification | Verificar o código de posse do endereço convidado


# **acceptStudentInvitation**
```swift
    open class func acceptStudentInvitation(idempotencyKey: String, ifMatch: String, acceptStudentInvitationRequest: AcceptStudentInvitationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentInvitationAcceptanceView?, _ error: Error?) -> Void)
```

Confirmar o aceite do convite — a única transação que cria ou troca o vínculo

**É a única confirmação final da sequência de entrada, e uma única transação.** De forma indivisível ela valida a prova de posse do endereço convidado quando houve divergência, valida a elegibilidade de idade 18+, grava as decisões de privacidade com a versão do servidor, grava os grants de compartilhamento item a item, encerra o vínculo anterior quando existe, congela os treinos futuros do personal anterior, cria a relação e consome o convite. **Qualquer falha desfaz tudo:** nenhuma decisão fica gravada, o vínculo anterior **permanece ativo** e o convite permanece **não consumido**. Não existe resultado parcial nem ordem de execução em que a pessoa fique sem vínculo. **A relação não nasce antes daqui.** Resolver o convite, autenticar, ler o contexto pré-aceite, provar a posse do e-mail e declarar intenção de aceitar não criam relação, consentimento nem capacidade de aluno. **`If-Match` é obrigatório e ecoa `revision` do contexto pré-aceite.** É o que vincula a confirmação ao catálogo apresentado: quem não chamou `getStudentInvitationAcceptanceContext` não tem o valor. Revisão defasada — porque o catálogo mudou, porque a exigência de idade mudou ou porque o contexto se moveu — é `412 PRIVACY_CONTEXT_STALE`, e a releitura é obrigatória. **Consentimento é decisão explícita por item, nunca uma lista de aceites.** O cliente envia `GRANTED` ou `DECLINED` para **cada** item do catálogo que o contexto serviu, com a `documentVersion` que lhe foi apresentada; cobrir o catálogo parcialmente é `422 PRIVACY_DECISIONS_INCOMPLETE`. A **versão aceita é a efetivamente apresentada pelo servidor**, ecoada pelo cliente — que não propõe versão, texto nem catálogo —: versão diferente da apresentada, ou que deixou de poder ser aceita, é `412 PRIVACY_CONTEXT_STALE`, e a pessoa recebe nova apresentação e faz novo ato; nunca se consente em silêncio outra versão. Tipo fora do catálogo recusa o pedido inteiro com `422 VALIDATION_ERROR`, sem efeito nenhum. **Aceite real obrigatório (`DEC-PHOME-19` §3.1).** `SHARE_DATA_WITH_PERSONAL` (`acceptanceRequired: true`) exige `GRANTED`; recusá-lo é `403 CONSENT_REQUIRED`, sem vínculo, sem consumo do convite e sem encerramento do vínculo anterior. O aceite é gravado **no mesmo commit** do vínculo, com o aluno como autor, o vínculo e o personal destinatários, o tipo, a versão, o texto localizado exato apresentado e o SHA-256 dele, o locale e o instante do servidor — recuperáveis em `getStudentAnamnesisConsent` — e é ele que autoriza o personal deste vínculo a ler as versões concluídas da ficha deste vínculo. Não há quarto termo, controle pré-marcado nem alternância posterior desse acesso, e ter aceito em outro vínculo não substitui o ato deste. **O vínculo nasce com a sua ficha de anamnese vazia e obrigatória**, inclusive com o mesmo personal de um vínculo anterior: nada é copiado, importado ou pré-preenchido, e o aceite nunca conclui a ficha. Falha de rede não é recusa nem aceite. **Os grants de compartilhamento são opt-in e nascem desmarcados.** Eles só existem quando há troca, pertencem ao catálogo **fechado** de quatro categorias e são grant de **leitura**: autorizar não copia o fato, não reatribui autoria, não muda procedência e não cria segunda cópia. A configuração de coleta do personal anterior **nunca** é herdada. **A anamnese não é categoria de compartilhamento** (`DEC-PHOME-19`): a antiga `HEALTH_FORM` foi removida do catálogo; e desde `DEC-PHOME-20` versões de vínculos anteriores **não chegam ao personal novo por nenhum caminho** — não existe autorização de anteriores, no aceite nem depois. **Troca é explícita.** Havendo vínculo ativo, `replacement.confirmed` é obrigatório e `replacement.relationshipId` tem de ser o vínculo que o contexto publicou; sem a confirmação a resposta é `403 ACTIVE_RELATIONSHIP_CONFIRMATION_REQUIRED`, e se o vínculo ativo deixou de ser aquele a resposta é `409 ACTIVE_RELATIONSHIP_CHANGED`. **O nome do aluno é pré-condição do vínculo** (`DEC-PHOME-6`). Enquanto o perfil do aluno não tem nome — o que o passo `STUDENT_PROFILE_NAME` do onboarding resolve com `saveStudentProfile` antes do aceite —, o commit é recusado com `409 INVALID_ONBOARDING_TRANSITION` e `blockingStepKey: STUDENT_PROFILE_NAME`, no molde da recusa do perfil do personal: nada é gravado, nenhum vínculo nasce nem é trocado e o convite permanece **não consumido**; a pessoa informa o nome e refaz o aceite. A recusa nomeia o passo que falta e nunca carrega o nome. **Precedência:** todas as recusas já publicadas nesta operação (`401`, `403`, `404`, `409` dos demais códigos, `410`, `412` e `422`) são avaliadas **antes**; a falta de nome é a **última** verificação antes do commit, de modo que ela só aparece quando o resto do aceite estaria válido. É escolha técnica deste contrato, registrada porque os documentos são silentes sobre a ordem. **Idade é decidida pelo servidor.** Nenhum cliente compara datas, embute idade-limite ou conclui elegibilidade. Quando o contexto pediu prova adicional, a data de nascimento declarada viaja em `ageAssurance` como **evidência**, nunca como veredito. Sinal faltante, inconclusivo ou divergente é `403 AGE_ASSURANCE_REQUIRED`, falha recuperável; menor de 18 no release inicial é `403 AGE_NOT_ELIGIBLE`, terminal para aquele aceite. Nenhum dos dois consome o convite nem altera vínculo algum, e o personal nunca vê o motivo. **O token portador é obrigatório** e é o que prova a posse do convite. `invitationId` é **conferência cruzada opcional**: quando enviado precisa ser o convite daquele token, e divergir responde `404 INVITATION_NOT_FOUND`, exatamente como um token desconhecido — a resposta nunca confirma a existência do convite alheio. **Um convite por chamada.** A operação aceita exatamente o convite do token recebido: não varre convites pendentes e não aceita nenhum outro em cascata. **Convite inexistente, expirado, revogado, recusado ou já consumido não cria contexto de aluno**: `404`, `409` e `410` não criam relação, consentimento nem capacidade, e nenhum deles é um aceite parcial. Uma **falha de dependência** responde `500 INTERNAL_ERROR` e **nunca** `404 INVITATION_NOT_FOUND`: indisponibilidade não é ausência de convite. **Nenhuma recusa desta operação nomeia a categoria ou o termo que faltou.** Dizer que a decisão está incompleta é o que o cliente precisa para agir; dizer qual item faltou revelaria uma escolha do aluno sobre um item específico. Por isso as recusas novas não carregam `fieldErrors`, não carregam categoria e a prosa delas não permite inferir qual item foi negado. **Nenhum destes termos autoriza dado corporal** declarado, auto-coleta recorrente, medição do personal ou meta numérica: o quarto consentimento (V4) continua bloqueado e não tem superfície nesta operação. O servidor revalida expiresAt ATUAL do convite (now >= expiresAt bloqueia), inclusive após reduzir validade com jornada aberta e corridas expirador×renew/accept×delete. Renovar preserva ID/código/URL e permite NOVA journey elegível pelo mesmo link, nunca revive journey/prova/OTP vencidos ou convite consumido, nem prorroga sessão Cognito/OAuth. GET/landing/scanner não aceitam. Link estável não é credencial de aceite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | A revisão **exata** do contexto pré-aceite que o cliente leu, idêntica a `revision` e ao `ETag` daquela resposta. Aqui o `If-Match` não é só compare-and-set: ele é a prova de que o catálogo foi lido, e por isso o **curinga `*` não é elegível**. `*` significa, na RFC 9110 §13.1.1, \"casa se o recurso tem qualquer representação corrente\" — um valor que quem nunca leu o contexto conseguiria enviar, e que portanto derrubaria exatamente a precondição. O `pattern` o recusa, e a recusa é `422 VALIDATION_ERROR`.
let acceptStudentInvitationRequest = AcceptStudentInvitationRequest(token: "token_example", invitationId: "invitationId_example", emailOwnershipProofId: "emailOwnershipProofId_example", ageAssurance: StudentAgeAssuranceEvidenceInput(dateOfBirth: Date()), privacyDecisions: [StudentPrivacyDecisionInput(consentType: StudentConsentType(), decision: StudentConsentDecision(), documentVersion: "documentVersion_example")], sharingGrants: [StudentSharingGrantInput(category: StudentSharingCategory(), decision: nil)], replacement: StudentRelationshipReplacementInput(confirmed: false, relationshipId: "relationshipId_example"), timeZone: "timeZone_example") // AcceptStudentInvitationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Confirmar o aceite do convite — a única transação que cria ou troca o vínculo
StudentInvitationsAPI.acceptStudentInvitation(idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptStudentInvitationRequest: acceptStudentInvitationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | A revisão **exata** do contexto pré-aceite que o cliente leu, idêntica a &#x60;revision&#x60; e ao &#x60;ETag&#x60; daquela resposta. Aqui o &#x60;If-Match&#x60; não é só compare-and-set: ele é a prova de que o catálogo foi lido, e por isso o **curinga &#x60;*&#x60; não é elegível**. &#x60;*&#x60; significa, na RFC 9110 §13.1.1, \&quot;casa se o recurso tem qualquer representação corrente\&quot; — um valor que quem nunca leu o contexto conseguiria enviar, e que portanto derrubaria exatamente a precondição. O &#x60;pattern&#x60; o recusa, e a recusa é &#x60;422 VALIDATION_ERROR&#x60;. |
 **acceptStudentInvitationRequest** | [**AcceptStudentInvitationRequest**](AcceptStudentInvitationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentInvitationAcceptanceView**](StudentInvitationAcceptanceView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalStudentInvitation**
```swift
    open class func createPersonalStudentInvitation(idempotencyKey: String, createStudentInvitationRequest: CreateStudentInvitationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationIssuedView?, _ error: Error?) -> Void)
```

Criar um convite de aluno pelo personal

Emite um único convite email-bound com validity obrigatório escolhido pelo Personal. Servidor calcula prazo, DST e limite exclusivo. invitationId/código/URL/emissor/destinatário são imutáveis; código cifrado recuperável durável e hash de lookup. GET share-link recopia o mesmo endereço, sem efeito. Emissão nova inclui shareableUrl, replay omite código. Duplicado renovável do mesmo emissor/destino retorna 409 INVITATION_ALREADY_EXISTS com referência opaca só do próprio emissor, sem revogar/tocar original. STUDENT_ALREADY_LINKED é aluno ativo com este mesmo personal; vínculo de outra conta não é revelado. canInvite, quotas de emissão e envio são server-owned e separadas. Emissão+outbox atômicas. Login, prova de destinatário, 18+, privacidade e aceite único permanecem independentes do link estável.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createStudentInvitationRequest = CreateStudentInvitationRequest(inviteeEmail: "inviteeEmail_example", studentDisplayName: "studentDisplayName_example", delivery: StudentInvitationDeliveryInput(mode: StudentInvitationDeliveryMode()), customMessage: "customMessage_example", validity: StudentInvitationValidity(days: 123, date: Date(), timeZone: "timeZone_example")) // CreateStudentInvitationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Criar um convite de aluno pelo personal
StudentInvitationsAPI.createPersonalStudentInvitation(idempotencyKey: idempotencyKey, createStudentInvitationRequest: createStudentInvitationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **createStudentInvitationRequest** | [**CreateStudentInvitationRequest**](CreateStudentInvitationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentInvitationIssuedView**](PersonalStudentInvitationIssuedView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **declineStudentInvitation**
```swift
    open class func declineStudentInvitation(idempotencyKey: String, declineStudentInvitationRequest: DeclineStudentInvitationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Recusar um convite de aluno

Encerra um convite válido em DECLINED sem criar conta, sessão ou relação. A operação não aceita motivo nem qualquer payload de consentimento. A recusa anônima preserva request/token, jornada curta, idempotência e efeitos. Ausente, inválido, excluído, expirado, consumido, recusado ou revogado retornam 404 INVITATION_NOT_FOUND uniforme, sem conta/lifecycle/motivo. 409 somente IDEMPOTENCY_CONFLICT (mesma chave com outro pedido). Expirado/consumido específico somente em contexto autenticado e autorizado; landing/scanner/GET não aceitam. Revalida prazo ATUAL no commit: now >= expiresAt bloqueia, renovação não revive journey/prova expirada.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let declineStudentInvitationRequest = DeclineStudentInvitationRequest(token: "token_example") // DeclineStudentInvitationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Recusar um convite de aluno
StudentInvitationsAPI.declineStudentInvitation(idempotencyKey: idempotencyKey, declineStudentInvitationRequest: declineStudentInvitationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **declineStudentInvitationRequest** | [**DeclineStudentInvitationRequest**](DeclineStudentInvitationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentInvitationDetails**
```swift
    open class func getPersonalStudentInvitationDetails(invitationId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationView?, _ error: Error?) -> Void)
```

Ler detalhes do convite do próprio personal

GET owner-only sem efeito: ETag do item por ator/ID para If-Match VERBATIM; collection/revision não é validator. Não devolve URL/código. Ausente/excluído/ator errado: 404 uniforme. Pendente/aberto/expirado e fatos terminais existentes continuam visíveis até excluir.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler detalhes do convite do próprio personal
StudentInvitationsAPI.getPersonalStudentInvitationDetails(invitationId: invitationId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentInvitationView**](PersonalStudentInvitationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalStudentInvitationShareLink**
```swift
    open class func getPersonalStudentInvitationShareLink(invitationId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationShareLinkView?, _ error: Error?) -> Void)
```

Copiar o mesmo link do convite

GET owner-only private/no-store sem efeito em validade/revision/envio/abertura; sem Idempotency-Key/comando. Somente estado com COPY_LINK. UNAVAILABLE forçado: 409 INVITATION_LINK_UNAVAILABLE; chave/serviço temporariamente indisponível: 503 recuperável sem marcar perda permanente. EXPIRED requer renovar antes; terminais não copiam. URL só transitória autorizada, nunca lista/prefs/log. Ausente/excluído/ator errado: 404 uniforme.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Copiar o mesmo link do convite
StudentInvitationsAPI.getPersonalStudentInvitationShareLink(invitationId: invitationId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentInvitationShareLinkView**](PersonalStudentInvitationShareLinkView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStudentInvitationAcceptanceContext**
```swift
    open class func getStudentInvitationAcceptanceContext(studentInvitationAcceptanceContextRequest: StudentInvitationAcceptanceContextRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentInvitationAcceptanceContextView?, _ error: Error?) -> Void)
```

Ler o contexto autenticado que precede o aceite do convite

Leitura autenticada de tudo o que a pessoa precisa decidir **antes** de existir qualquer vínculo: prova de posse do endereço convidado, elegibilidade de idade, catálogo de privacidade vigente e, quando já há vínculo ativo, a troca e as categorias de compartilhamento que ela pode autorizar. **É leitura, e nunca consome o convite.** Apresentar o segredo aqui pode levar o convite a `OPENED`, que registra apresentação e não consumo: o único consumo é o commit atômico de `acceptStudentInvitation`. Esta operação não cria relação, não grava decisão, não encerra vínculo anterior e não emite prova de e-mail. **É `POST` porque o segredo do convite viaja no corpo.** O token é bearer secret e não pode aparecer em path, query, log ou analytics; a operação não tem efeito colateral e por isso não exige `Idempotency-Key`. **A resposta carrega uma revisão opaca** — publicada em `revision` e repetida no `ETag` — que é exatamente o valor que `If-Match` do aceite exige. É a precondição que vincula o aceite a este contexto apresentado: um cliente que não passou por aqui não tem o valor, e um cliente que passou antes de o catálogo mudar é recusado com `412 PRIVACY_CONTEXT_STALE` e precisa reler. `If-None-Match` e `304` não são oferecidos: a revisão é precondição de escrita, não validador de cache. **Esta operação não amplia a resolução pública.** Tudo o que ela publica além de `resolveStudentInvitation` depende da identidade autenticada, e por isso ela exige `BearerAuth` e varia por `Authorization`. **O termo é apresentado por inteiro (`DEC-PHOME-19` §3.1).** Cada item traz a versão imutável, o texto exato localizado (`documentText`) e o SHA-256 dele (`documentSha256`); `SHARE_DATA_WITH_PERSONAL` vem com `acceptanceRequired: true` — sem o aceite explícito dele não há vínculo — e a apresentação diz que o personal **deste** vínculo lerá a anamnese concluída neste vínculo. A anamnese não é categoria de compartilhamento da troca: versões anteriores só por autorização explícita por versão, depois do aceite. A revisão vincula conta, convite, catálogo e locale apresentados: não prova que a pessoa leu, mas impede confirmar outro contexto. **O próprio emissor é recusado aqui, antes de qualquer prova.** Quando a conta autenticada é o personal que emitiu o convite, a resposta é `409 RELATIONSHIP_PARTIES_IDENTICAL`: nenhum contexto é calculado, nenhuma prova de e-mail é pedida e o convite não muda de estado. O servidor revalida expiresAt ATUAL do convite (now >= expiresAt bloqueia), inclusive após reduzir validade com jornada aberta e corridas expirador×renew/accept×delete. Renovar preserva ID/código/URL e permite NOVA journey elegível pelo mesmo link, nunca revive journey/prova/OTP vencidos ou convite consumido, nem prorroga sessão Cognito/OAuth. GET/landing/scanner não aceitam. Link estável não é credencial de aceite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let studentInvitationAcceptanceContextRequest = StudentInvitationAcceptanceContextRequest(token: "token_example", invitationId: "invitationId_example") // StudentInvitationAcceptanceContextRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler o contexto autenticado que precede o aceite do convite
StudentInvitationsAPI.getStudentInvitationAcceptanceContext(studentInvitationAcceptanceContextRequest: studentInvitationAcceptanceContextRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **studentInvitationAcceptanceContextRequest** | [**StudentInvitationAcceptanceContextRequest**](StudentInvitationAcceptanceContextRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentInvitationAcceptanceContextView**](StudentInvitationAcceptanceContextView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentInvitationActivity**
```swift
    open class func listPersonalStudentInvitationActivity(invitationId: String, acceptLanguage: String? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: PersonalStudentInvitationActivityPage?, _ error: Error?) -> Void)
```

Ler histórico operacional do convite do próprio personal

GET owner-only keyset (occurredAt,activityId), cursor opaco vinculado a ator+convite. Página items/nextCursor/asOf server-owned. SEND/RESEND=tentativa QUEUED|SENT|FAILED, nunca recebimento. RENEW sem envio: um evento; com envio: RENEW+SEND vinculados por operationId opaco com um envio atômico. Replay preserva IDs/contagens. Sem URL/código/token/destino cru. DELETE só auditoria mínima interna, histórico/detalhes inacessíveis após exclusão. Ausente/excluído/ator errado: 404 uniforme.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. (optional) (default to 20)

// Ler histórico operacional do convite do próprio personal
StudentInvitationsAPI.listPersonalStudentInvitationActivity(invitationId: invitationId, acceptLanguage: acceptLanguage, cursor: cursor, limit: limit) { (response, error) in
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
 **invitationId** | **String** | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. | [optional] [default to 20]

### Return type

[**PersonalStudentInvitationActivityPage**](PersonalStudentInvitationActivityPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listPersonalStudentInvitations**
```swift
    open class func listPersonalStudentInvitations(acceptLanguage: String? = nil, query: String? = nil, status: StudentInvitationLifecycleStatus? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: StudentInvitationPage?, _ error: Error?) -> Void)
```

Listar convites de aluno emitidos pelo personal

Página owner-only com um item por invitationId, asOf do servidor, cursor opaco e query/status/cursor/limit. Excluído não aparece. Sem URL/código/token/destino cru; detalhes/histórico e GET share-link autorizados são superfícies separadas — a coleção nunca materializa link para buscar e-mail. Expirado permanece visível renovável; availableActions/linkAvailability são do servidor, não relógio/cache local. REVOKED existente é fato terminal com só REMOVE e copy neutra Convite encerrado. `query` aplica-se ao conjunto inteiro do dono ANTES de status, corte e página, casando `studentDisplayName` autorado e o e-mail convidado por substring literal da chave normalizada no servidor (trim, espaços Unicode colapsados, NFD sem marcas combinantes, casefold); `%`, `_` e `\\` não são wildcard, e a ordem publicada por envio/ID se mantém — nunca relevância de busca. O e-mail casado continua mascarado na resposta e a busca nunca alcança convite ou conta de outro dono; o termo digitado é dado sensível e não vai para métricas nem logs. O cursor autentica dono, coleção, `query`/`status` resolvidos e locale — token adulterado ou de outro dono/coleção/query/status é `422 INVALID_CURSOR` sem revelar qual vínculo falhou; mudança no conjunto visível entre páginas é `409 CURSOR_SNAPSHOT_CHANGED` sem itens; os 300 segundos absolutos da leitura são `410 CURSOR_EXPIRED` e a continuação nunca estende o prazo. Toda página de uma mesma leitura carrega o mesmo `asOf`, `expiresAt` e `querySnapshotId`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let query = "query_example" // String | Busca global por nome informado ou e-mail do convite, restrita aos convites do personal autenticado e combinável com `status`. Aceita 1–254 code points após trim; ausente ou vazia equivale a sem busca. O servidor normaliza o termo uma única vez e aplica o predicado ao conjunto inteiro antes do corte e da página — nunca é filtro local da página carregada. O termo novo exige leitura nova — o `query` resolvido entra no escopo do cursor. (optional)
let status = StudentInvitationLifecycleStatus() // StudentInvitationLifecycleStatus | Filtra pelo estágio do ciclo de vida do convite; ausente devolve todos os estágios. Não filtra pelo estado de entrega. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele autentica dono, coleção, `query`/ `status` resolvidos e locale da leitura que o emitiu, além da posição, do `asOf` e do prazo absoluto de expiração. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. Valor fora da faixa é `422 VALIDATION_ERROR`, nunca clamp silencioso. (optional) (default to 20)

// Listar convites de aluno emitidos pelo personal
StudentInvitationsAPI.listPersonalStudentInvitations(acceptLanguage: acceptLanguage, query: query, status: status, cursor: cursor, limit: limit) { (response, error) in
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
 **query** | **String** | Busca global por nome informado ou e-mail do convite, restrita aos convites do personal autenticado e combinável com &#x60;status&#x60;. Aceita 1–254 code points após trim; ausente ou vazia equivale a sem busca. O servidor normaliza o termo uma única vez e aplica o predicado ao conjunto inteiro antes do corte e da página — nunca é filtro local da página carregada. O termo novo exige leitura nova — o &#x60;query&#x60; resolvido entra no escopo do cursor. | [optional]
 **status** | [**StudentInvitationLifecycleStatus**](.md) | Filtra pelo estágio do ciclo de vida do convite; ausente devolve todos os estágios. Não filtra pelo estado de entrega. | [optional]
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. Ele autentica dono, coleção, &#x60;query&#x60;/ &#x60;status&#x60; resolvidos e locale da leitura que o emitiu, além da posição, do &#x60;asOf&#x60; e do prazo absoluto de expiração. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. Valor fora da faixa é &#x60;422 VALIDATION_ERROR&#x60;, nunca clamp silencioso. | [optional] [default to 20]

### Return type

[**StudentInvitationPage**](StudentInvitationPage.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removePersonalStudentInvitation**
```swift
    open class func removePersonalStudentInvitation(invitationId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Excluir convite deliberadamente

Exclusão lógica com confirmação explícita no app, sem body e sem restauração. PENDING/OPENED/EXPIRED: invalida acesso e retira item/histórico operacional numa transação, inclusive corridas accept×delete. ACCEPTED/DECLINED/REVOKED factual: retira item/histórico sem romper relação ou alterar fatos. DELETE só auditoria interna mínima, sem promessa de purge imediato. Não revoga login. Ausente/excluído/ator errado: 404 uniforme. Replay conhecido autorizado antes da revisão que alterou, sem segunda exclusão.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exato do GET detalhes deste convite, guardado por ator/ID e enviado VERBATIM; não ETag da coleção nem derivação de revision. Replay conhecido autorizado é avaliado antes da revisão alterada por si próprio. Ausente/inválido 422; stale 412 exige releitura com draft preservado, sem sobrescrever/enviar automaticamente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Excluir convite deliberadamente
StudentInvitationsAPI.removePersonalStudentInvitation(invitationId: invitationId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exato do GET detalhes deste convite, guardado por ator/ID e enviado VERBATIM; não ETag da coleção nem derivação de revision. Replay conhecido autorizado é avaliado antes da revisão alterada por si próprio. Ausente/inválido 422; stale 412 exige releitura com draft preservado, sem sobrescrever/enviar automaticamente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **renewPersonalStudentInvitation**
```swift
    open class func renewPersonalStudentInvitation(invitationId: String, idempotencyKey: String, ifMatch: String, renewPersonalStudentInvitationRequest: RenewPersonalStudentInvitationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationView?, _ error: Error?) -> Void)
```

Renovar ou alterar validade do mesmo convite

Muda somente validity/revision/histórico no mesmo invitationId/código/URL, preserva emissor/destino e sentAt original. Pode encurtar validade vigente e renovar EXPIRED. Terminais ACCEPTED/DECLINED/REVOKED existente não renovam. sendEmail=false permite UNAVAILABLE preservando hash/endereço; true exige AVAILABLE antes de todo efeito e grava RENEW+SEND linked por operationId opaco com um envio na mesma transação. Replay conserva IDs/eventos/contagens. Nova intenção/data exige chave nova. Não revive journey/prova/OTP vencidos, convite consumido nem sessão Cognito/OAuth; novo contexto elegível pelo mesmo link e prazo ATUAL revalidado no commit.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exato do GET detalhes deste convite, guardado por ator/ID e enviado VERBATIM; não ETag da coleção nem derivação de revision. Replay conhecido autorizado é avaliado antes da revisão alterada por si próprio. Ausente/inválido 422; stale 412 exige releitura com draft preservado, sem sobrescrever/enviar automaticamente.
let renewPersonalStudentInvitationRequest = RenewPersonalStudentInvitationRequest(validity: StudentInvitationValidity(days: 123, date: Date(), timeZone: "timeZone_example"), sendEmail: false) // RenewPersonalStudentInvitationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Renovar ou alterar validade do mesmo convite
StudentInvitationsAPI.renewPersonalStudentInvitation(invitationId: invitationId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, renewPersonalStudentInvitationRequest: renewPersonalStudentInvitationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exato do GET detalhes deste convite, guardado por ator/ID e enviado VERBATIM; não ETag da coleção nem derivação de revision. Replay conhecido autorizado é avaliado antes da revisão alterada por si próprio. Ausente/inválido 422; stale 412 exige releitura com draft preservado, sem sobrescrever/enviar automaticamente. |
 **renewPersonalStudentInvitationRequest** | [**RenewPersonalStudentInvitationRequest**](RenewPersonalStudentInvitationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentInvitationView**](PersonalStudentInvitationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resendPersonalStudentInvitation**
```swift
    open class func resendPersonalStudentInvitation(invitationId: String, idempotencyKey: String, ifMatch: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationView?, _ error: Error?) -> Void)
```

Reenviar o mesmo convite

Enfileira exatamente uma tentativa com MESMO invitationId/código/URL/expiresAt e sentAt original. Nenhuma emissão/replacement/revogação/exclusão; uma linha principal. Sem body, herda destino/mensagem. Expirado precisa renovar primeiro. UNAVAILABLE: 409 INVITATION_LINK_UNAVAILABLE antes de side-effects; falha temporária criptográfica é 503 recuperável. Quotas de envio separadas da emissão. Replay autorizado vem antes da revisão que alterou; conserva resultado/IDs/contagens.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let invitationId = "invitationId_example" // String | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let ifMatch = "ifMatch_example" // String | ETag exato do GET detalhes deste convite, guardado por ator/ID e enviado VERBATIM; não ETag da coleção nem derivação de revision. Replay conhecido autorizado é avaliado antes da revisão alterada por si próprio. Ausente/inválido 422; stale 412 exige releitura com draft preservado, sem sobrescrever/enviar automaticamente.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Reenviar o mesmo convite
StudentInvitationsAPI.resendPersonalStudentInvitation(invitationId: invitationId, idempotencyKey: idempotencyKey, ifMatch: ifMatch, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identidade opaca do convite do próprio emissor; ausente/excluído/ator errado usam 404 uniforme. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **ifMatch** | **String** | ETag exato do GET detalhes deste convite, guardado por ator/ID e enviado VERBATIM; não ETag da coleção nem derivação de revision. Replay conhecido autorizado é avaliado antes da revisão alterada por si próprio. Ausente/inválido 422; stale 412 exige releitura com draft preservado, sem sobrescrever/enviar automaticamente. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentInvitationView**](PersonalStudentInvitationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resolveStudentInvitation**
```swift
    open class func resolveStudentInvitation(resolveStudentInvitationRequest: ResolveStudentInvitationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentInvitationView?, _ error: Error?) -> Void)
```

Resolver um convite de aluno por credencial curta de jornada

Leitura autenticada que projeta somente os dados seguros necessários para o aluno reconhecer e aceitar um convite. **`INV-CONVITE-GET`: resolver NUNCA consome o convite.** Esta rota aceita somente o `journeyToken` curto emitido por `createInvitationJourney`; o token bruto de convites beta anteriores deixa de resolver no cutover. O único consumo é o commit atômico único do aceite, e por isso `status` aqui só pode ser `PENDING` ou `OPENED` — `OPENED` registra apresentação, não consumo, e nenhum caminho desta operação leva a `ACCEPTED`. A resolução não cria sessão nem relação e nunca devolve nome do aluno ou destino sem máscara. `destinationMasked` vem em todo convite emitido a partir da v2, que é `email-bound` (`DEC-CONV-2`), e continua estruturalmente opcional por causa dos convites de link emitidos antes dela, que não têm destino algum. Ele é irreversivelmente mascarado e o endereço em claro nunca sai por aqui. **É o primeiro ponto autenticado da jornada, e é aqui que o próprio emissor é recusado.** Quando a conta autenticada é o personal que emitiu o convite, a resposta é `409 RELATIONSHIP_PARTIES_IDENTICAL`, sem efeito no convite: ele nunca poderá aceitá-lo, e por isso não segue para o contexto pré-aceite nem para a prova de posse do e-mail. O servidor revalida expiresAt ATUAL do convite (now >= expiresAt bloqueia), inclusive após reduzir validade com jornada aberta e corridas expirador×renew/accept×delete. Renovar preserva ID/código/URL e permite NOVA journey elegível pelo mesmo link, nunca revive journey/prova/OTP vencidos ou convite consumido, nem prorroga sessão Cognito/OAuth. GET/landing/scanner não aceitam. Link estável não é credencial de aceite.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let resolveStudentInvitationRequest = ResolveStudentInvitationRequest(token: "token_example") // ResolveStudentInvitationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Resolver um convite de aluno por credencial curta de jornada
StudentInvitationsAPI.resolveStudentInvitation(resolveStudentInvitationRequest: resolveStudentInvitationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **resolveStudentInvitationRequest** | [**ResolveStudentInvitationRequest**](ResolveStudentInvitationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**StudentInvitationView**](StudentInvitationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startInvitationEmailOwnershipChallenge**
```swift
    open class func startInvitationEmailOwnershipChallenge(idempotencyKey: String, startInvitationEmailOwnershipChallengeRequest: StartInvitationEmailOwnershipChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: InvitationEmailOwnershipChallengeView?, _ error: Error?) -> Void)
```

Emitir o código de posse do endereço convidado, no escopo daquele convite

Envia um código ao **endereço convidado** — nunca ao e-mail da conta autenticada — quando a identidade autenticada diverge do destino do convite. **O desafio é escopado ao `invitationId`.** Ele autoriza somente o aceite daquele convite: não adiciona o endereço convidado à conta, não troca o e-mail principal, não cria identidade nova e não vale para um segundo convite. **Nada aqui consome o convite nem altera vínculo algum.** Pedir, falhar ou abandonar a verificação preserva o convite não consumido e o vínculo anterior ativo. **Os parâmetros do desafio são do servidor.** `expiresAt`, `resendAvailableAt` e `maxAttempts` chegam prontos; nenhum cliente embute, calcula ou adivinha validade, janela de reenvio ou limite de tentativas, e o tempo exibido é o que o servidor devolveu, nunca um cronômetro local. Na ausência do dado o cliente falha fechado. **Quantas tentativas ainda restam não é publicado**, nem aqui nem na verificação: revelar o saldo transformaria o limite em oráculo. Pedir de novo dentro da janela mínima responde `429 RATE_LIMITED` com `Retry-After` e **não invalida** o código já enviado. Repetir depois da janela emite **outro** código; código expirado nunca é reativado. **O próprio emissor nunca recebe desafio.** Quando a conta autenticada é o personal que emitiu o convite, a resposta é `409 RELATIONSHIP_PARTIES_IDENTICAL` e nenhum código é enviado ao endereço convidado.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let startInvitationEmailOwnershipChallengeRequest = StartInvitationEmailOwnershipChallengeRequest(token: "token_example", invitationId: "invitationId_example") // StartInvitationEmailOwnershipChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Emitir o código de posse do endereço convidado, no escopo daquele convite
StudentInvitationsAPI.startInvitationEmailOwnershipChallenge(idempotencyKey: idempotencyKey, startInvitationEmailOwnershipChallengeRequest: startInvitationEmailOwnershipChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **startInvitationEmailOwnershipChallengeRequest** | [**StartInvitationEmailOwnershipChallengeRequest**](StartInvitationEmailOwnershipChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**InvitationEmailOwnershipChallengeView**](InvitationEmailOwnershipChallengeView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyInvitationEmailOwnershipChallenge**
```swift
    open class func verifyInvitationEmailOwnershipChallenge(idempotencyKey: String, challengeId: String, verifyInvitationEmailOwnershipChallengeRequest: VerifyInvitationEmailOwnershipChallengeRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: InvitationEmailOwnershipProofView?, _ error: Error?) -> Void)
```

Verificar o código de posse do endereço convidado

Confere o código enviado ao endereço convidado e, em caso de acerto, devolve a **prova** que o aceite daquele convite exige em `emailOwnershipProofId`. **A prova não muda identidade.** Ela registra, como fato auditável com data, que a conta autenticada provou a posse do endereço convidado **para aquele `invitationId`** — e nada mais. Nenhum e-mail é adicionado à conta, nenhum é trocado, nenhuma identidade nasce, e a prova não é aceita por outro convite. **Nenhuma recusa aqui consome o convite nem altera vínculo algum**, e nenhuma revela se a conta ou o endereço existem. Código errado é falha **recuperável**: o desafio continua de pé e a pessoa tenta de novo. Esgotar as tentativas encerra o **desafio**, não o convite: pede-se outro e recomeça. **Quantas tentativas restam não é publicado.** A distinção entre errar e esgotar é publicada porque muda o que a pessoa faz em seguida; o saldo não é, porque transformaria o limite em oráculo.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let challengeId = "challengeId_example" // String |
let verifyInvitationEmailOwnershipChallengeRequest = VerifyInvitationEmailOwnershipChallengeRequest(code: "code_example") // VerifyInvitationEmailOwnershipChallengeRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Verificar o código de posse do endereço convidado
StudentInvitationsAPI.verifyInvitationEmailOwnershipChallenge(idempotencyKey: idempotencyKey, challengeId: challengeId, verifyInvitationEmailOwnershipChallengeRequest: verifyInvitationEmailOwnershipChallengeRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **challengeId** | **String** |  |
 **verifyInvitationEmailOwnershipChallengeRequest** | [**VerifyInvitationEmailOwnershipChallengeRequest**](VerifyInvitationEmailOwnershipChallengeRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**InvitationEmailOwnershipProofView**](InvitationEmailOwnershipProofView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
