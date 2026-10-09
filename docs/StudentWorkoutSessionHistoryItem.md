# StudentWorkoutSessionHistoryItem

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutName** | **String** | O nome do treino executado, como estava na versão que originou a sessão. Conteúdo do domínio preservado verbatim. |
**localDate** | **Date** | O dia civil gravado na sessão, fixado no início dela; é com ele que &#x60;from&#x60; e &#x60;to&#x60; comparam. |
**startedAt** | **Date** | O instante do servidor em que a sessão começou; a ordem do histórico. |
**endedAt** | **Date** | O instante do servidor em que a sessão terminou, em qualquer desfecho. |
**durationSeconds** | **Int** | A duração do início ao término, em segundos; igual a &#x60;endedAt&#x60; menos &#x60;startedAt&#x60;. |
**status** | **String** | &#x60;COMPLETED&#x60; ou &#x60;ABANDONED&#x60;; a sessão aberta não entra no histórico. &#x60;ABANDONED&#x60; é o treino descartado com série executada, e o app o marca como não concluído. |
**endedBy** | [**WorkoutSessionEndedBy**](WorkoutSessionEndedBy.md) |  |
**completedSetCount** | **Int** | As séries executadas, inteiras ou parciais; ao menos uma, ou a sessão não entra no histórico. |
**totalSetCount** | **Int** | As séries do treino na versão da sessão. |
**recordCount** | **Int** | Quantos recordes a sessão bateu, pela mesma projeção do resultado. Nulo quando a projeção não pôde ser lida nesta resposta; nunca é lido como zero. |
**records** | [StudentProgressRecord] | Até 3 recordes da sessão, resumidos, os primeiros do &#x60;records&#x60; do resultado dela. Vazia quando a sessão não bateu recorde e quando &#x60;recordCount&#x60; é nulo. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
