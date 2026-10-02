# PersonalAttentionSubstitutionParameters

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonCode** | **String** |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Rótulo do exercício na prescrição — o &#x60;displayName&#x60; que o personal deu, o mesmo que a versão publicada e o bundle exibem —, preservado sem tradução e sem substituir &#x60;exerciseId&#x60;. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. |
**prescribedVariantId** | **String** | Variante prescrita que participa da chave de deduplicação do item. O cliente usa o identificador, nunca o rótulo, para navegar e distinguir os itens. |
**prescribedVariantLabel** | **String** | Rótulo da variante prescrita, preservado sem tradução e sem substituir &#x60;prescribedVariantId&#x60;. Uma variante de exercício do catálogo, que tem uma só, leva o &#x60;displayName&#x60; da prescrição; o catálogo não é guardado (ADR-0014) e nenhum nome vem dele. |
**substitutionReason** | [**SubstitutionReason**](SubstitutionReason.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
