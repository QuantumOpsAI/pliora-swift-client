# OtpJourneyChallengeResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**challengeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**expiresAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**retryAfterSeconds** | **Int** |  |
**destinationHint** | **String** | Dica mascarada e uniforme, nunca confirmação de existência de conta. |
**invitationContext** | **String** | Estado opaco do convite ligado ao challenge; nunca contém o token. &#x60;MULTIPLE_PRESERVED&#x60; diz que há mais de um convite preservado e que a escolha acontece depois, sem que nenhum deles seja consumido agora. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
