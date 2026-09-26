# WorkoutSessionStartResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | A mesma identidade enviada no corpo; o servidor adota, não reemite. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão fixada da prescrição; imutável pelo resto da vida da sessão. |
**status** | [**WorkoutSessionStatus**](WorkoutSessionStatus.md) |  |
**startedAt** | **Date** | O instante declarado pelo cliente, preservado como recebido. |
**nextAction** | [**WorkoutSessionNextAction**](WorkoutSessionNextAction.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
