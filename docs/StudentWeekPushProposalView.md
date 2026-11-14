# StudentWeekPushProposalView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**weekStart** | **Date** | A segunda-feira da semana corrente. |
**scope** | **String** | Sempre &#x60;Só nesta semana&#x60;; o arranjo padrão nunca muda. |
**collision** | **String** | Sempre &#x60;STACK&#x60;: cada treino deslocado tem o próprio movimento, então nada é trocado implicitamente. |
**moves** | [StudentWeekArrangementMove] | Os movimentos, na ordem da fila, na forma de &#x60;StudentWeekArrangementMove&#x60;: com &#x60;weekday&#x60; o treino vai para esse dia; **sem &#x60;weekday&#x60; vai para Sem dia** (o excedente que não cabe até domingo, ou o treino cujo intervalo mínimo não fecharia). |
**days** | [StudentWeekPushPreviewDayView] | Os sete dias da semana de &#x60;weekStart&#x60;, em ordem, depois dos &#x60;moves&#x60;. |
**unscheduled** | [StudentWeekPushPreviewWorkoutView] | O grupo Sem dia depois dos &#x60;moves&#x60;; vazio quando não há. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
