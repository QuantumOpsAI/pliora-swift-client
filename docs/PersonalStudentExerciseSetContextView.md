# PersonalStudentExerciseSetContextView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**setIndex** | **Int** |  |
**status** | [**ExecutedSetStatus**](ExecutedSetStatus.md) |  |
**setType** | [**PrescribedSetType**](PrescribedSetType.md) | Tipo da série prescrita (&#x60;LE-16&#x60;): a comparação entre séries considera só as do mesmo tipo, e a de aquecimento não entra em maior carga nem em volume. Ausente quando não houve prescrição registrada. | [optional]
**loadPercent** | **Double** | Percentual da carga de referência com que a série foi prescrita; ausente quando a carga prescrita não era em percentual. É o prescrito e nunca vira carga: em &#x60;prescribed&#x60;, &#x60;loadValue&#x60; e &#x60;loadUnit&#x60; ficam nulos, e a carga **executada** está em &#x60;actual&#x60;. | [optional]
**prescribed** | [**WorkoutSetValues**](WorkoutSetValues.md) | Valores prescritos da série. &#x60;null&#x60; quando não houve prescrição registrada — e nenhum valor presumido é preenchido para destravar a comparação. |
**target** | [**ExecutionTargetValues**](ExecutionTargetValues.md) | Alvo operacional efetivamente apresentado, com a origem da decisão preservada. &#x60;null&#x60; quando não houve alvo registrado. |
**actual** | [**WorkoutSetValues**](WorkoutSetValues.md) | Valores realizados. &#x60;null&#x60; quando a série não foi realizada. |
**measuredDurationSeconds** | **Int** | Duração medida pelo cronômetro da série por tempo; nunca é sobrescrita. Ausente fora da série por tempo e na série pulada. | [optional]
**adjustedDurationSeconds** | **Int** | Duração que o aluno corrigiu; existe somente quando difere da medida, e então é a que consta em &#x60;actual.durationSeconds&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
