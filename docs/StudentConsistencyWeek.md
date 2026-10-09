# StudentConsistencyWeek

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**weekStart** | **Date** | A segunda-feira da semana. |
**weekEnd** | **Date** | O domingo da semana, seis dias depois de &#x60;weekStart&#x60;. |
**sessionsCompleted** | **Int** | As sessões &#x60;COMPLETED&#x60; com &#x60;localDate&#x60; na semana, inclusive a encerrada automaticamente como concluída; a descartada não conta. |
**workoutsPlanned** | **Int** | Quantos treinos os dias da ativação vigente na semana preveem. **Ausente** em sequência livre e em semana sem ativação vigente; nunca zero. | [optional]
**partialWeek** | **Bool** | A semana ainda não terminou em &#x60;asOf&#x60;, a corrente, que é a última da lista. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
