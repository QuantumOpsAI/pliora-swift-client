# StudentScheduleExtraWorkoutView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome do treino, conteúdo autorado preservado verbatim e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente quando o personal não declarou. |
**lastCompletedOn** | **Date** | Dia civil em que o aluno concluiu este extra pela última vez; ausente quando nunca o concluiu. | [optional]
**timesThisWeek** | **Int** | Quantas sessões concluídas deste extra o aluno tem nesta semana. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
