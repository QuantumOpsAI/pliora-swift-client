# ExecutionRestRecordPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**restPeriodId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**afterSetExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**targetSeconds** | **Int** | Descanso prescrito depois da série, em segundos. Ausente quando não há descanso prescrito; a ausência nunca é zero. | [optional]
**adjustedTargetSeconds** | **Int** | Alvo ajustado pelo aluno; só existe quando &#x60;targetSeconds&#x60; existe. | [optional]
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**pauses** | [RestPauseInterval] |  |
**observation** | **String** |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
