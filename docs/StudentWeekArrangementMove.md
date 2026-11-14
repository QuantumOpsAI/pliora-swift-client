# StudentWeekArrangementMove

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**weekday** | [**PlanWeekday**](PlanWeekday.md) | O dia de destino. **Ausente ou &#x60;null&#x60; é Sem dia**: cada item de &#x60;moves&#x60; é um movimento explícito, então a omissão não é ambígua (e o cliente que omite nulos ao serializar consegue pedir Sem dia). Na semana corrente, dia anterior a hoje é &#x60;422 WEEKDAY_ALREADY_PASSED&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
