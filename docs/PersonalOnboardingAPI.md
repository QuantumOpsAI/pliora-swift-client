# PersonalOnboardingAPI

All URIs are relative to */api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completePersonalOnboarding**](PersonalOnboardingAPI.md#completepersonalonboarding) | **POST** /personal/onboarding/complete | Concluir o onboarding do personal
[**getPersonalOnboarding**](PersonalOnboardingAPI.md#getpersonalonboarding) | **GET** /personal/onboarding | Obter o progresso de onboarding do personal
[**savePersonalPreferences**](PersonalOnboardingAPI.md#savepersonalpreferences) | **PUT** /personal/onboarding/preferences | Salvar as preferências do personal
[**savePersonalProfile**](PersonalOnboardingAPI.md#savepersonalprofile) | **PUT** /personal/onboarding/profile | Salvar o perfil profissional do personal
[**savePersonalSpecialties**](PersonalOnboardingAPI.md#savepersonalspecialties) | **PUT** /personal/onboarding/specialties | Salvar as especialidades declaradas pelo personal
[**savePersonalWorkStyle**](PersonalOnboardingAPI.md#savepersonalworkstyle) | **PUT** /personal/onboarding/work-style | Salvar o modo de trabalho declarado pelo personal


# **completePersonalOnboarding**
```swift
    open class func completePersonalOnboarding(ifMatch: String, idempotencyKey: String, completePersonalOnboardingRequest: CompletePersonalOnboardingRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalOnboardingView?, _ error: Error?) -> Void)
```

Concluir o onboarding do personal

Conclui o onboarding por compare-and-set. O grupo de perfil **não é pulável**: concluir com `PROFILE` ainda não concluído é recusado com `409 INVALID_ONBOARDING_TRANSITION`, porque um personal que aparece para alunos precisa de um nome que ele mesmo autorou e o servidor nunca inventa um. Os demais passos continuam puláveis e a conclusão os resolve como `SKIPPED`. A ausência do registro profissional mínimo não impede COMPLETED, mas mantém canInvite falso; elegibilidade é calculada exclusivamente pelo servidor. O replay da mesma Idempotency-Key com o mesmo payload reproduz a resposta original antes de avaliar novamente o CAS; a mesma chave com payload diferente retorna IDEMPOTENCY_CONFLICT.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let idempotencyKey = "idempotencyKey_example" // String | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação.
let completePersonalOnboardingRequest = CompletePersonalOnboardingRequest(revision: "revision_example") // CompletePersonalOnboardingRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Concluir o onboarding do personal
PersonalOnboardingAPI.completePersonalOnboarding(ifMatch: ifMatch, idempotencyKey: idempotencyKey, completePersonalOnboardingRequest: completePersonalOnboardingRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **idempotencyKey** | **String** | Chave opaca gerada pelo cliente para uma tentativa lógica de mutação. |
 **completePersonalOnboardingRequest** | [**CompletePersonalOnboardingRequest**](CompletePersonalOnboardingRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalOnboardingView**](PersonalOnboardingView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonalOnboarding**
```swift
    open class func getPersonalOnboarding(acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalOnboardingView?, _ error: Error?) -> Void)
```

Obter o progresso de onboarding do personal

Retorna somente o onboarding do personal autenticado. O servidor é a autoridade da revisão, do progresso e da próxima ação.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Obter o progresso de onboarding do personal
PersonalOnboardingAPI.getPersonalOnboarding(acceptLanguage: acceptLanguage) { (response, error) in
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

[**PersonalOnboardingView**](PersonalOnboardingView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **savePersonalPreferences**
```swift
    open class func savePersonalPreferences(ifMatch: String, savePersonalPreferencesRequest: SavePersonalPreferencesRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalOnboardingView?, _ error: Error?) -> Void)
```

Salvar as preferências do personal

Atualiza por compare-and-set somente preferências aprovadas para a primeira versão. A preferência de lembretes não representa nem transporta a permissão de notificações do sistema operacional. Salvar este passo com o grupo de perfil ainda em aberto é recusado com `409 INVALID_ONBOARDING_TRANSITION` e `blockingStepKey: PROFILE`, porque avançar resolveria o perfil como `SKIPPED` e o perfil não é pulável.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let savePersonalPreferencesRequest = SavePersonalPreferencesRequest(measurementSystem: PersonalMeasurementSystem(), theme: PersonalTheme(), firstDayOfWeek: PersonalFirstDayOfWeek(), remindersEnabled: false, revision: "revision_example") // SavePersonalPreferencesRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Salvar as preferências do personal
PersonalOnboardingAPI.savePersonalPreferences(ifMatch: ifMatch, savePersonalPreferencesRequest: savePersonalPreferencesRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **savePersonalPreferencesRequest** | [**SavePersonalPreferencesRequest**](SavePersonalPreferencesRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalOnboardingView**](PersonalOnboardingView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **savePersonalProfile**
```swift
    open class func savePersonalProfile(ifMatch: String, savePersonalProfileRequest: SavePersonalProfileRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalOnboardingView?, _ error: Error?) -> Void)
```

Salvar o perfil profissional do personal

Atualiza o perfil por compare-and-set. Não valida registro em CONFEF/CREF, não aceita avatar e nunca aplica last-write-wins.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let savePersonalProfileRequest = SavePersonalProfileRequest(displayName: "displayName_example", professionalRegistration: ProfessionalRegistrationInput(registrationNumber: "registrationNumber_example", region: BrazilianState()), city: "city_example", revision: "revision_example") // SavePersonalProfileRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Salvar o perfil profissional do personal
PersonalOnboardingAPI.savePersonalProfile(ifMatch: ifMatch, savePersonalProfileRequest: savePersonalProfileRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **savePersonalProfileRequest** | [**SavePersonalProfileRequest**](SavePersonalProfileRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalOnboardingView**](PersonalOnboardingView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **savePersonalSpecialties**
```swift
    open class func savePersonalSpecialties(ifMatch: String, savePersonalSpecialtiesRequest: SavePersonalSpecialtiesRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalOnboardingView?, _ error: Error?) -> Void)
```

Salvar as especialidades declaradas pelo personal

Atualiza declarações de atuação por compare-and-set. Especialidades não concedem capabilities nem representam certificação profissional. Salvar este passo com o grupo de perfil ainda em aberto é recusado com `409 INVALID_ONBOARDING_TRANSITION` e `blockingStepKey: PROFILE`, porque avançar resolveria o perfil como `SKIPPED` e o perfil não é pulável.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let savePersonalSpecialtiesRequest = SavePersonalSpecialtiesRequest(specialties: [PersonalSpecialty()], otherSpecialty: "otherSpecialty_example", revision: "revision_example") // SavePersonalSpecialtiesRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Salvar as especialidades declaradas pelo personal
PersonalOnboardingAPI.savePersonalSpecialties(ifMatch: ifMatch, savePersonalSpecialtiesRequest: savePersonalSpecialtiesRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **savePersonalSpecialtiesRequest** | [**SavePersonalSpecialtiesRequest**](SavePersonalSpecialtiesRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalOnboardingView**](PersonalOnboardingView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **savePersonalWorkStyle**
```swift
    open class func savePersonalWorkStyle(ifMatch: String, savePersonalWorkStyleRequest: SavePersonalWorkStyleRequest, acceptLanguage: String? = nil, completion: @escaping (_ data: PersonalOnboardingView?, _ error: Error?) -> Void)
```

Salvar o modo de trabalho declarado pelo personal

Atualiza por compare-and-set declarações usadas somente para personalização. Os dados não concedem autorização, agenda ou prescrição e podem ser omitidos ao pular o passo. Salvar este passo com o grupo de perfil ainda em aberto é recusado com `409 INVALID_ONBOARDING_TRANSITION` e `blockingStepKey: PROFILE`, porque avançar resolveria o perfil como `SKIPPED` e o perfil não é pulável.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import FitAppClientSwift

let ifMatch = "ifMatch_example" // String | ETag exata da revisão lida pelo cliente; impede last-write-wins.
let savePersonalWorkStyleRequest = SavePersonalWorkStyleRequest(studentRange: PersonalStudentRange(), workoutReviewFrequencyWeeks: 123, usesWorkoutTemplates: false, revision: "revision_example") // SavePersonalWorkStyleRequest |
let acceptLanguage = "acceptLanguage_example" // String | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q=0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. (optional)

// Salvar o modo de trabalho declarado pelo personal
PersonalOnboardingAPI.savePersonalWorkStyle(ifMatch: ifMatch, savePersonalWorkStyleRequest: savePersonalWorkStyleRequest, acceptLanguage: acceptLanguage) { (response, error) in
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
 **savePersonalWorkStyleRequest** | [**SavePersonalWorkStyleRequest**](SavePersonalWorkStyleRequest.md) |  |
 **acceptLanguage** | **String** | Preferência conforme RFC 9110. Canonicalizar tags BCP 47; descartar item inválido ou q&#x3D;0; ordenar por q decrescente e primeira posição no empate; consolidar duplicatas pela maior preferência e primeira posição associada a ela; selecionar somente match exato em {pt-BR, en-US}. pt, en, pt-PT e en-GB não implicam região. Wildcard elegível, ausência, valor integralmente inválido ou falta de match resolvem para pt-BR. Influencia somente server_localized e formatação autorizada; nunca altera client_owned, editorial, authored_preserved ou machine_code. | [optional]

### Return type

[**PersonalOnboardingView**](PersonalOnboardingView.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)
