# WorkoutVolumePortion

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**loadUnit** | [**PrescribedLoadUnit**](PrescribedLoadUnit.md) |  |
**loadBasis** | [**LoadBasis**](LoadBasis.md) | Leitura do peso da parcela. Leituras diferentes viram **parcelas separadas** dentro da mesma unidade — o servidor nunca soma leituras diferentes —, e a &#x60;leitura não informada&#x60; (&#x60;null&#x60;) forma a sua própria parcela. | [optional]
**value** | **Double** | A soma de carga × repetições, na unidade de &#x60;loadUnit&#x60; e na leitura de &#x60;loadBasis&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
