# ExerciseReferenceResolution

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**catalogRef** | **String** | Referência opaca de um exercício do catálogo que ainda pode não ter identidade no Pliora, emitida pelo servidor. **Não é o identificador da origem e não é derivável dele pelo cliente**: não tem formato, ordem nem significado, e só se compara por igualdade. Não é identidade durável — o servidor pode deixar de reconhecê-la —, e por isso o app a troca por &#x60;exerciseId&#x60; em &#x60;resolveExerciseReferences&#x60; ao confirmar a seleção e nunca a guarda nem a grava na prescrição. |
**status** | **String** |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
