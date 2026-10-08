# StudentWorkoutSessionResultSet

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**setExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | [**ExecutedSetStatus**](ExecutedSetStatus.md) |  |
**roundIndex** | **Int** | A rodada da série, em exercício de bloco combinado — igual ao &#x60;setIndex&#x60; prescrito. Ausente fora de bloco. | [optional]
**prescribed** | [**WorkoutSummarySetView**](WorkoutSummarySetView.md) |  |
**target** | [**ExecutionTargetValues**](ExecutionTargetValues.md) |  |
**actual** | [**WorkoutSetValues**](WorkoutSetValues.md) |  |
**restOvertimeSeconds** | **Int** | O excedente do descanso depois da série: o medido menos o alvo efetivo (&#x60;adjustedTargetSeconds&#x60; quando presente, senão &#x60;targetSeconds&#x60;), nunca negativo. Derivado na leitura, nunca gravado. **Ausente** quando a série não tem descanso registrado ou o descanso não tinha alvo: sem alvo não há excedente, e a ausência nunca vira zero. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
