# ExecutionSetAmendPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amendmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**setExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**replacement** | [**WorkoutSetValues**](WorkoutSetValues.md) | Os valores corrigidos. Ausente ou nulo quando a correção é do estado (&#x60;status&#x60;). | [optional]
**status** | **String** | O estado corrigido (&#x60;DOC-STUDENT-WORKOUT&#x60; §7.3): &#x60;SKIPPED&#x60; é &#x60;Não fiz&#x60; e &#x60;RECORDED_BY_MISTAKE&#x60; é &#x60;Registrado por engano&#x60;. Ausente ou nulo quando a correção é dos valores (&#x60;replacement&#x60;). | [optional]
**reason** | **String** |  | [optional]
**amendedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
