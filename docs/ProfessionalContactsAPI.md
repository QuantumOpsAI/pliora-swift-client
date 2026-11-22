# ProfessionalContactsAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createProfessionalContact**](ProfessionalContactsAPI.md#createprofessionalcontact) | **POST** /personal/profile/contacts | Adicionar um contato profissional opcional
[**deleteProfessionalContact**](ProfessionalContactsAPI.md#deleteprofessionalcontact) | **DELETE** /personal/profile/contacts/{contactId} | Remover um contato próprio e retirar sua publicação
[**getCurrentStudentPersonalContacts**](ProfessionalContactsAPI.md#getcurrentstudentpersonalcontacts) | **GET** /student/personal/contacts | Ler somente contatos autorizados do personal do vínculo atual
[**getOwnProfessionalContacts**](ProfessionalContactsAPI.md#getownprofessionalcontacts) | **GET** /personal/profile/contacts | Ler contatos profissionais e link público do próprio personal
[**getPublicProfessionalProfile**](ProfessionalContactsAPI.md#getpublicprofessionalprofile) | **GET** /public/personal-profiles/{profileRef} | Ler perfil público sem login e somente com contatosPUBLIC
[**replaceProfessionalContact**](ProfessionalContactsAPI.md#replaceprofessionalcontact) | **PUT** /personal/profile/contacts/{contactId} | Salvar valor e audiência do contato próprio existente


# **createProfessionalContact**
```swift
    open class func createProfessionalContact(ifMatch: String, idempotencyKey: String, createProfessionalContactRequest: CreateProfessionalContactRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: ProfessionalContactMutationView?, _ error: Error?) -> Void)
```

Adicionar um contato profissional opcional

Família DEC-PERFIL-CONTATO-1 (pliora-docsPR941§5.1.7), separada de Perfil privado, onboarding, e-mail, consentimentos e métodos de acesso. Cada item conserva audiência própria. Sem importação de número/redes da identidade/aparelho nem fetch de URL, favicon, SDK social ou preview remoto. Conteúdo e telefone não entram em log/telemetria; locale não reescreve dados autorados. Payload JSON é UTF-8 estrito, no máximo16KiB por comando, sem chaves duplicadas/HTML/controles; media type inválido415, forma inválida400, campo inválido422. Parâmetros/body são fechados; nenhum AccountId, ator ou vínculo é escolhido pelo cliente. Mutações owner-only online. Idempotency-Key obrigatória por tentativa lógica, vinculada ao ator, rota/contactId, corpo e If-Match exatos, retida24horas. Reautorização atual antes de replay conhecido; esse replay precede a revisão alterada pela própria execução e retorna o mesmo status/corpo/ETag, sem novo efeito. Mesma chave com alvo/ação/corpo/precondição diferentes409IDEMPOTENCY_CONFLICT. If-Match vem da coleção real, ausente/vazio/_*428, divergente412 sem gravação: reler mantendo draft e nova revisão humana, sem sobrescrever ou repetir automaticamente. Falha/transporte indeterminado preserva a tentativa/chave/corpo/precondição; não é cancelamento nem autorização de novo comando. Commit atualiza revisão e disponibilização pública/previews atomicamente; PUBLIC→STUDENTS e remoção não deixam dado retirado em resposta/cache corrente. Confirmar comando exige releitura owner, nunca alteração local de autoridade. Não há criação de vínculo, convite, credencial ou envio de WhatsApp. Servidor emite contactId novo/estável. audience ausente significaSTUDENTS;PUBLIC só explícito. Limite100é422 sem criar item. Cadastro profissional existente não muda e esta seção não bloqueia onboarding. Link público não é aceito no request. Ao escolher PUBLIC, exige nome profissional autorado vigente no Perfil (até120caracteres, sem truncar). Se ausente,422VALIDATION_ERROR sem efeito/revisão/recibo de commit, fieldErrors.field audience, code PROFESSIONAL_NAME_REQUIRED e message segura localizada orientando preencher o nome no Perfil. STUDENTS e onboarding não exigem nome adicional; nome não é copiado de identidade/provider.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata da coleção, ecoada verbatim da leitura/resposta owner. Ausente/vazia/_* é428; malformada é422; revisão divergente é412 sem efeito. Não usar revisão do Perfil/onboarding.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let createProfessionalContactRequest = CreateProfessionalContactRequest(kind: ProfessionalContactKind(), networkLabel: "networkLabel_example", profileUrl: "profileUrl_example", phoneNumber: "phoneNumber_example", audience: "audience_example") // CreateProfessionalContactRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Adicionar um contato profissional opcional
ProfessionalContactsAPI.createProfessionalContact(ifMatch: ifMatch, idempotencyKey: idempotencyKey, createProfessionalContactRequest: createProfessionalContactRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **ifMatch** | **String** | ETag exata da coleção, ecoada verbatim da leitura/resposta owner. Ausente/vazia/_* é428; malformada é422; revisão divergente é412 sem efeito. Não usar revisão do Perfil/onboarding. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **createProfessionalContactRequest** | [**CreateProfessionalContactRequest**](CreateProfessionalContactRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**ProfessionalContactMutationView**](ProfessionalContactMutationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProfessionalContact**
```swift
    open class func deleteProfessionalContact(contactId: String, ifMatch: String, idempotencyKey: String, acceptLanguage: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remover um contato próprio e retirar sua publicação

Família DEC-PERFIL-CONTATO-1 (pliora-docsPR941§5.1.7), separada de Perfil privado, onboarding, e-mail, consentimentos e métodos de acesso. Cada item conserva audiência própria. Sem importação de número/redes da identidade/aparelho nem fetch de URL, favicon, SDK social ou preview remoto. Conteúdo e telefone não entram em log/telemetria; locale não reescreve dados autorados. Payload JSON é UTF-8 estrito, no máximo16KiB por comando, sem chaves duplicadas/HTML/controles; media type inválido415, forma inválida400, campo inválido422. Parâmetros/body são fechados; nenhum AccountId, ator ou vínculo é escolhido pelo cliente. Mutações owner-only online. Idempotency-Key obrigatória por tentativa lógica, vinculada ao ator, rota/contactId, corpo e If-Match exatos, retida24horas. Reautorização atual antes de replay conhecido; esse replay precede a revisão alterada pela própria execução e retorna o mesmo status/corpo/ETag, sem novo efeito. Mesma chave com alvo/ação/corpo/precondição diferentes409IDEMPOTENCY_CONFLICT. If-Match vem da coleção real, ausente/vazio/_*428, divergente412 sem gravação: reler mantendo draft e nova revisão humana, sem sobrescrever ou repetir automaticamente. Falha/transporte indeterminado preserva a tentativa/chave/corpo/precondição; não é cancelamento nem autorização de novo comando. Commit atualiza revisão e disponibilização pública/previews atomicamente; PUBLIC→STUDENTS e remoção não deixam dado retirado em resposta/cache corrente. Confirmar comando exige releitura owner, nunca alteração local de autoridade. Não há criação de vínculo, convite, credencial ou envio de WhatsApp. Sem corpo. Repetição conhecida da mesma chave devolve204original após reautorização; outro comando em item removido é404uniforme. Após remover o últimoPUBLIC, link/share/preview corrente deixa de estar disponível. Não reutilizar identidade removida.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let contactId = "contactId_example" // String | Contato do próprio ator; inexistente/removido/outro owner são404CONTACT_NOT_FOUND uniformes.
let ifMatch = "ifMatch_example" // String | ETag exata da coleção, ecoada verbatim da leitura/resposta owner. Ausente/vazia/_* é428; malformada é422; revisão divergente é412 sem efeito. Não usar revisão do Perfil/onboarding.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Remover um contato próprio e retirar sua publicação
ProfessionalContactsAPI.deleteProfessionalContact(contactId: contactId, ifMatch: ifMatch, idempotencyKey: idempotencyKey, acceptLanguage: acceptLanguage) { (response, error) in
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
 **contactId** | **String** | Contato do próprio ator; inexistente/removido/outro owner são404CONTACT_NOT_FOUND uniformes. |
 **ifMatch** | **String** | ETag exata da coleção, ecoada verbatim da leitura/resposta owner. Ausente/vazia/_* é428; malformada é422; revisão divergente é412 sem efeito. Não usar revisão do Perfil/onboarding. |
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

# **getCurrentStudentPersonalContacts**
```swift
    open class func getCurrentStudentPersonalContacts(acceptLanguage: String? = nil, completion: @escaping (_ data: StudentPersonalContactsView?, _ error: Error?) -> Void)
```

Ler somente contatos autorizados do personal do vínculo atual

Família DEC-PERFIL-CONTATO-1 (pliora-docsPR941§5.1.7), separada de Perfil privado, onboarding, e-mail, consentimentos e métodos de acesso. Cada item conserva audiência própria. Sem importação de número/redes da identidade/aparelho nem fetch de URL, favicon, SDK social ou preview remoto. Conteúdo e telefone não entram em log/telemetria; locale não reescreve dados autorados. Payload JSON é UTF-8 estrito, no máximo16KiB por comando, sem chaves duplicadas/HTML/controles; media type inválido415, forma inválida400, campo inválido422. Parâmetros/body são fechados; nenhum AccountId, ator ou vínculo é escolhido pelo cliente. Servidor deriva aluno, personal e relação atuais da conta autenticada em cada leitura:ACTIVE ouPAUSED autorizaPUBLICeSTUDENTS,ENDED/outra conta/outro personal/sem vínculo não autorizaSTUDENTS e recebe403FORBIDDENsemvalor/metadado. Nenhum personalId/relationshipId/audience vem no pedido. Conta com ambos espaços não é autorização de owner. Mudança de conta/logout/encerramento invalida resposta tardia e dados restritos carregados; falha de releitura não os autoriza nem faz fallback público. Não chamarGET/personal/profilealheio nem filtrar payloadcompleto naUI. contacts[] pode servazia;503 nunca significavazio.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler somente contatos autorizados do personal do vínculo atual
ProfessionalContactsAPI.getCurrentStudentPersonalContacts(acceptLanguage: acceptLanguage) { (response, error) in
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

[**StudentPersonalContactsView**](StudentPersonalContactsView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOwnProfessionalContacts**
```swift
    open class func getOwnProfessionalContacts(acceptLanguage: String? = nil, completion: @escaping (_ data: OwnProfessionalContactsView?, _ error: Error?) -> Void)
```

Ler contatos profissionais e link público do próprio personal

Família DEC-PERFIL-CONTATO-1 (pliora-docsPR941§5.1.7), separada de Perfil privado, onboarding, e-mail, consentimentos e métodos de acesso. Cada item conserva audiência própria. Sem importação de número/redes da identidade/aparelho nem fetch de URL, favicon, SDK social ou preview remoto. Conteúdo e telefone não entram em log/telemetria; locale não reescreve dados autorados. Payload JSON é UTF-8 estrito, no máximo16KiB por comando, sem chaves duplicadas/HTML/controles; media type inválido415, forma inválida400, campo inválido422. Parâmetros/body são fechados; nenhum AccountId, ator ou vínculo é escolhido pelo cliente. Leitura completa derivada do atorPERSONAL autenticado. Até100contatos; pode ser[]; contactId único e ordem estável. Link público aparece se e somente se existePUBLIC, gerado pelo servidor sem PII/ID privado; não surge de GET nem de preferência local. As prévias do dono são recortes locais dos seus próprios dados, não autenticação simulada de aluno. ETag é revisão desta coleção, nunca revisão do Perfil.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler contatos profissionais e link público do próprio personal
ProfessionalContactsAPI.getOwnProfessionalContacts(acceptLanguage: acceptLanguage) { (response, error) in
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

[**OwnProfessionalContactsView**](OwnProfessionalContactsView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPublicProfessionalProfile**
```swift
    open class func getPublicProfessionalProfile(profileRef: String, acceptLanguage: String? = nil, completion: @escaping (_ data: PublicProfessionalProfileView?, _ error: Error?) -> Void)
```

Ler perfil público sem login e somente com contatosPUBLIC

Família DEC-PERFIL-CONTATO-1 (pliora-docsPR941§5.1.7), separada de Perfil privado, onboarding, e-mail, consentimentos e métodos de acesso. Cada item conserva audiência própria. Sem importação de número/redes da identidade/aparelho nem fetch de URL, favicon, SDK social ou preview remoto. Conteúdo e telefone não entram em log/telemetria; locale não reescreve dados autorados. Payload JSON é UTF-8 estrito, no máximo16KiB por comando, sem chaves duplicadas/HTML/controles; media type inválido415, forma inválida400, campo inválido422. Parâmetros/body são fechados; nenhum AccountId, ator ou vínculo é escolhido pelo cliente. Não autentica nem eleva com bearer: ausente/presente/inválido produz sempre o mesmo recorte público, nunca itensSTUDENTS/metadados/contagem/nomes restritos. Apenas nome profissional autorado ePUBLIC;sem avatar privado/CREF/e-mail/provider/carteira/preferências. Referência inexistente/retirada ou zeroPUBLIC é404PUBLIC_PROFILE_UNAVAILABLEuniforme, sem indicar outra audiência. Cache-Control:no-store em todos os status;retirada/troca de audiência invalida HTML/JSON/previews correntes do Pliora após commit. Backend não visita links. A página web usa só esta projeção, não sessão/DTO privado; hosting/rota web não são criados por este contrato. GET não cria efeito/vínculo. Abrir rede/WhatsApp só por gesto; WhatsApp abre conversa sem mensagem automática ou dado de pessoa/treino pré-preenchido; app ausente permiteweb/cópia sem perder contexto.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let profileRef = "profileRef_example" // String | Referência pública opaca emitida pelo servidor; não é ID privado nem bearer. Forma inválida422, indisponível404 uniforme.
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Ler perfil público sem login e somente com contatosPUBLIC
ProfessionalContactsAPI.getPublicProfessionalProfile(profileRef: profileRef, acceptLanguage: acceptLanguage) { (response, error) in
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
 **profileRef** | **String** | Referência pública opaca emitida pelo servidor; não é ID privado nem bearer. Forma inválida422, indisponível404 uniforme. |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PublicProfessionalProfileView**](PublicProfessionalProfileView.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replaceProfessionalContact**
```swift
    open class func replaceProfessionalContact(contactId: String, ifMatch: String, idempotencyKey: String, replaceProfessionalContactRequest: ReplaceProfessionalContactRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: ProfessionalContactMutationView?, _ error: Error?) -> Void)
```

Salvar valor e audiência do contato próprio existente

Família DEC-PERFIL-CONTATO-1 (pliora-docsPR941§5.1.7), separada de Perfil privado, onboarding, e-mail, consentimentos e métodos de acesso. Cada item conserva audiência própria. Sem importação de número/redes da identidade/aparelho nem fetch de URL, favicon, SDK social ou preview remoto. Conteúdo e telefone não entram em log/telemetria; locale não reescreve dados autorados. Payload JSON é UTF-8 estrito, no máximo16KiB por comando, sem chaves duplicadas/HTML/controles; media type inválido415, forma inválida400, campo inválido422. Parâmetros/body são fechados; nenhum AccountId, ator ou vínculo é escolhido pelo cliente. Mutações owner-only online. Idempotency-Key obrigatória por tentativa lógica, vinculada ao ator, rota/contactId, corpo e If-Match exatos, retida24horas. Reautorização atual antes de replay conhecido; esse replay precede a revisão alterada pela própria execução e retorna o mesmo status/corpo/ETag, sem novo efeito. Mesma chave com alvo/ação/corpo/precondição diferentes409IDEMPOTENCY_CONFLICT. If-Match vem da coleção real, ausente/vazio/_*428, divergente412 sem gravação: reler mantendo draft e nova revisão humana, sem sobrescrever ou repetir automaticamente. Falha/transporte indeterminado preserva a tentativa/chave/corpo/precondição; não é cancelamento nem autorização de novo comando. Commit atualiza revisão e disponibilização pública/previews atomicamente; PUBLIC→STUDENTS e remoção não deixam dado retirado em resposta/cache corrente. Confirmar comando exige releitura owner, nunca alteração local de autoridade. Não há criação de vínculo, convite, credencial ou envio de WhatsApp. Substitui todos os campos editáveis do mesmo tipo;audience é obrigatória, semdefault no update. contactId/tipo não mudam; inexistente/removido/alheio404uniforme. PUBLIC→STUDENTS retira da leitura pública no commit; falha não publica draft. Ao escolher PUBLIC, exige nome profissional autorado vigente no Perfil (até120caracteres, sem truncar). Se ausente,422VALIDATION_ERROR sem efeito/revisão/recibo de commit, fieldErrors.field audience, code PROFESSIONAL_NAME_REQUIRED e message segura localizada orientando preencher o nome no Perfil. STUDENTS e onboarding não exigem nome adicional; nome não é copiado de identidade/provider.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let contactId = "contactId_example" // String | Contato do próprio ator; inexistente/removido/outro owner são404CONTACT_NOT_FOUND uniformes.
let ifMatch = "ifMatch_example" // String | ETag exata da coleção, ecoada verbatim da leitura/resposta owner. Ausente/vazia/_* é428; malformada é422; revisão divergente é412 sem efeito. Não usar revisão do Perfil/onboarding.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let replaceProfessionalContactRequest = ReplaceProfessionalContactRequest(kind: ProfessionalContactKind(), networkLabel: "networkLabel_example", profileUrl: "profileUrl_example", phoneNumber: "phoneNumber_example", audience: "audience_example") // ReplaceProfessionalContactRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Salvar valor e audiência do contato próprio existente
ProfessionalContactsAPI.replaceProfessionalContact(contactId: contactId, ifMatch: ifMatch, idempotencyKey: idempotencyKey, replaceProfessionalContactRequest: replaceProfessionalContactRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **contactId** | **String** | Contato do próprio ator; inexistente/removido/outro owner são404CONTACT_NOT_FOUND uniformes. |
 **ifMatch** | **String** | ETag exata da coleção, ecoada verbatim da leitura/resposta owner. Ausente/vazia/_* é428; malformada é422; revisão divergente é412 sem efeito. Não usar revisão do Perfil/onboarding. |
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **replaceProfessionalContactRequest** | [**ReplaceProfessionalContactRequest**](ReplaceProfessionalContactRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**ProfessionalContactMutationView**](ProfessionalContactMutationView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
