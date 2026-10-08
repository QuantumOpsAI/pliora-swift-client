# RestPeriodSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**restPeriodId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**afterSetExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**targetSeconds** | **Int** | Descanso prescrito, em segundos; ausente quando não havia prescrição, nunca zero. | [optional]
**adjustedTargetSeconds** | **Int** | Alvo ajustado pelo aluno; só existe quando &#x60;targetSeconds&#x60; existe. | [optional]
**measuredSeconds** | **Int** | Derivado no servidor de início, fim e pausas. |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**endedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
