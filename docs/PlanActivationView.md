# PlanActivationView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**activationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão publicada que a ativação serve hoje. Publicar uma &#x60;REVISION&#x60; mantém a ativação e a reaponta para a versão nova, pelos &#x60;derivedFromWorkoutId&#x60;. |
**versionNumber** | **Int** | Número da versão que a ativação serve. |
**mode** | [**PlanActivationMode**](PlanActivationMode.md) |  |
**startDate** | **Date** | Data civil no calendário ISO 8601, sem horário ou timezone. |
**endDate** | **Date** | Último dia de validade; omitido quando a ativação não tem data de término, e a ausência nunca é lida como vencida. | [optional]
**daysUntilEnd** | **Int** | Dias civis entre o &#x60;asOfDate&#x60; da resposta e &#x60;endDate&#x60;: negativo depois do término, &#x60;0&#x60; no último dia. Presente somente com &#x60;endDate&#x60;. | [optional]
**validity** | [**PrescriptionValidity**](PrescriptionValidity.md) |  |
**weekdaySlots** | [PlanWeekdaySlot] | Programação por dias da semana, um slot por treino; presente somente em &#x60;WEEKDAYS&#x60;. | [optional]
**sequence** | **[String]** | Ordem dos treinos, pelo &#x60;workoutId&#x60; da versão servida; presente somente em &#x60;SEQUENCE&#x60;. Lista ordenada. | [optional]
**unscheduledWorkoutIds** | **[String]** | Treinos da versão servida que a programação **não alcança** — sem dia em &#x60;WEEKDAYS&#x60;, fora da sequência em &#x60;SEQUENCE&#x60; —, na ordem do plano; é onde cai o treino novo de uma revisão até o personal defini-lo. Vazio quando a programação alcança todos. |
**revision** | **String** | Revisão opaca da ativação, a mesma do &#x60;ETag&#x60;; muda a cada alteração, a cada reapontamento por revisão publicada e a cada encerramento. É o valor de &#x60;If-Match&#x60; ao alterar, encerrar ou ativar outra. |
**activatedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
