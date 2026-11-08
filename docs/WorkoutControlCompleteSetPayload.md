# WorkoutControlCompleteSetPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**setExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**expectedSetRevision** | **String** | Revisão opaca definida pelo servidor. O cliente compara somente por igualdade, nunca infere ordem e nunca a cria; &#x60;expectedRevision&#x60; e &#x60;canonicalRevision&#x60; apenas ecoam um valor lido do servidor. |
**status** | **String** |  |
**actual** | [**WorkoutControlEntryValues**](WorkoutControlEntryValues.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
