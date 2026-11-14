# PersonalStudentScheduleDayView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**state** | [**PersonalStudentScheduleDayState**](PersonalStudentScheduleDayState.md) |  |
**prescribed** | [**PersonalStudentScheduleDayPrescribed**](PersonalStudentScheduleDayPrescribed.md) | Referência prescrita do dia; &#x60;null&#x60; fora do período do vínculo e sem atribuição. |
**executed** | [**PersonalStudentScheduleDayExecuted**](PersonalStudentScheduleDayExecuted.md) | Referência do fato executado; &#x60;null&#x60; enquanto não há sessão concluída no dia. |
**doneOn** | **Date** | A data, nesta semana, da sessão que satisfez a atribuição deste dia; presente **sempre e somente** com &#x60;state&#x60; &#x60;DONE_ELSEWHERE&#x60;. | [optional]
**placedSessions** | [PersonalStudentSchedulePlacedSessionView] | As sessões colocadas nesta data que não são a atribuição do dia, em ordem de início. Vazia quando não há nenhuma; nunca ausente. |
**stackedSlots** | [PersonalStudentScheduleStackedSlotView] | As outras atribuições do mesmo dia quando há empilhamento, em ordem do plano; a primeira fica nos campos do dia. **Vazia quando não há empilhamento; nunca ausente.** Só existe num dia com atribuição (&#x60;prescribed&#x60; não nulo) e é sempre vazia em sequência livre. |
**suggestedWeekdays** | Set<PlanWeekday> | Os dias sugeridos pelo personal para o treino deste dia, só quando o dia arranjado pelo aluno difere da sugestão (&#x60;sugerido: terça&#x60;); ausente com &#x60;view&#x3D;SUGGESTED&#x60;. | [optional]
**arrangedByStudent** | **Bool** | &#x60;true&#x60; quando o treino deste dia está aqui por um arranjo do aluno que difere da sugestão; sempre &#x60;false&#x60; com &#x60;view&#x3D;SUGGESTED&#x60; e em sequência livre. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
