# StudentInvitationsAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptStudentInvitation**](StudentInvitationsAPI.md#acceptstudentinvitation) | **POST** /student-invitations/accept | Confirmar o aceite do convite — a única transação que cria ou troca o vínculo
[**cancelPersonalStudentInvitation**](StudentInvitationsAPI.md#cancelpersonalstudentinvitation) | **POST** /personal/student-invitations/{invitationId}/cancel | Cancelar um convite de aluno pelo personal
[**createPersonalStudentInvitation**](StudentInvitationsAPI.md#createpersonalstudentinvitation) | **POST** /personal/student-invitations | Criar um convite de aluno pelo personal
[**declineStudentInvitation**](StudentInvitationsAPI.md#declinestudentinvitation) | **POST** /student-invitations/decline | Recusar um convite de aluno
[**getStudentInvitationAcceptanceContext**](StudentInvitationsAPI.md#getstudentinvitationacceptancecontext) | **POST** /student-invitations/acceptance-context | Ler o contexto autenticado que precede o aceite do convite
[**listPersonalStudentInvitations**](StudentInvitationsAPI.md#listpersonalstudentinvitations) | **GET** /personal/student-invitations | Listar convites de aluno emitidos pelo personal
[**removePersonalStudentInvitation**](StudentInvitationsAPI.md#removepersonalstudentinvitation) | **POST** /personal/student-invitations/{invitationId}/removal | Arquivar um convite terminal da lista do personal
[**resendPersonalStudentInvitation**](StudentInvitationsAPI.md#resendpersonalstudentinvitation) | **POST** /personal/student-invitations/{invitationId}/resend | Reenviar um convite de aluno pelo personal
[**resolveStudentInvitation**](StudentInvitationsAPI.md#resolvestudentinvitation) | **POST** /student-invitations/resolve | Resolver um convite de aluno por credencial curta de jornada
[**startInvitationEmailOwnershipChallenge**](StudentInvitationsAPI.md#startinvitationemailownershipchallenge) | **POST** /student-invitations/email-ownership-challenges | Emitir o código de posse do endereço convidado, no escopo daquele convite
[**verifyInvitationEmailOwnershipChallenge**](StudentInvitationsAPI.md#verifyinvitationemailownershipchallenge) | **POST** /student-invitations/email-ownership-challenges/{challengeId}/verification | Verificar o código de posse do endereço convidado


# **acceptStudentInvitation**
```swift
    open class func acceptStudentInvitation(idempotencyKey: String, ifMatch: String, acceptStudentInvitationRequest: AcceptStudentInvitationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentInvitationAcceptanceView?, _ error: Error?) -> Void)
```

Confirmar o aceite do convite — a única transação que cria ou troca o vínculo

**É a única confirmação final da sequência de entrada, e uma única transação.** De forma indivisível ela valida a prova de posse do endereço convidado quando houve divergência, valida a elegibilidade de idade 18+, grava as decisões de privacidade com a versão do servidor, grava os grants de compartilhamento item a item, encerra o vínculo anterior quando existe, congela os treinos futuros do personal anterior, cria a relação e consome o convite. **Qualquer falha desfaz tudo:** nenhuma decisão fica gravada, o vínculo anterior **permanece ativo** e o convite permanece **não consumido**. Não existe resultado parcial nem ordem de execução em que a pessoa fique sem vínculo. **A relação não nasce antes daqui.** Resolver o convite, autenticar, ler o contexto pré-aceite, provar a posse do e-mail e declarar intenção de aceitar não criam relação, consentimento nem capacidade de aluno. **`If-Match` é obrigatório e ecoa `revision` do contexto pré-aceite.** É o que vincula a confirmação ao catálogo apresentado: quem não chamou `getStudentInvitationAcceptanceContext` não tem o valor. Revisão defasada — porque o catálogo mudou, porque a exigência de idade mudou ou porque o contexto se moveu — é `412 PRIVACY_CONTEXT_STALE`, e a releitura é obrigatória. **Consentimento é decisão explícita por item, nunca uma lista de aceites.** O cliente envia `GRANTED` ou `DECLINED` para **cada** item do catálogo que o contexto serviu, com a `documentVersion` que lhe foi apresentada; cobrir o catálogo parcialmente é `422 PRIVACY_DECISIONS_INCOMPLETE`. A **versão aceita é a efetivamente apresentada pelo servidor**, ecoada pelo cliente — que não propõe versão, texto nem catálogo —: versão diferente da apresentada, ou que deixou de poder ser aceita, é `412 PRIVACY_CONTEXT_STALE`, e a pessoa recebe nova apresentação e faz novo ato; nunca se consente em silêncio outra versão. Tipo fora do catálogo recusa o pedido inteiro com `422 VALIDATION_ERROR`, sem efeito nenhum. **Aceite real obrigatório (`DEC-PHOME-19` §3.1).** `SHARE_DATA_WITH_PERSONAL` (`acceptanceRequired: true`) exige `GRANTED`; recusá-lo é `403 CONSENT_REQUIRED`, sem vínculo, sem consumo do convite e sem encerramento do vínculo anterior. O aceite é gravado **no mesmo commit** do vínculo, com o aluno como autor, o vínculo e o personal destinatários, o tipo, a versão, o texto localizado exato apresentado e o SHA-256 dele, o locale e o instante do servidor — recuperáveis em `getStudentAnamnesisConsent` — e é ele que autoriza o personal deste vínculo a ler as versões concluídas da ficha deste vínculo. Não há quarto termo, controle pré-marcado nem alternância posterior desse acesso, e ter aceito em outro vínculo não substitui o ato deste. **O vínculo nasce com a sua ficha de anamnese vazia e obrigatória**, inclusive com o mesmo personal de um vínculo anterior: nada é copiado, importado ou pré-preenchido, e o aceite nunca conclui a ficha. Falha de rede não é recusa nem aceite. **Os grants de compartilhamento são opt-in e nascem desmarcados.** Eles só existem quando há troca, pertencem ao catálogo **fechado** de quatro categorias e são grant de **leitura**: autorizar não copia o fato, não reatribui autoria, não muda procedência e não cria segunda cópia. A configuração de coleta do personal anterior **nunca** é herdada. **A anamnese não é categoria de compartilhamento** (`DEC-PHOME-19`): a antiga `HEALTH_FORM` foi removida do catálogo; versões de vínculos anteriores chegam ao personal novo **só** pela autorização explícita por versão e vínculo destinatário de `setStudentAnamnesisPreviousVersionsGrant`, depois do aceite, revogável, e nada é autorizado por omissão. **Troca é explícita.** Havendo vínculo ativo, `replacement.confirmed` é obrigatório e `replacement.relationshipId` tem de ser o vínculo que o contexto publicou; sem a confirmação a resposta é `403 ACTIVE_RELATIONSHIP_CONFIRMATION_REQUIRED`, e se o vínculo ativo deixou de ser aquele a resposta é `409 ACTIVE_RELATIONSHIP_CHANGED`. **O nome do aluno é pré-condição do vínculo** (`DEC-PHOME-6`). Enquanto o perfil do aluno não tem nome — o que o passo `STUDENT_PROFILE_NAME` do onboarding resolve com `saveStudentProfile` antes do aceite —, o commit é recusado com `409 INVALID_ONBOARDING_TRANSITION` e `blockingStepKey: STUDENT_PROFILE_NAME`, no molde da recusa do perfil do personal: nada é gravado, nenhum vínculo nasce nem é trocado e o convite permanece **não consumido**; a pessoa informa o nome e refaz o aceite. A recusa nomeia o passo que falta e nunca carrega o nome. **Precedência:** todas as recusas já publicadas nesta operação (`401`, `403`, `404`, `409` dos demais códigos, `410`, `412` e `422`) são avaliadas **antes**; a falta de nome é a **última** verificação antes do commit, de modo que ela só aparece quando o resto do aceite estaria válido. É escolha técnica deste contrato, registrada porque os documentos são silentes sobre a ordem. **Idade é decidida pelo servidor.** Nenhum cliente compara datas, embute idade-limite ou conclui elegibilidade. Quando o contexto pediu prova adicional, a data de nascimento declarada viaja em `ageAssurance` como **evidência**, nunca como veredito. Sinal faltante, inconclusivo ou divergente é `403 AGE_ASSURANCE_REQUIRED`, falha recuperável; menor de 18 no release inicial é `403 AGE_NOT_ELIGIBLE`, terminal para aquele aceite. Nenhum dos dois consome o convite nem altera vínculo algum, e o personal nunca vê o motivo. **O token portador é obrigatório** e é o que prova a posse do convite. `invitationId` é **conferência cruzada opcional**: quando enviado precisa ser o convite daquele token, e divergir responde `404 INVITATION_NOT_FOUND`, exatamente como um token desconhecido — a resposta nunca confirma a existência do convite alheio. **Um convite por chamada.** A operação aceita exatamente o convite do token recebido: não varre convites pendentes e não aceita nenhum outro em cascata. **Convite inexistente, expirado, revogado, recusado ou já consumido não cria contexto de aluno**: `404`, `409` e `410` não criam relação, consentimento nem capacidade, e nenhum deles é um aceite parcial. Uma **falha de dependência** responde `500 INTERNAL_ERROR` e **nunca** `404 INVITATION_NOT_FOUND`: indisponibilidade não é ausência de convite. **Nenhuma recusa desta operação nomeia a categoria ou o termo que faltou.** Dizer que a decisão está incompleta é o que o cliente precisa para agir; dizer qual item faltou revelaria uma escolha do aluno sobre um item específico. Por isso as recusas novas não carregam `fieldErrors`, não carregam categoria e a prosa delas não permite inferir qual item foi negado. **Nenhum destes termos autoriza dado corporal** declarado, auto-coleta recorrente, medição do personal ou meta numérica: o quarto consentimento (V4) continua bloqueado e não tem superfície nesta operação.

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

# **cancelPersonalStudentInvitation**
```swift
    open class func cancelPersonalStudentInvitation(idempotencyKey: String, invitationId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationView?, _ error: Error?) -> Void)
```

Cancelar um convite de aluno pelo personal

Cancela um convite de aluno do personal autenticado. Cancelar é a AÇÃO do usuário; `REVOKED` é o estado terminal resultante e público do MESMO convite — não nasce outro recurso e o `invitationId` não muda. Não há corpo de requisição: cancelar não aceita campos e não sobrescreve nada. Os timestamps (`sentAt`, `expiresAt`, `acceptedAt`) são preservados; apenas `status` passa a `REVOKED` e `availableActions` fica vazio. O token de aceite associado torna-se inválido imediatamente. Repetir a mesma revogação é idempotente: devolve a representação `REVOKED` sem novo efeito e sem tocar em qualquer relação — relações só existem após autenticação e aceitação válidas, que o cancelamento nunca desfaz. Não há período de carência; a operação está sujeita à proteção transversal contra abuso. A resposta nunca confirma existência de conta ou destino.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let invitationId = "invitationId_example" // String | Identificador público opaco do convite que será cancelado; o personal autenticado precisa ser o dono do convite.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Cancelar um convite de aluno pelo personal
StudentInvitationsAPI.cancelPersonalStudentInvitation(idempotencyKey: idempotencyKey, invitationId: invitationId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identificador público opaco do convite que será cancelado; o personal autenticado precisa ser o dono do convite. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentInvitationView**](PersonalStudentInvitationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createPersonalStudentInvitation**
```swift
    open class func createPersonalStudentInvitation(idempotencyKey: String, createStudentInvitationRequest: CreateStudentInvitationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationIssuedView?, _ error: Error?) -> Void)
```

Criar um convite de aluno pelo personal

Emite UM convite de aluno para o personal autenticado. **Existe um único convite: não há modalidade a escolher** (`DEC-CONV-1`). O `inviteeEmail` é obrigatório em toda emissão e é o destino vinculante (`email-bound`, `DEC-CONV-2`); o e-mail transacional sai automaticamente, e `delivery.mode: DO_NOT_SEND` apenas não dispara esse envio — não cria outro tipo de convite. Uma emissão nova devolve SEMPRE `shareableUrl`, que é o MESMO segredo deste convite e não um convite paralelo (`INV-CONVITE-UNICO`): é o valor da ação \"copiar link\" da tela de convite. O replay da mesma `Idempotency-Key` devolve o recurso persistido sem reapresentar esse bearer secret. O servidor é a autoridade exclusiva da elegibilidade (canInvite), dos limites de emissão e do ciclo de vida. Um duplicado lógico para o mesmo destino cria um NOVO convite e revoga o anterior; o replay da mesma Idempotency-Key devolve o recurso original sem duplicar. A resposta nunca confirma existência de conta ou destino, com uma única exceção: se o `inviteeEmail` é o e-mail verificado de uma conta que já tem vínculo ACTIVE como aluno **com este mesmo personal**, a emissão é recusada com `409 STUDENT_ALREADY_LINKED` — o convite não nasce, nenhum e-mail sai e nenhum convite anterior é revogado. A recusa vem depois da elegibilidade (`403`) e da validação do pedido (`422`) e antes dos limites de emissão, que ela não consome. Isso só diz ao personal que o endereço é de um aluno que já está na carteira dele, fato que ele já conhece; o endereço de aluno de outro personal, de conta sem vínculo ou de vínculo encerrado continua recebendo `201`. O token de aceite é opaco, de uso único e expira em sete dias; `shareableUrl` é um bearer secret devolvido uma única vez e o convite persiste somente o hash do token (`INV-CONVITE-SEGREDO`). Estado de entrega é separado do ciclo de vida e nunca invalida o convite. A relação só nasce no commit atômico único do aceite, depois da revisão de privacidade (`DEC-CONV-3`).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createStudentInvitationRequest = CreateStudentInvitationRequest(inviteeEmail: "inviteeEmail_example", studentDisplayName: "studentDisplayName_example", delivery: StudentInvitationDeliveryInput(mode: StudentInvitationDeliveryMode()), customMessage: "customMessage_example") // CreateStudentInvitationRequest |
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

Encerra um convite válido em DECLINED sem criar conta, sessão ou relação. A operação não aceita motivo nem qualquer payload de consentimento.

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

# **getStudentInvitationAcceptanceContext**
```swift
    open class func getStudentInvitationAcceptanceContext(studentInvitationAcceptanceContextRequest: StudentInvitationAcceptanceContextRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: StudentInvitationAcceptanceContextView?, _ error: Error?) -> Void)
```

Ler o contexto autenticado que precede o aceite do convite

Leitura autenticada de tudo o que a pessoa precisa decidir **antes** de existir qualquer vínculo: prova de posse do endereço convidado, elegibilidade de idade, catálogo de privacidade vigente e, quando já há vínculo ativo, a troca e as categorias de compartilhamento que ela pode autorizar. **É leitura, e nunca consome o convite.** Apresentar o segredo aqui pode levar o convite a `OPENED`, que registra apresentação e não consumo: o único consumo é o commit atômico de `acceptStudentInvitation`. Esta operação não cria relação, não grava decisão, não encerra vínculo anterior e não emite prova de e-mail. **É `POST` porque o segredo do convite viaja no corpo.** O token é bearer secret e não pode aparecer em path, query, log ou analytics; a operação não tem efeito colateral e por isso não exige `Idempotency-Key`. **A resposta carrega uma revisão opaca** — publicada em `revision` e repetida no `ETag` — que é exatamente o valor que `If-Match` do aceite exige. É a precondição que vincula o aceite a este contexto apresentado: um cliente que não passou por aqui não tem o valor, e um cliente que passou antes de o catálogo mudar é recusado com `412 PRIVACY_CONTEXT_STALE` e precisa reler. `If-None-Match` e `304` não são oferecidos: a revisão é precondição de escrita, não validador de cache. **Esta operação não amplia a resolução pública.** Tudo o que ela publica além de `resolveStudentInvitation` depende da identidade autenticada, e por isso ela exige `BearerAuth` e varia por `Authorization`. **O termo é apresentado por inteiro (`DEC-PHOME-19` §3.1).** Cada item traz a versão imutável, o texto exato localizado (`documentText`) e o SHA-256 dele (`documentSha256`); `SHARE_DATA_WITH_PERSONAL` vem com `acceptanceRequired: true` — sem o aceite explícito dele não há vínculo — e a apresentação diz que o personal **deste** vínculo lerá a anamnese concluída neste vínculo. A anamnese não é categoria de compartilhamento da troca: versões anteriores só por autorização explícita por versão, depois do aceite. A revisão vincula conta, convite, catálogo e locale apresentados: não prova que a pessoa leu, mas impede confirmar outro contexto. **O próprio emissor é recusado aqui, antes de qualquer prova.** Quando a conta autenticada é o personal que emitiu o convite, a resposta é `409 RELATIONSHIP_PARTIES_IDENTICAL`: nenhum contexto é calculado, nenhuma prova de e-mail é pedida e o convite não muda de estado.

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

# **listPersonalStudentInvitations**
```swift
    open class func listPersonalStudentInvitations(acceptLanguage: String? = nil, status: StudentInvitationLifecycleStatus? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: StudentInvitationPage?, _ error: Error?) -> Void)
```

Listar convites de aluno emitidos pelo personal

Lista os convites de aluno do personal autenticado. A paginação é exclusivamente por cursor opaco: o cliente não interpreta o cursor, não há offset e o servidor é a autoridade exclusiva da ordenação, do limite efetivo e da continuação. A coleção nunca reapresenta `shareableUrl` nem qualquer token de aceite — o bearer secret é devolvido uma única vez na criação e no reenvio, e é estruturalmente ausente desta projeção. O e-mail convidado aparece sempre irreversivelmente mascarado, e presente em todo convite da v2; a coleção nunca devolve o destino em claro. O ciclo de vida (`status`) e o estado de entrega (`deliveryStatus`) permanecem enums separados, o histórico de tentativas de entrega viaja em `deliveryAttempts` sem nunca afirmar recebimento ou leitura, e `availableActions` é calculado pelo servidor.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)
let status = StudentInvitationLifecycleStatus() // StudentInvitationLifecycleStatus | Filtra pelo estágio do ciclo de vida do convite; ausente devolve todos os estágios. Não filtra pelo estado de entrega. (optional)
let cursor = "cursor_example" // String | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. (optional)
let limit = 987 // Int | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. (optional) (default to 20)

// Listar convites de aluno emitidos pelo personal
StudentInvitationsAPI.listPersonalStudentInvitations(acceptLanguage: acceptLanguage, status: status, cursor: cursor, limit: limit) { (response, error) in
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
 **status** | [**StudentInvitationLifecycleStatus**](.md) | Filtra pelo estágio do ciclo de vida do convite; ausente devolve todos os estágios. Não filtra pelo estado de entrega. | [optional]
 **cursor** | **String** | Cursor opaco de continuação devolvido por uma página anterior; nunca é offset, ID interno ou dado a ser interpretado pelo cliente. | [optional]
 **limit** | **Int** | Tamanho de página solicitado pelo cliente; o padrão é 20 e o servidor impõe o máximo de 100, podendo devolver menos itens. | [optional] [default to 20]

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
    open class func removePersonalStudentInvitation(idempotencyKey: String, invitationId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Arquivar um convite terminal da lista do personal

Caminho HTTP autoritativo do fato `relationship.invitation.remove`, a única mutação de convite que ainda não possuía rota online. **Remover não é cancelar.** Cancelar é uma transição de lifecycle que leva o convite a `REVOKED` e invalida o token; remover apenas **arquiva** o convite da lista do personal: não altera o estágio de lifecycle, não invalida token, não toca em relação e não apaga o fato. Por isso a rota é um sub-recurso nominal, e não mais um verbo de lifecycle ao lado de `resend` e `cancel`. Só é aceito sobre convite **já terminal**; sobre convite ainda vivo é `409 INVITATION_NOT_TERMINAL`, para que arquivar nunca vire um cancelamento implícito. Não há corpo de requisição: o payload publicado do command carrega apenas a identidade do convite, que este path já expressa. A resposta é `204`: depois de arquivado o convite deixa a coleção do personal, e projetá-lo de volta contradiria o próprio arquivamento. Repetir a remoção é idempotente e responde `204` de novo, sem novo efeito.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let invitationId = "invitationId_example" // String | Identificador público opaco do convite que será arquivado; o personal autenticado precisa ser o dono do convite.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Arquivar um convite terminal da lista do personal
StudentInvitationsAPI.removePersonalStudentInvitation(idempotencyKey: idempotencyKey, invitationId: invitationId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identificador público opaco do convite que será arquivado; o personal autenticado precisa ser o dono do convite. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

Void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **resendPersonalStudentInvitation**
```swift
    open class func resendPersonalStudentInvitation(idempotencyKey: String, invitationId: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalStudentInvitationIssuedView?, _ error: Error?) -> Void)
```

Reenviar um convite de aluno pelo personal

Reenvia um convite de aluno do personal autenticado preservando destino e mensagem herdados do convite original, que não podem ser sobrescritos: não há corpo de requisição. O reenvio cria SEMPRE um novo recurso, com novo `invitationId`, novo token de aceite e nova expiração de sete dias; o convite anterior passa a `REVOKED` e um token já expirado nunca é reativado. O replay da mesma Idempotency-Key devolve exatamente o mesmo novo convite e nunca reativa nem altera o recurso anterior. O reenvio respeita um intervalo mínimo de 60 segundos e conta nos limites de 20 por personal por dia e 5 por destino por dia. O estado de entrega permanece separado do ciclo de vida e a resposta nunca confirma existência de conta ou destino. **Reenviar é também o único caminho para obter o link copiável de novo** (`DEC-CONV-1`): como o segredo anterior é revogado, não existe recuperar o mesmo link — existe emitir outro (`INV-CONVITE-SEGREDO`). Por isso uma execução nova devolve obrigatoriamente `shareableUrl`, exatamente como na emissão; o replay da mesma Idempotency-Key devolve o recurso persistido sem reapresentar o segredo.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let invitationId = "invitationId_example" // String | Identificador público opaco do convite original que será reenviado; o personal autenticado precisa ser o dono do convite.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Reenviar um convite de aluno pelo personal
StudentInvitationsAPI.resendPersonalStudentInvitation(idempotencyKey: idempotencyKey, invitationId: invitationId, acceptLanguage: acceptLanguage) { (response, error) in
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
 **invitationId** | **String** | Identificador público opaco do convite original que será reenviado; o personal autenticado precisa ser o dono do convite. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalStudentInvitationIssuedView**](PersonalStudentInvitationIssuedView.md)

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

Leitura autenticada que projeta somente os dados seguros necessários para o aluno reconhecer e aceitar um convite. **`INV-CONVITE-GET`: resolver NUNCA consome o convite.** Esta rota aceita somente o `journeyToken` curto emitido por `createInvitationJourney`; o token bruto de convites beta anteriores deixa de resolver no cutover. O único consumo é o commit atômico único do aceite, e por isso `status` aqui só pode ser `PENDING` ou `OPENED` — `OPENED` registra apresentação, não consumo, e nenhum caminho desta operação leva a `ACCEPTED`. A resolução não cria sessão nem relação e nunca devolve nome do aluno ou destino sem máscara. `destinationMasked` vem em todo convite emitido a partir da v2, que é `email-bound` (`DEC-CONV-2`), e continua estruturalmente opcional por causa dos convites de link emitidos antes dela, que não têm destino algum. Ele é irreversivelmente mascarado e o endereço em claro nunca sai por aqui. **É o primeiro ponto autenticado da jornada, e é aqui que o próprio emissor é recusado.** Quando a conta autenticada é o personal que emitiu o convite, a resposta é `409 RELATIONSHIP_PARTIES_IDENTICAL`, sem efeito no convite: ele nunca poderá aceitá-lo, e por isso não segue para o contexto pré-aceite nem para a prova de posse do e-mail.

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
