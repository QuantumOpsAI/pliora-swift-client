# ExecutionRestRecordPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**restPeriodId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**afterSetExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**targetSeconds** | **Int** |  |
**adjustedTargetSeconds** | **Int** |  | [optional]
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**pauses** | [RestPauseInterval] |  |
**observation** | **String** |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
