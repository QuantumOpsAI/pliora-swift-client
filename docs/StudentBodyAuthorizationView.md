# StudentBodyAuthorizationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**scope** | [**BodyAuthorizationScope**](BodyAuthorizationScope.md) |  |
**decision** | [**StudentBodyAuthorizationDecision**](StudentBodyAuthorizationDecision.md) |  |
**effectiveAccess** | [**BodyAuthorizationEffectiveAccess**](BodyAuthorizationEffectiveAccess.md) |  |
**revision** | **String** | Revisão opaca da autorização corporal; &#x60;If-Match&#x60; de &#x60;setStudentBodyAuthorization&#x60; a ecoa. &#x60;0&#x60; enquanto nenhum ato foi gravado. |
**asOf** | **Date** | Instante do servidor em que este estado foi projetado. |
**presentation** | [**BodyDocumentPresentation**](BodyDocumentPresentation.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
