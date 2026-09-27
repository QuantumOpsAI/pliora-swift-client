# PersonalAttentionSubstitutionParameters

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonCode** | **String** |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Nome canônico do exercício resolvido pelo servidor no catálogo, preservado sem tradução e sem substituir &#x60;exerciseId&#x60;. |
**prescribedVariantId** | **String** | Variante prescrita que participa da chave de deduplicação do item. O cliente usa o identificador, nunca o rótulo, para navegar e distinguir os itens. |
**prescribedVariantLabel** | **String** | Nome canônico da variante prescrita resolvido pelo servidor no catálogo, preservado sem tradução e sem substituir &#x60;prescribedVariantId&#x60;. |
**substitutionReason** | [**SubstitutionReason**](SubstitutionReason.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
