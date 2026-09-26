# WorkoutSummaryView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescriptionVersionId** | **String** | Versão publicada e imutável da prescrição que originou este resumo. A publicação de uma nova versão pelo personal não reescreve esta; uma sessão iniciada permanece ligada à versão que a originou. |
**name** | **String** | Nome do treino prescrito {ex. \&quot;Treino B\&quot;}. Dado do domínio autorado pelo personal, preservado verbatim UTF-8; nunca traduzido, reescrito nem usado como chave de mensagem, mesmo quando o locale efetivo muda. |
**focus** | **String** | Foco declarado do treino {ex. \&quot;Peito e Tríceps\&quot;}. Conteúdo autorado pelo personal, preservado verbatim UTF-8 e invariante de locale. Nulo somente para uma versão publicada antes de o foco autorado existir; novas publicações continuam recusadas sem foco. |
**estimatedDurationMinutes** | [**DurationMinutesRange**](DurationMinutesRange.md) |  |
**exerciseCount** | **Int** | Quantidade de exercícios prescritos; igual ao tamanho de &#x60;exercises&#x60;. |
**setCount** | **Int** | Volume total prescrito em séries {ex. 24}. É a soma de &#x60;exercises[].setCount&#x60; e descreve a prescrição, nunca a execução. |
**coachNotes** | **String** | Observação escrita pelo personal para este treino; nula quando não há observação. Conteúdo autorado, preservado verbatim UTF-8, nunca traduzido nem interpolado em chave de catálogo. |
**exercises** | [WorkoutSummaryExerciseView] | Exercícios prescritos, na ordem prescrita pelo personal. Resumo mínimo: identidade, posição, nome e quantidade de séries prescritas. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
