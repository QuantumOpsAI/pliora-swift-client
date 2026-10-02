# PrescriptionDraftWorkout

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**derivedFromWorkoutId** | **String** | Treino da versão de origem do qual este foi copiado, **gravado pelo servidor** quando o rascunho é &#x60;REVISION&#x60;: é o que permite manter a programação entre versões e dizer o que a revisão mudou. Ausente em treino que o personal criou neste rascunho e em rascunho que não é revisão. O cliente nunca o declara: reenviá-lo na edição é inócuo. | [optional]
**name** | **String** | Nome do treino {ex. \&quot;Treino A\&quot;}, preservado verbatim e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; ausente quando o personal não declarou. | [optional]
**position** | **Int** |  |
**blocks** | [PrescribedBlock] | Blocos combinados do treino; ausente quando não há nenhum. Cada exercício do bloco repete o &#x60;blockKey&#x60; dele. Na publicação, &#x60;422 DRAFT_INCOMPLETE&#x60; recusa, com o caminho em &#x60;fieldErrors&#x60;, o bloco com menos de dois exercícios (&#x60;BLOCK_TOO_SMALL&#x60;), o bloco cujos exercícios não são contíguos na ordem do treino (&#x60;BLOCK_NOT_CONTIGUOUS&#x60;), o bloco cujos exercícios não têm o mesmo número de séries (&#x60;BLOCK_SET_COUNT_MISMATCH&#x60;), o &#x60;blockKey&#x60; repetido em &#x60;blocks[]&#x60; (&#x60;BLOCK_KEY_REPEATED&#x60;), o exercício de bloco que não é &#x60;LOCKED&#x60; (&#x60;BLOCK_ORDER_NOT_LOCKED&#x60;) ou que declara &#x60;restRange&#x60; próprio, porque o descanso é o do bloco (&#x60;BLOCK_EXERCISE_HAS_OWN_REST&#x60;). | [optional]
**exercises** | [PrescriptionDraftExercise] | Exercícios prescritos; lista vazia é estado legítimo de rascunho e recusada somente na publicação. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
