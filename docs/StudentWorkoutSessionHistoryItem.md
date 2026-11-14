# StudentWorkoutSessionHistoryItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**placement** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação da sessão na semana, fixada no início dela e nunca reescrita; a linha do histórico mostra o sufixo dela (antecipado, adiado, repetição, extra). |
**slotDate** | **Date** | Data do slot que a sessão satisfez; presente com &#x60;ANTICIPATED&#x60; e &#x60;POSTPONED&#x60;, ausente nas demais. | [optional]
**workoutName** | **String** | O nome do treino executado, como estava na versão que originou a sessão. Conteúdo do domínio preservado verbatim. |
**localDate** | **Date** | O dia civil gravado na sessão, fixado no início dela; é com ele que &#x60;from&#x60; e &#x60;to&#x60; comparam. |
**startedAt** | **Date** | O instante do servidor em que a sessão começou; a ordem do histórico. |
**endedAt** | **Date** | O instante do servidor em que a sessão terminou, em qualquer desfecho. |
**durationSeconds** | **Int** | A duração do início ao término, em segundos; igual a &#x60;endedAt&#x60; menos &#x60;startedAt&#x60;. **Nula se e somente se** &#x60;recordedLater &#x3D; true&#x60;: o treino marcado como feito depois não tem duração, e nenhuma é inventada (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §3.5). |
**recordedLater** | **Bool** | Presente, e &#x60;true&#x60;, só no treino marcado como feito depois (&#x60;DOC-STUDENT-WORKOUT&#x60; §6.7; &#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §3.5), o mesmo &#x60;recordedLater&#x60; do resultado: a linha leva a marca &#x60;Registrado depois&#x60; e não mostra duração. Ausente é treino registrado enquanto acontecia; nunca é escrito como &#x60;false&#x60;. | [optional]
**status** | **String** | &#x60;COMPLETED&#x60; ou &#x60;ABANDONED&#x60;; a sessão aberta não entra no histórico. &#x60;ABANDONED&#x60; é o treino descartado com série executada, e o app o marca como não concluído. |
**endedBy** | [**WorkoutSessionEndedBy**](WorkoutSessionEndedBy.md) |  |
**completedSetCount** | **Int** | As séries executadas, inteiras ou parciais; ao menos uma, ou a sessão não entra no histórico. |
**totalSetCount** | **Int** | As séries do treino na versão da sessão. |
**recordCount** | **Int** | Quantos recordes a sessão bateu, pela mesma projeção do resultado. Nulo quando a projeção não pôde ser lida nesta resposta; nunca é lido como zero. |
**records** | [StudentProgressRecord] | Até 3 recordes da sessão, resumidos, os primeiros do &#x60;records&#x60; do resultado dela. Vazia quando a sessão não bateu recorde e quando &#x60;recordCount&#x60; é nulo. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
