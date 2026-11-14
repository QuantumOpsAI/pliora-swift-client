# StudentScheduleStackedSlotView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutName** | **String** | Nome do treino, conteúdo autorado preservado verbatim e invariante de locale. |
**workoutFocus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente para versão publicada antes de o foco autorado existir. |
**status** | [**StudentScheduleDayStatus**](StudentScheduleDayStatus.md) | Estado deste slot: só &#x60;SCHEDULED&#x60;, &#x60;RECOMMENDED_TODAY&#x60;, &#x60;PENDING&#x60;, &#x60;INCOMPLETE&#x60;, &#x60;COMPLETED&#x60; ou &#x60;DONE_ELSEWHERE&#x60;. |
**doneOn** | **Date** | A data, nesta semana, da sessão que satisfez este slot; presente **sempre e somente** com &#x60;DONE_ELSEWHERE&#x60;. | [optional]
**suggestedWeekdays** | Set<PlanWeekday> | Os dias sugeridos pelo personal para este treino, só quando o dia arranjado pelo aluno difere da sugestão. | [optional]
**lastCompletedOn** | **Date** | Dia civil em que o aluno concluiu este treino pela última vez; ausente quando nunca o concluiu. | [optional]
**timesThisWeek** | **Int** | Quantas sessões concluídas deste treino o aluno tem nesta semana. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
