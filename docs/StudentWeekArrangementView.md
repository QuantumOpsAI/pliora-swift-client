# StudentWeekArrangementView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**activationId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**weekStart** | **Date** | A segunda-feira da semana deste arranjo, no fuso do vínculo. |
**revision** | **String** | Revisão opaca do arranjo, a mesma do &#x60;ETag&#x60;; é o &#x60;If-Match&#x60; de salvar e de voltar à sugestão. |
**workouts** | [StudentWeekArrangementWorkoutView] | Os treinos do conjunto semanal da ativação, na ordem do plano. |
**restRequiredWeekdays** | Set<PlanWeekday> | Os dias da semana de descanso obrigatório em vigor nesta semana, que não aceitam treino no arranjo; ausente quando não há nenhum. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
