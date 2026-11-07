# PersonalStudentExerciseSetContextView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**setIndex** | **Int** |  |
**status** | [**ExecutedSetStatus**](ExecutedSetStatus.md) |  |
**setType** | [**PrescribedSetType**](PrescribedSetType.md) | Tipo da série prescrita (&#x60;LE-16&#x60;): a comparação entre séries considera só as do mesmo tipo, e a de aquecimento não entra em maior carga nem em volume. Ausente quando não houve prescrição registrada. | [optional]
**loadPercent** | **Double** | Percentual da carga de referência com que a série foi prescrita; ausente quando a carga prescrita não era em percentual. É o prescrito e nunca vira carga: em &#x60;prescribed&#x60;, &#x60;loadValue&#x60; e &#x60;loadUnit&#x60; ficam nulos, e a carga **executada** está em &#x60;actual&#x60;. | [optional]
**prescribed** | [**WorkoutSetValues**](WorkoutSetValues.md) | Valores prescritos da série. &#x60;null&#x60; quando não houve prescrição registrada — e nenhum valor presumido é preenchido para destravar a comparação. |
**target** | [**ExecutionTargetValues**](ExecutionTargetValues.md) | Alvo operacional efetivamente apresentado, com a origem da decisão preservada. &#x60;null&#x60; quando não houve alvo registrado. |
**actual** | [**WorkoutSetValues**](WorkoutSetValues.md) | Valores realizados. &#x60;null&#x60; quando a série não foi realizada. |
**measuredDurationSeconds** | **Int** | Duração medida pelo cronômetro da série por tempo; nunca é sobrescrita. Ausente fora da série por tempo e na série pulada. | [optional]
**adjustedDurationSeconds** | **Int** | Duração que o aluno corrigiu; existe somente quando difere da medida, e então é a que consta em &#x60;actual.durationSeconds&#x60;. | [optional]
**loadBasis** | [**LoadBasis**](LoadBasis.md) | Leitura do peso da série executada, a mesma cópia da prescrição que o aluno vê no resultado (&#x60;StudentWorkoutSessionResultSet.loadBasis&#x60;); &#x60;null&#x60; é &#x60;leitura não informada&#x60;, que só se compara com &#x60;null&#x60;. Vale para a carga de &#x60;prescribed&#x60;, de &#x60;target&#x60; e de &#x60;actual&#x60;, que nunca é convertida de uma leitura para outra: &#x60;20 kg cada halter&#x60; nunca vira &#x60;40 kg total&#x60;. Na série sem carga é &#x60;null&#x60;, e não há leitura a mostrar. | [optional]
**repsPerSide** | **Bool** | &#x60;true&#x60; quando as repetições da série contam por lado (&#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §6.5), a mesma etiqueta do resultado do aluno. Ausente é contagem comum. | [optional]
**isAdditional** | **Bool** | &#x60;true&#x60; quando a série não estava na prescrição e o aluno a acrescentou durante a sessão ou depois do término. Ausente é série prescrita. | [optional]
**recordedLaterAt** | **Date** | Instante do servidor em que a série a mais foi registrada **depois do término** da sessão — o &#x60;registrado depois&#x60; da série (&#x60;addStudentExerciseSetExecution&#x60;). Presente somente com &#x60;isAdditional: true&#x60; e ausente na série registrada durante a sessão. O treino inteiro marcado como feito depois é dito por &#x60;recordedLater&#x60; da sessão, não por este campo. | [optional]
**adaptationBadges** | Set<StudentWorkoutSessionSetBadge> | As mesmas marcas curtas que o aluno vê no resultado da série (&#x60;StudentWorkoutSessionSetBadge&#x60;, &#x60;DOC-STUDENT-WORKOUT-TECH&#x60; §2.5.1): a mais, sem registro, não fiz, fiz sem anotar, corrigido, registrado por engano, ordem alterada, substituído, bloco separado e valores da prescrição. São fatos do registro, nunca juízo sobre a execução. A lista é do servidor, na ordem em que o enum as publica; vazia ou ausente é série sem marca. | [optional]
**amendedAt** | **Date** | Instante do servidor da última correção da série, presente **se e somente se** &#x60;adaptationBadges&#x60; traz &#x60;AMENDED&#x60;. O valor em vigor está em &#x60;actual&#x60;; o valor anterior não trafega nesta leitura. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
