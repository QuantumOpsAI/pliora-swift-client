# StudentScheduleView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**planState** | [**StudentTrainingPlanState**](StudentTrainingPlanState.md) | Presente **só** com o vínculo pausado (&#x60;TRAINING_PAUSED&#x60;): então &#x60;days&#x60; vem vazio e &#x60;planMode&#x60; é ausente. Ausente em toda programação com dias. | [optional]
**planMode** | [**PlanActivationMode**](PlanActivationMode.md) | Como o plano chega ao aluno, quando há ativação vigente; ausente quando não há. Em &#x60;SEQUENCE&#x60; os dias não carregam programação por data e o app leva ao plano em sequência (&#x60;getStudentTodayWorkout&#x60;, &#x60;sequencePlan&#x60;). Nunca revela a validade. | [optional]
**from** | **Date** | Primeira data civil devolvida, ecoando o intervalo efetivamente aplicado. |
**to** | **Date** | Última data civil devolvida, ecoando o intervalo efetivamente aplicado. |
**timeZone** | **String** | Timezone IANA em que o servidor resolveu as datas civis e a noção de \&quot;hoje\&quot;. O cliente não reinterpreta as datas noutro timezone. |
**days** | [StudentScheduleDayView] | Uma entrada por data civil entre &#x60;from&#x60; e &#x60;to&#x60;, inclusive, em ordem crescente e sem lacuna. Um dia sem treino prescrito é &#x60;REST_DAY&#x60;. Vazio somente com &#x60;planState: TRAINING_PAUSED&#x60;. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
