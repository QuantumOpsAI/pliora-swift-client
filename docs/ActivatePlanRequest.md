# ActivatePlanRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**activationId** | **String** | Identidade da ativação, gerada pelo cliente; o servidor adota em vez de emitir outra. |
**prescriptionVersionId** | **String** | Versão **publicada** e vigente do plano do aluno que se ativa. |
**mode** | [**PlanActivationMode**](PlanActivationMode.md) |  |
**startDate** | **Date** | Primeiro dia da ativação, no fuso do vínculo; ausente é o \&quot;hoje\&quot; do servidor, e anterior a ele é recusado. | [optional]
**endDate** | **Date** | Último dia de validade; ausente quando a ativação não tem data de término. Nunca anterior ao início. | [optional]
**weekdaySlots** | [PlanWeekdaySlot] | Programação por dias da semana, um slot por treino; só em &#x60;WEEKDAYS&#x60;. | [optional]
**sequence** | **[String]** | Ordem dos treinos em sequência livre, pelo &#x60;workoutId&#x60; da versão; só em &#x60;SEQUENCE&#x60;. Lista ordenada, sem repetição de treino. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
