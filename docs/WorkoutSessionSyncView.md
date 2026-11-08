# WorkoutSessionSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutAssignmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**status** | **String** | &#x60;INTERRUPTED&#x60;: inatividade efetiva de 12 h, com exclusão limitada por pausa; só &#x60;resumeStudentWorkoutSession&#x60;, &#x60;completeStudentWorkoutSession&#x60; e &#x60;abandonStudentWorkoutSession&#x60; agem sobre ela, e toda escrita de fato é &#x60;409 SESSION_INTERRUPTED&#x60;. &#x60;COMPLETED&#x60; e &#x60;ABANDONED&#x60; são terminais. |
**startedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**completedAt** | **Date** | O instante de conclusão, presente só em &#x60;COMPLETED&#x60;. No término pela decisão do treino e na conclusão automática é o instante do último registro, e não o do pedido nem o da detecção. | [optional]
**lastRecordedAt** | **Date** | Última atividade confirmada do servidor, ou início antes de qualquer atividade: inclui PAUSE/RESUME/APPLY_VALUES e transições aceitas. Leituras, ticks, alertas, ACK, replay e cap não renovam atividade. Para 2 h/12 h, exclui apenas a interseção desde lastRecordedAt com os primeiros 3600 s de cada pausa confirmada não sobreposta (R5); pausas antigas não contam novamente. Não é lastRecordedAt cru mais 12 h. No cap o operacional continua pausado, sem aviso/revisão/atividade automáticos; inatividade volta a crescer. Retomada confirmada move a atividade. Registrar um fato não muda a revisão pública de ciclo de vida da sessão; controle tem sua revisão operacional. |
**endedBy** | [**WorkoutSessionEndedBy**](WorkoutSessionEndedBy.md) |  | [optional]
**sessionEffort** | [**WorkoutSessionEffort**](WorkoutSessionEffort.md) | A nota de esforço do treino inteiro, declarada pelo aluno ao terminar (&#x60;rateStudentWorkoutSessionEffort&#x60;). **Ausente** quando o aluno não a deu, e sempre ausente fora de &#x60;COMPLETED&#x60; com &#x60;endedBy: STUDENT&#x60;: a sessão aberta, a descartada e a encerrada pelo servidor não têm nota. Ausência nunca é zero. | [optional]
**recordedLater** | **Bool** | true quando o treino foi marcado como feito depois (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §3.5). | [optional]
**exerciseOrderPolicy** | [**ExerciseOrderPolicyView**](ExerciseOrderPolicyView.md) |  |
**calculatedLoadTargets** | [CalculatedLoadTarget] | Um item por série **prescrita em percentual** do treino da sessão, na ordem da prescrição, cada &#x60;prescribedSetId&#x60; uma só vez; ausente quando nenhuma série do treino é em percentual. Fixado no início da sessão e nunca recalculado. O valor calculado vale para a **variante prescrita**: trocar de variante o tira, e a carga de referência não é transportada entre variantes. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
