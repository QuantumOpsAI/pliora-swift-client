# WorkoutSessionSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutAssignmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | **String** | &#x60;INTERRUPTED&#x60;: sem registro há 12 horas ou mais; só &#x60;resumeStudentWorkoutSession&#x60;, &#x60;completeStudentWorkoutSession&#x60; e &#x60;abandonStudentWorkoutSession&#x60; agem sobre ela, e toda escrita de fato é &#x60;409 SESSION_INTERRUPTED&#x60;. &#x60;COMPLETED&#x60; e &#x60;ABANDONED&#x60; são terminais. |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**completedAt** | **Date** | O instante de conclusão, presente só em &#x60;COMPLETED&#x60;. No término pela decisão do treino e na conclusão automática é o instante do último registro, e não o do pedido nem o da detecção. | [optional]
**lastRecordedAt** | **Date** | O instante do servidor do último fato aceito na sessão, ou o do início quando ainda não há fato. É dele que correm as 12 horas até a interrupção; a retomada o leva ao instante em que foi confirmada. Registrar um fato não muda a revisão pública da sessão. |
**endedBy** | [**WorkoutSessionEndedBy**](WorkoutSessionEndedBy.md) |  | [optional]
**exerciseOrderPolicy** | [**ExerciseOrderPolicyView**](ExerciseOrderPolicyView.md) |  |
**calculatedLoadTargets** | [CalculatedLoadTarget] | Um item por série **prescrita em percentual** do treino da sessão, na ordem da prescrição, cada &#x60;prescribedSetId&#x60; uma só vez; ausente quando nenhuma série do treino é em percentual. Fixado no início da sessão e nunca recalculado. O valor calculado vale para a **variante prescrita**: trocar de variante o tira, e a carga de referência não é transportada entre variantes. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
