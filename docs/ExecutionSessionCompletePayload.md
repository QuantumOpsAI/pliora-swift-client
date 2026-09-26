# ExecutionSessionCompletePayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**pendingDeferralResolutions** | [DeferralResolutionAtCompletion] | Uma entrada por adiamento ainda aberto no instante do encerramento; lista vazia significa que não havia pendência, nunca que ela foi ignorada. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
