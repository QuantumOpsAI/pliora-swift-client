# PrescriptionActivationSummary

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**activationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**mode** | [**PlanActivationMode**](PlanActivationMode.md) |  |
**startDate** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**endDate** | **Date** | Último dia de validade; omitido quando a ativação não tem data de término, e a ausência nunca é lida como vencida. | [optional]
**daysUntilEnd** | **Int** | Dias civis entre o dia de hoje do servidor, no fuso do vínculo, e &#x60;endDate&#x60;: negativo depois do término, &#x60;0&#x60; no último dia. Presente somente com &#x60;endDate&#x60;. É o que o app mostra como \&quot;vence em N dias\&quot;, sem depender do relógio nem do fuso do aparelho. | [optional]
**weekdays** | Set<PlanWeekday> | Dias da semana programados; presente somente em &#x60;WEEKDAYS&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
