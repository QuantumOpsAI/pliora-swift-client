# SetStudentBodyAuthorizationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**scope** | [**BodyAuthorizationScope**](BodyAuthorizationScope.md) |  |
**decision** | [**StudentConsentDecision**](StudentConsentDecision.md) |  |
**presentationId** | **String** | Apresentação a que o &#x60;GRANTED&#x60; se vincula; obrigatória quando &#x60;decision&#x60; é &#x60;GRANTED&#x60; e proibida de forjar — emitida somente por &#x60;getStudentBodyAuthorization&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
