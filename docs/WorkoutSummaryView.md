# WorkoutSummaryView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**planState** | [**StudentTrainingPlanState**](StudentTrainingPlanState.md) | Presente **só** com o vínculo pausado, e então é a única propriedade da resposta. Ausente em toda leitura com treino. | [optional]
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**prescriptionVersionId** | **String** | Versão publicada e imutável da prescrição que originou este resumo. A publicação de uma nova versão pelo personal não reescreve esta; uma sessão iniciada permanece ligada à versão que a originou. | [optional]
**name** | **String** | Nome do treino prescrito {ex. \&quot;Treino B\&quot;}. Dado do domínio autorado pelo personal, preservado verbatim UTF-8; nunca traduzido, reescrito nem usado como chave de mensagem, mesmo quando o locale efetivo muda. | [optional]
**focus** | **String** | Foco declarado do treino {ex. \&quot;Peito e Tríceps\&quot;}. Conteúdo autorado pelo personal, preservado verbatim UTF-8 e invariante de locale. Nulo somente para uma versão publicada antes de o foco autorado existir; novas publicações continuam recusadas sem foco. | [optional]
**estimatedDurationMinutes** | [**DurationMinutesRange**](DurationMinutesRange.md) |  | [optional]
**exerciseCount** | **Int** | Quantidade de exercícios prescritos; igual ao tamanho de &#x60;exercises&#x60;. | [optional]
**setCount** | **Int** | Volume total prescrito em séries {ex. 24}. É a soma de &#x60;exercises[].setCount&#x60; e descreve a prescrição, nunca a execução. | [optional]
**coachNotes** | **String** | Observação escrita pelo personal para este treino; nula quando não há observação. Conteúdo autorado, preservado verbatim UTF-8, nunca traduzido nem interpolado em chave de catálogo. | [optional]
**blocks** | [PrescribedBlock] | Blocos combinados do treino, na forma da autoria (&#x60;PrescribedBlock&#x60;), a mesma que o bundle da sessão publica. Ausente quando o treino não tem bloco. | [optional]
**exercises** | [WorkoutSummaryExerciseView] | Exercícios prescritos, na ordem prescrita pelo personal, com as séries prescritas e a última execução comparável de cada um. | [optional]
**placementToday** | [**WorkoutPlacement**](WorkoutPlacement.md) | A colocação que o início deste treino teria hoje, pelo casamento de &#x60;startStudentWorkoutSession&#x60;: é daqui que a tela tira o aviso antes de iniciar, e o pedido de início a devolve em &#x60;expectedPlacement&#x60;. Obrigatória em toda leitura com treino; &#x60;ON_SCHEDULE&#x60; em sequência livre. | [optional]
**slotDate** | **Date** | Data do slot que o início hoje satisfaria; presente com &#x60;placementToday&#x60; &#x60;ANTICIPATED&#x60; ou &#x60;POSTPONED&#x60;, ausente nas demais colocações. | [optional]
**doneThisWeekOn** | **Date** | Dia desta semana (segunda a domingo) em que o aluno já concluiu este treino, para o aviso de repetição; ausente quando ele não o concluiu nesta semana. | [optional]
**secondWorkoutToday** | **Bool** | &#x60;true&#x60; quando o aluno já concluiu algum treino hoje, para o aviso de segundo treino do dia. Em plano por dias da semana não é recusa: não existe limite de um treino por dia. Em sequência livre o início de outro treino no mesmo dia continua recusado (&#x60;WORKOUT_ALREADY_DONE_TODAY&#x60;, &#x60;Q-09&#x60;). | [optional]
**blockedBy** | **String** | Por que o início deste treino seria recusado hoje: &#x60;MIN_REST_INTERVAL&#x60; é o intervalo mínimo entre repetições, que entra em 0.121.0; nesta versão nunca é produzido. Vem com &#x60;availableFrom&#x60;. | [optional]
**availableFrom** | **Date** | Primeiro dia em que o início deixa de ser recusado; presente só com &#x60;blockedBy&#x60;. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
