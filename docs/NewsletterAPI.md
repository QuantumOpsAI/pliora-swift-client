# NewsletterAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**confirmNewsletterChallenge**](NewsletterAPI.md#confirmnewsletterchallenge) | **POST** /newsletter/confirmations | Confirmar a inscrição na newsletter pelo token da confirmação dupla
[**prepareNewsletterUnsubscription**](NewsletterAPI.md#preparenewsletterunsubscription) | **GET** /newsletter/unsubscriptions | Preparar o descadastro da newsletter sem efeito
[**presentPersonalNewsletterDocument**](NewsletterAPI.md#presentpersonalnewsletterdocument) | **POST** /personal/newsletter/presentations | Apresentar ao Personal o documento vigente de opt-in da newsletter
[**presentPublicNewsletterDocument**](NewsletterAPI.md#presentpublicnewsletterdocument) | **POST** /newsletter/presentations | Apresentar o documento vigente de opt-in da newsletter a partir de uma captura pública
[**requestPersonalNewsletterChallenge**](NewsletterAPI.md#requestpersonalnewsletterchallenge) | **POST** /personal/newsletter/challenges | Pedir a confirmação dupla da newsletter para o Personal autenticado
[**requestPublicNewsletterChallenge**](NewsletterAPI.md#requestpublicnewsletterchallenge) | **POST** /newsletter/challenges | Pedir a confirmação dupla da newsletter a partir de uma apresentação pública
[**submitNewsletterUnsubscription**](NewsletterAPI.md#submitnewsletterunsubscription) | **POST** /newsletter/unsubscriptions | Descadastrar da newsletter em um clique (RFC 8058)


# **confirmNewsletterChallenge**
```swift
    open class func confirmNewsletterChallenge(newsletterConfirmationRequest: NewsletterConfirmationRequest, completion: @escaping (_ data: NewsletterReceipt?, _ error: Error?) -> Void)
```

Confirmar a inscrição na newsletter pelo token da confirmação dupla

pliora-docs architecture/admin-operations/contracts.md §8.1 e §8.2. Anônimo; o token é a única referência e o backend recupera origem, subject e documento da challenge persistida. Token de forma válida recebe o mesmo 202 neutro, inclusive expirado, usado ou desconhecido; só challenge válida, com documento ainda vigente, concede consentimento, e repetição não regranta. Corpo com teto bruto de 1 KiB; UTF-8 estrito, chaves duplicadas, bytes após o objeto e coerção exigem validação no runtime. O transporte não interpreta nem publica a versão interna do token. Falha de keyring, owner, persistência ou commit é 503, nunca 202. Esta publicação não ativa rota no runtime (§8.4).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let newsletterConfirmationRequest = NewsletterConfirmationRequest(token: "token_example") // NewsletterConfirmationRequest |

// Confirmar a inscrição na newsletter pelo token da confirmação dupla
NewsletterAPI.confirmNewsletterChallenge(newsletterConfirmationRequest: newsletterConfirmationRequest) { (response, error) in
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
 **newsletterConfirmationRequest** | [**NewsletterConfirmationRequest**](NewsletterConfirmationRequest.md) |  |

### Return type

[**NewsletterReceipt**](NewsletterReceipt.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **prepareNewsletterUnsubscription**
```swift
    open class func prepareNewsletterUnsubscription(token: String, completion: @escaping (_ data: NewsletterUnsubscriptionPreview?, _ error: Error?) -> Void)
```

Preparar o descadastro da newsletter sem efeito

pliora-docs architecture/admin-operations/contracts.md §8.1 e §8.2. Anônimo e sem efeito: o GET nunca retira, para que scanners de link não descadastrem. O token assinado e escopado do query é a única referência; cookie, bearer, corpo ou outro filtro não contam, e query duplicada ou extra é 400 por forma. Token de assinatura inválida, revisão antiga ou já retirado recebe o mesmo 200 READY_TO_SUBMIT. O URI carrega o token e pode ficar no histórico do navegador: risco residual registrado, não ausência de cópia. Esta publicação não ativa rota no runtime (§8.4).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let token = "token_example" // String | Token opaco, assinado e escopado, emitido só na entrega autorizada da newsletter; é a única referência do descadastro (pliora-docs architecture/admin-operations/contracts.md §8.1). Único: query duplicada ou com outro parâmetro é 400 por forma. ASCII de 1 a 512 bytes, sem controles, CR/LF, barra ou fragmento. O transporte não interpreta o token.

// Preparar o descadastro da newsletter sem efeito
NewsletterAPI.prepareNewsletterUnsubscription(token: token) { (response, error) in
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
 **token** | **String** | Token opaco, assinado e escopado, emitido só na entrega autorizada da newsletter; é a única referência do descadastro (pliora-docs architecture/admin-operations/contracts.md §8.1). Único: query duplicada ou com outro parâmetro é 400 por forma. ASCII de 1 a 512 bytes, sem controles, CR/LF, barra ou fragmento. O transporte não interpreta o token. |

### Return type

[**NewsletterUnsubscriptionPreview**](NewsletterUnsubscriptionPreview.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **presentPersonalNewsletterDocument**
```swift
    open class func presentPersonalNewsletterDocument(body: AnyCodable, acceptLanguage: String? = nil, completion: @escaping (_ data: NewsletterDocumentPresentation?, _ error: Error?) -> Void)
```

Apresentar ao Personal o documento vigente de opt-in da newsletter

pliora-docs architecture/admin-operations/contracts.md §8.1. Emite o documento NEWSLETTER_OPT_IN aprovado e um presentationRef opaco; não concede consentimento, não afirma que o texto foi lido e não é endpoint de consulta de conta. O owner lê sessão, papel Personal, e-mail verificado, exclusão e documento vigente; nenhuma identidade, endereço, papel ou ambiente vem do cliente, e inelegibilidade comprovada não muda status, schema nem headers (§8.2). O corpo é exatamente {} com teto bruto de 1 KiB antes do parse. UTF-8 estrito, chaves duplicadas e bytes após o objeto exigem validação no runtime: o schema não a prova. Texto ausente, documento não aprovado ou digest divergente do catálogo é 503, nunca ref com documento implícito. NEWSLETTER_OPT_IN é distinto de PLATFORM_CONTACT, termos e notificações; o texto legal é servido e versionado pelo catálogo do servidor. Esta publicação não ativa rota no runtime (§8.4).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let body = "TODO" // AnyCodable |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Apresentar ao Personal o documento vigente de opt-in da newsletter
NewsletterAPI.presentPersonalNewsletterDocument(body: body, acceptLanguage: acceptLanguage) { (response, error) in
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
 **body** | **AnyCodable** |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**NewsletterDocumentPresentation**](NewsletterDocumentPresentation.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **presentPublicNewsletterDocument**
```swift
    open class func presentPublicNewsletterDocument(newsletterPublicPresentationRequest: NewsletterPublicPresentationRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: NewsletterDocumentPresentation?, _ error: Error?) -> Void)
```

Apresentar o documento vigente de opt-in da newsletter a partir de uma captura pública

pliora-docs architecture/admin-operations/contracts.md §8.1. Anônimo. O corpo fechado leva só o captureReceipt recebido no header X-Pliora-Capture-Receipt da captura de lead (leads §2); o receipt não autentica e-mail nem identidade, e nunca vai em query. Receipt conhecido, neutro ou desconhecido de forma válida recebe o mesmo 200 com os quatro campos, sem revelar lead elegível (§8.2). Corpo com teto bruto de 1 KiB antes do parse; UTF-8 estrito, chaves duplicadas e bytes após o objeto exigem validação no runtime. Fonte ou policy inconclusiva e catálogo sem texto aprovado ou com digest divergente são 503, nunca ausência presumida. Este wire não cria lead e não aceita e-mail, subject, originCode, documentVersion ou operatorId do caller. CORS admite só origens aprovadas do portal, sem credenciais. Esta publicação não ativa rota no runtime (§8.4).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let newsletterPublicPresentationRequest = NewsletterPublicPresentationRequest(captureReceipt: "captureReceipt_example") // NewsletterPublicPresentationRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Apresentar o documento vigente de opt-in da newsletter a partir de uma captura pública
NewsletterAPI.presentPublicNewsletterDocument(newsletterPublicPresentationRequest: newsletterPublicPresentationRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **newsletterPublicPresentationRequest** | [**NewsletterPublicPresentationRequest**](NewsletterPublicPresentationRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**NewsletterDocumentPresentation**](NewsletterDocumentPresentation.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestPersonalNewsletterChallenge**
```swift
    open class func requestPersonalNewsletterChallenge(idempotencyKey: UUID, newsletterChallengeRequest: NewsletterChallengeRequest, completion: @escaping (_ data: NewsletterReceipt?, _ error: Error?) -> Void)
```

Pedir a confirmação dupla da newsletter para o Personal autenticado

pliora-docs architecture/admin-operations/contracts.md §8.1 e §8.2. O corpo fechado leva só presentationRef e affirmed:true; false, null, string ou chave extra são 400, com teto bruto de 1 KiB antes do parse. A ref deve estar vigente, não consumida e ligada à mesma sessão, Personal e ambiente; ref desconhecida, expirada, usada por outra chave ou de contexto divergente é 409 PRESENTATION_REQUIRED, e documento trocado desde a apresentação é 409 DOCUMENT_CHANGED, sem challenge nem outbox. A mesma Idempotency-Key com o mesmo pedido recupera o recibo original sem criar ou enfileirar outro token, inclusive depois do consumo da ref; pedido divergente com a chave é 409 IDEMPOTENCY_CONFLICT. O 202 é neutro, só sai após o commit único de challenge, outbox, consumo da ref e recibo de idempotência, e não afirma consentimento nem entrega. Falha de owner, policy, custódia ou commit é 503, nunca 202. Nenhum accountId, endereço, papel ou ambiente vem do cliente. Esta publicação não ativa rota no runtime (§8.4).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = 987 // UUID | UUID canônico minúsculo não nil, por tentativa lógica, escopado à fonte e à apresentação verificadas e ao pedido protegido (pliora-docs architecture/admin-operations/contracts.md §8.2). Ausente ou malformada é 400 antes de procurar sujeito; reusada com pedido divergente é 409 IDEMPOTENCY_CONFLICT.
let newsletterChallengeRequest = NewsletterChallengeRequest(presentationRef: "presentationRef_example", affirmed: false) // NewsletterChallengeRequest |

// Pedir a confirmação dupla da newsletter para o Personal autenticado
NewsletterAPI.requestPersonalNewsletterChallenge(idempotencyKey: idempotencyKey, newsletterChallengeRequest: newsletterChallengeRequest) { (response, error) in
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
 **idempotencyKey** | **UUID** | UUID canônico minúsculo não nil, por tentativa lógica, escopado à fonte e à apresentação verificadas e ao pedido protegido (pliora-docs architecture/admin-operations/contracts.md §8.2). Ausente ou malformada é 400 antes de procurar sujeito; reusada com pedido divergente é 409 IDEMPOTENCY_CONFLICT. |
 **newsletterChallengeRequest** | [**NewsletterChallengeRequest**](NewsletterChallengeRequest.md) |  |

### Return type

[**NewsletterReceipt**](NewsletterReceipt.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **requestPublicNewsletterChallenge**
```swift
    open class func requestPublicNewsletterChallenge(idempotencyKey: UUID, newsletterChallengeRequest: NewsletterChallengeRequest, completion: @escaping (_ data: NewsletterReceipt?, _ error: Error?) -> Void)
```

Pedir a confirmação dupla da newsletter a partir de uma apresentação pública

pliora-docs architecture/admin-operations/contracts.md §8.1 e §8.2. Anônimo, com o mesmo corpo fechado e as mesmas regras de ref, documento e Idempotency-Key do pedido Personal, inclusive o teto bruto de 1 KiB antes do parse e a validação de UTF-8 estrito e chaves duplicadas no runtime. A presentationRef vincula o captureReceipt e, quando houver, o PlatformLead elegível; origem elegível ou não recebe o mesmo 202 neutro depois da admissão durável, e challenge só existe para lead comprovado. Sem e-mail, subject ou origem livre no pedido. Falha de owner, policy, custódia ou commit é 503, nunca 202. CORS admite só origens aprovadas do portal, sem credenciais. Esta publicação não ativa rota no runtime (§8.4).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let idempotencyKey = 987 // UUID | UUID canônico minúsculo não nil, por tentativa lógica, escopado à fonte e à apresentação verificadas e ao pedido protegido (pliora-docs architecture/admin-operations/contracts.md §8.2). Ausente ou malformada é 400 antes de procurar sujeito; reusada com pedido divergente é 409 IDEMPOTENCY_CONFLICT.
let newsletterChallengeRequest = NewsletterChallengeRequest(presentationRef: "presentationRef_example", affirmed: false) // NewsletterChallengeRequest |

// Pedir a confirmação dupla da newsletter a partir de uma apresentação pública
NewsletterAPI.requestPublicNewsletterChallenge(idempotencyKey: idempotencyKey, newsletterChallengeRequest: newsletterChallengeRequest) { (response, error) in
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
 **idempotencyKey** | **UUID** | UUID canônico minúsculo não nil, por tentativa lógica, escopado à fonte e à apresentação verificadas e ao pedido protegido (pliora-docs architecture/admin-operations/contracts.md §8.2). Ausente ou malformada é 400 antes de procurar sujeito; reusada com pedido divergente é 409 IDEMPOTENCY_CONFLICT. |
 **newsletterChallengeRequest** | [**NewsletterChallengeRequest**](NewsletterChallengeRequest.md) |  |

### Return type

[**NewsletterReceipt**](NewsletterReceipt.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **submitNewsletterUnsubscription**
```swift
    open class func submitNewsletterUnsubscription(token: String, listUnsubscribe: ListUnsubscribe_submitNewsletterUnsubscription, completion: @escaping (_ data: NewsletterReceipt?, _ error: Error?) -> Void)
```

Descadastrar da newsletter em um clique (RFC 8058)

pliora-docs architecture/admin-operations/contracts.md §8.1 e §8.2. Anônimo, no mesmo URI HTTPS do GET; Cookie e Authorization são ignorados como autoridade. O formulário fechado tem exatamente o par List-Unsubscribe=One-Click, em application/x-www-form-urlencoded ou multipart/form-data, sem arquivo e sem campo extra, com teto bruto de 2 KiB; o parser limita campos, partes, tamanho e boundary antes de alocar. Responde 202 neutro sem redirect e sem Location; token válido retira no owner na transação, e replay, revisão antiga, token expirado ou desconhecido não criam novo efeito. POST de mail client sem Origin continua válido quando token e corpo passam nas guardas. Falha de keyring, owner, persistência ou commit é 503, nunca 202. Esta publicação não ativa rota no runtime (§8.4).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let token = "token_example" // String | Token opaco, assinado e escopado, emitido só na entrega autorizada da newsletter; é a única referência do descadastro (pliora-docs architecture/admin-operations/contracts.md §8.1). Único: query duplicada ou com outro parâmetro é 400 por forma. ASCII de 1 a 512 bytes, sem controles, CR/LF, barra ou fragmento. O transporte não interpreta o token.
let listUnsubscribe = "listUnsubscribe_example" // String |

// Descadastrar da newsletter em um clique (RFC 8058)
NewsletterAPI.submitNewsletterUnsubscription(token: token, listUnsubscribe: listUnsubscribe) { (response, error) in
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
 **token** | **String** | Token opaco, assinado e escopado, emitido só na entrega autorizada da newsletter; é a única referência do descadastro (pliora-docs architecture/admin-operations/contracts.md §8.1). Único: query duplicada ou com outro parâmetro é 400 por forma. ASCII de 1 a 512 bytes, sem controles, CR/LF, barra ou fragmento. O transporte não interpreta o token. |
 **listUnsubscribe** | **String** |  |

### Return type

[**NewsletterReceipt**](NewsletterReceipt.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
