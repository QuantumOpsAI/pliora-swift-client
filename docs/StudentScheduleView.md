# StudentScheduleView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**from** | **Date** | Primeira data civil devolvida, ecoando o intervalo efetivamente aplicado. |
**to** | **Date** | Última data civil devolvida, ecoando o intervalo efetivamente aplicado. |
**timeZone** | **String** | Timezone IANA em que o servidor resolveu as datas civis e a noção de \&quot;hoje\&quot;. O cliente não reinterpreta as datas noutro timezone. |
**days** | [StudentScheduleDayView] | Uma entrada por data civil entre &#x60;from&#x60; e &#x60;to&#x60;, inclusive, em ordem crescente e sem lacuna. Um dia sem treino prescrito é &#x60;REST_DAY&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
