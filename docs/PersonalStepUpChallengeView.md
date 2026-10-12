# PersonalStepUpChallengeView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challengeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**revision** | **String** | Revisão do desafio emitido — o &#x60;ETag&#x60; desta resposta, a ecoar em &#x60;If-Match&#x60; na verificação. |
**purpose** | [**StepUpPurpose**](StepUpPurpose.md) |  |
**targetRef** | **String** | Eco da referência opaca declarada, para conferência do cliente. |
**targetVersion** | **Int** |  |
**targetRevision** | **String** |  |
**mutationIntentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**publicKey** | [**WebAuthnPublicKeyCredentialRequestOptions**](WebAuthnPublicKeyCredentialRequestOptions.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
