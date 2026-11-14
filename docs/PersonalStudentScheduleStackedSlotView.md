# PersonalStudentScheduleStackedSlotView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**state** | [**PersonalStudentScheduleDayState**](PersonalStudentScheduleDayState.md) | Estado desta atribuição; só &#x60;ASSIGNED_NOT_STARTED&#x60;, &#x60;ASSIGNED_COMPLETED&#x60; ou &#x60;DONE_ELSEWHERE&#x60;. |
**prescribed** | [**PersonalStudentScheduleDayPrescribed**](PersonalStudentScheduleDayPrescribed.md) |  |
**executed** | [**PersonalStudentScheduleDayExecuted**](PersonalStudentScheduleDayExecuted.md) | Referência do fato executado; &#x60;null&#x60; enquanto não há sessão concluída desta atribuição no dia. |
**doneOn** | **Date** | A data, nesta semana, da sessão que satisfez esta atribuição; presente **sempre e somente** com &#x60;DONE_ELSEWHERE&#x60;. | [optional]
**suggestedWeekdays** | Set<PlanWeekday> | Os dias sugeridos pelo personal para este treino, só quando o dia arranjado pelo aluno difere da sugestão. | [optional]
**arrangedByStudent** | **Bool** | &#x60;true&#x60; quando esta atribuição está aqui por um arranjo do aluno que difere da sugestão. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
