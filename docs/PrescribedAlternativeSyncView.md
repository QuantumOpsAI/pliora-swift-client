# PrescribedAlternativeSyncView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**viewType** | **String** |  |
**alternativeId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**displayName** | **String** | Rótulo da alternativa na prescrição, o mesmo de &#x60;PrescriptionDraftAlternative&#x60;, preservado verbatim. É o nome que o aluno vê na tela de troca e que o histórico guarda, independentemente de o exercício continuar na origem do catálogo. |
**scope** | **String** |  |
**equipment** | **String** | Equipamento do exercício da alternativa em texto legível, como a origem o entrega — o mesmo de &#x60;ExerciseCatalogDetail.equipment&#x60;. Ausente quando a origem não o informa. | [optional]
**primaryMuscles** | **[String]** | Músculos principais do exercício da alternativa em texto legível, como a origem os entrega — os mesmos de &#x60;ExerciseCatalogDetail.primaryMuscles&#x60;. Ausente quando a origem não os informa. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
