# PrescriptionDraftWorkout

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** | Nome do treino {ex. \&quot;Treino A\&quot;}, preservado verbatim e invariante de locale. |
**focus** | **String** | Foco declarado do treino, preservado verbatim; ausente quando o personal não declarou. | [optional]
**position** | **Int** |  |
**exercises** | [PrescriptionDraftExercise] | Exercícios prescritos; lista vazia é estado legítimo de rascunho e recusada somente na publicação. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
