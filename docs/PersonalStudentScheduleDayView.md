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

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
