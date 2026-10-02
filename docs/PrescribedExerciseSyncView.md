# PrescribedExerciseSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**displayName** | **String** | Rótulo do exercício na prescrição, o mesmo de &#x60;PrescriptionDraftExercise&#x60;, preservado verbatim. É o nome que o aluno vê e que o histórico guarda, independentemente de o exercício continuar na origem do catálogo. |
**position** | **Int** |  |
**blockKey** | **String** | Bloco combinado do exercício quando consta em &#x60;blocks[]&#x60; do treino; fora disso, o agrupamento de ordem de antes. Identificador de máquina. | [optional]
**cadence** | [**PrescribedCadence**](PrescribedCadence.md) |  | [optional]
**technique** | [**PrescribedTechnique**](PrescribedTechnique.md) |  | [optional]
**sets** | [PrescribedSetSyncView] |  |
**authorizedAlternativeIds** | **[String]** |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
