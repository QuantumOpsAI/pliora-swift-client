# StudentConsistencyView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**planMode** | [**PlanActivationMode**](PlanActivationMode.md) | O modo da ativação vigente em &#x60;asOf&#x60;. Ausente quando não há ativação vigente. | [optional]
**asOf** | **Date** | O instante do servidor em que a leitura foi calculada; nunca o relógio do aparelho. |
**origin** | **String** | O selo de projeção. |
**weeks** | [StudentConsistencyWeek] | As semanas pedidas, da mais antiga à corrente (a última), consecutivas. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
