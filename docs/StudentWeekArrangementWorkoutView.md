# StudentWeekArrangementWorkoutView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome do treino, conteúdo autorado preservado verbatim e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; nulo somente para versão publicada antes de o foco autorado existir. |
**suggestedWeekdays** | Set<PlanWeekday> | Os dias da semana sugeridos pelo personal para este treino, em ordem da semana; nunca alterados pelo aluno. Todo treino do conjunto semanal tem ao menos um. |
**weekday** | [**PlanWeekday**](PlanWeekday.md) | O dia efetivo do treino na semana de &#x60;weekStart&#x60;; **&#x60;null&#x60; é Sem dia**. Com &#x60;weekdaySource&#x60; &#x60;THIS_WEEK&#x60; é o ajuste desta semana (&#x60;Só nesta semana&#x60;); com &#x60;DEFAULT&#x60;, o arranjo padrão do aluno (&#x60;Nesta e nas próximas&#x60;); com &#x60;SUGGESTION&#x60;, a sugestão do personal, e então nunca é &#x60;null&#x60;: é o primeiro dia de &#x60;suggestedWeekdays&#x60; em ordem da semana, e o treino vale em **todos** os dias de &#x60;suggestedWeekdays&#x60;. |
**weekdaySource** | **String** | De onde vem &#x60;weekday&#x60;, na ordem da resolução (&#x60;DOC-STUDENT-WEEK-TECH&#x60; §2.3): &#x60;THIS_WEEK&#x60; quando há ajuste desta semana; senão &#x60;DEFAULT&#x60; quando há arranjo padrão; senão &#x60;SUGGESTION&#x60;. |
**doneThisWeek** | **Bool** | &#x60;true&#x60; quando o treino já tem sessão nesta semana: não se move (&#x60;Treino já feito nesta semana não se move.&#x60;), e a tentativa é &#x60;409 WORKOUT_DONE_THIS_WEEK&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
