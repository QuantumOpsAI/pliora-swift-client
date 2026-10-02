# PrescribedWorkoutSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**workoutId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**name** | **String** |  |
**focus** | **String** | Foco autorado preservado; nulo somente para versão publicada antes de esse campo existir. Novas publicações continuam recusadas sem foco. |
**blocks** | [PrescribedBlock] | Blocos combinados do treino, na mesma forma da autoria (&#x60;PrescribedBlock&#x60;), para que a forma do prescrito continue única entre o rascunho, a versão publicada e o que chega ao aluno. Ausente quando o treino não tem bloco. | [optional]
**exercises** | [PrescribedExerciseSyncView] |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
