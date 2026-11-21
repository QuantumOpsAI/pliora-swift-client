# AttentionLoadDivergenceReasonReference

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonId** | **String** | Identidade estável e reprodutível do motivo; opaca e nunca decodificada. |
**reasonCode** | **String** |  |
**origin** | **String** |  |
**window** | [**PersonalAttentionWindow**](PersonalAttentionWindow.md) |  |
**destination** | **String** |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Rótulo do exercício na prescrição — o &#x60;displayName&#x60; que o personal deu, o mesmo que a versão publicada e o bundle exibem —, preservado sem tradução e sem substituir &#x60;exerciseId&#x60;. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. É o mesmo valor que &#x60;PersonalAttentionLoadDivergenceParameters.exerciseLabel&#x60; publica no destino. |
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantLabel** | **String** | Rótulo da variante, preservado sem tradução e sem substituir &#x60;variantId&#x60;. Uma variante prescrita de exercício do catálogo, que tem uma só, leva o &#x60;displayName&#x60; da prescrição; o catálogo não é guardado (ADR-0014) e nenhum nome vem dele. É o mesmo valor que &#x60;PersonalAttentionLoadDivergenceParameters.variantLabel&#x60; publica no destino. |
**equipmentContextKey** | **String** | Contexto de equipamento que discrimina o par &#x60;exerciseId&#x60; + &#x60;variantId&#x60;, presente somente quando o relatório o exige; código de máquina opaco que o cliente devolve verbatim e nunca interpreta. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
