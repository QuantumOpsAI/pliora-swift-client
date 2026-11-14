# StudentWeekPushPreviewDayView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**date** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**past** | **Bool** | &#x60;true&#x60; para dia anterior a hoje: como a agenda o mostra; não muda. |
**restRequired** | **Bool** | &#x60;true&#x60; para dia de descanso obrigatório em vigor. |
**workouts** | [StudentWeekPushPreviewWorkoutView] | Os treinos do dia depois dos &#x60;moves&#x60;, em ordem do plano; vazio é descanso. O pendente levado a outro dia continua no dia passado dele, com &#x60;moved: false&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
