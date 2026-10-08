# StudentWorkoutSessionResultView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**workoutName** | **String** | O nome do treino executado, como estava na versão que originou a sessão. Conteúdo do domínio preservado verbatim. |
**localDate** | **Date** | O dia civil gravado na sessão, fixado no início dela; não muda se o aluno trocar de personal ou de fuso. |
**startedAt** | **Date** | O instante do servidor em que a sessão começou. |
**endedAt** | **Date** | O instante do servidor em que a sessão terminou, em qualquer desfecho. No término pela decisão do treino e no encerramento automático é o instante do último registro. |
**durationSeconds** | **Int** | A duração do início ao término, em segundos; igual a &#x60;endedAt&#x60; menos &#x60;startedAt&#x60;. |
**status** | **String** | &#x60;COMPLETED&#x60; ou &#x60;ABANDONED&#x60;; sessão aberta não tem resultado. &#x60;ABANDONED&#x60; é o treino descartado ou encerrado sem série executada, e o app o marca como não concluído. |
**endedBy** | [**WorkoutSessionEndedBy**](WorkoutSessionEndedBy.md) |  |
**exercisesDone** | **Int** | Exercícios feitos (&#x60;COMPLETED&#x60;), contados pelo servidor. |
**exercisesPlanned** | **Int** | Exercícios do treino na versão da sessão. |
**setsDone** | **Int** | Séries executadas, inteiras ou parciais. |
**setsPlanned** | **Int** | Séries do treino na versão da sessão. |
**volume** | [WorkoutVolumePortion] | O volume da sessão, uma parcela por unidade de carga gravada (&#x60;KG&#x60;, &#x60;LB&#x60;), sem conversão. As exclusões e a ausência de comparação entre sessões estão em &#x60;WorkoutVolumePortion&#x60;. Vazia quando nenhuma série tem as duas grandezas: o app mostra &#x60;—&#x60;, nunca zero. |
**records** | [StudentWorkoutSessionRecord] | Os recordes que a sessão bateu, projeção com &#x60;origin: PROJECTION&#x60;. Vazia quando não houve recorde; a primeira vez não é recorde e vive em &#x60;exercises[].firstTime&#x60;. |
**sessionEffort** | [**WorkoutSessionEffort**](WorkoutSessionEffort.md) | A nota de esforço, só para leitura: dada uma vez, não muda depois. **Ausente** quando o aluno pulou a tela e quando a sessão não foi terminada por ele (&#x60;endedBy&#x60; diferente de &#x60;STUDENT&#x60;), que não tem nota. | [optional]
**blocks** | [StudentWorkoutSessionResultBlock] | Os blocos combinados do treino, quando há; ausente quando o treino não tem bloco. | [optional]
**exercises** | [StudentWorkoutSessionResultExercise] | Os exercícios da sessão, na ordem prescrita. |
**executedOrder** | **[String]** | A ordem em que os exercícios foram executados, como &#x60;exerciseExecutionId&#x60; de &#x60;exercises[]&#x60;. Ausente quando é a prescrita; o resultado não apresenta a ordem executada como se fosse a prescrita. | [optional]
**prescribedOrder** | **[String]** | A ordem prescrita dos mesmos exercícios. Presente se e somente se &#x60;executedOrder&#x60; é. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
