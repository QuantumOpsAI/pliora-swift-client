# PersonalStudentComparableExerciseKey

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Rótulo do exercício na prescrição — o &#x60;displayName&#x60; que o personal deu —, preservado verbatim. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. |
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantLabel** | **String** | Rótulo da variante, preservado verbatim; para exercício do catálogo, que tem uma variante só, é o &#x60;displayName&#x60; da prescrição. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. |
**equipmentContextKey** | **String** | Terceiro membro da chave, quando ele discrimina. Código de máquina estável, **nunca nome de aparelho exibível**. Ausente quando não discrimina. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
