# PrescriptionDraftExercise

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**prescribedExerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedVariantId** | **String** | Variante prescrita pelo personal, recuperável de forma inequívoca. A variante executada pelo aluno é outro fato e nunca sobrescreve esta. |
**position** | **Int** |  |
**orderPolicy** | [**PrescribedOrderPolicy**](PrescribedOrderPolicy.md) |  |
**blockKey** | **String** | Agrupamento que restringe a ordem; obrigatório na prática para &#x60;FLEXIBLE_WITHIN_GROUP&#x60;. Identificador de máquina, nunca copy de tela. | [optional]
**dependsOnPrescribedExerciseId** | **String** | Exercício que precisa estar concluído antes deste, quando o personal declara dependência. | [optional]
**notes** | **String** | Nota do personal para o exercício. Conteúdo autorado, preservado verbatim UTF-8, nunca traduzido, normalizado, reescrito ou truncado em silêncio. | [optional]
**restRange** | [**PrescribedRestRange**](PrescribedRestRange.md) |  | [optional]
**sets** | [PrescriptionDraftSet] | Séries prescritas; um rascunho ainda incompleto pode ter a lista vazia, e a publicação é que exige ao menos uma. |
**alternatives** | [PrescriptionDraftAlternative] |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
