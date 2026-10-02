# UpdatePlanActivationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**mode** | [**PlanActivationMode**](PlanActivationMode.md) |  |
**endDate** | **Date** | Último dia de validade; ausente quando a ativação passa a não ter data de término. Nunca anterior ao início. | [optional]
**weekdaySlots** | [PlanWeekdaySlot] | Programação por dias da semana, um slot por treino; só em &#x60;WEEKDAYS&#x60;. | [optional]
**sequence** | **[String]** | Ordem dos treinos em sequência livre; só em &#x60;SEQUENCE&#x60;. Lista ordenada, sem repetição de treino. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
