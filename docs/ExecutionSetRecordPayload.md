# ExecutionSetRecordPayload

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**setExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedSetId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**setIndex** | **Int** |  |
**status** | [**ExecutedSetStatus**](ExecutedSetStatus.md) |  |
**target** | [**ExecutionTargetValues**](ExecutionTargetValues.md) |  |
**actual** | [**WorkoutSetValues**](WorkoutSetValues.md) |  | [optional]
**measuredDurationSeconds** | **Int** | Duração da série por tempo **medida pelo cronômetro da série**, em segundos. Obrigatória em série por tempo concluída ou parcial e proibida nas demais. Nunca é sobrescrita: se &#x60;actual.durationSeconds&#x60; for diferente dela, o aluno a corrigiu, e o servidor publica o valor corrigido em &#x60;adjustedDurationSeconds&#x60;. | [optional]
**executedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**equipmentInstanceId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**completedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**observation** | **String** |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
