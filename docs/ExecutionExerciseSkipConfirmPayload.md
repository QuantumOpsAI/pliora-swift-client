# ExecutionExerciseSkipConfirmPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**skipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**deferralId** | **String** | Adiamento que este pulo encerra, quando o exercício vinha adiado. Liga a confirmação à pendência e permite encerrar a sessão sem perder o fato. | [optional]
**prescribedPosition** | **Int** |  |
**executedPosition** | **Int** |  |
**reason** | **String** |  |
**skippedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
