# PersonalAttentionLoadDivergenceParameters

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonCode** | **String** |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Rótulo do exercício na prescrição — o &#x60;displayName&#x60; que o personal deu, o mesmo que a versão publicada e o bundle exibem —, preservado sem tradução e sem substituir &#x60;exerciseId&#x60;. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. |
**variantId** | **String** | Variante do exercício. Ela faz parte da chave de comparabilidade: carga de variantes diferentes não é equivalente e nunca entra na mesma janela. |
**variantLabel** | **String** | Rótulo da variante, preservado sem tradução e sem substituir &#x60;variantId&#x60;. Uma variante prescrita de exercício do catálogo, que tem uma só, leva o &#x60;displayName&#x60; da prescrição; o catálogo não é guardado (ADR-0014) e nenhum nome vem dele. |
**equipmentId** | **String** | Equipamento, quando ele for materialmente relevante para a comparação. Ausente quando não discrimina; ausência aqui é ausência, e nunca um equipamento padrão presumido. | [optional]
**prescribedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga prescrita da sessão na unidade canônica, reusando a representação já publicada na execução. Comparação é por igualdade exata, sem tolerância. |
**performedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga executada da sessão, na mesma unidade canônica. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
