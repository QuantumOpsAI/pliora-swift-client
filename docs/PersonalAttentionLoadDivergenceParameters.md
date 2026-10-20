# PersonalAttentionLoadDivergenceParameters

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonCode** | **String** |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Rótulo do exercício na prescrição — o &#x60;displayName&#x60; que o personal deu, o mesmo que a versão publicada e o bundle exibem —, preservado sem tradução e sem substituir &#x60;exerciseId&#x60;. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. |
**variantId** | **String** | Variante do exercício. Ela faz parte da chave de comparabilidade: carga de variantes diferentes não é equivalente e nunca entra na mesma janela. |
**variantLabel** | **String** | Rótulo da variante, preservado sem tradução e sem substituir &#x60;variantId&#x60;. Uma variante prescrita de exercício do catálogo, que tem uma só, leva o &#x60;displayName&#x60; da prescrição; o catálogo não é guardado (ADR-0014) e nenhum nome vem dele. |
**equipmentContextKey** | **String** | Terceiro membro da chave de comparabilidade deste item, publicado quando o contexto discrimina: o par &#x60;exerciseId&#x60; + &#x60;variantId&#x60; registra dois ou mais contextos neste vínculo e a consulta do relatório sem ele responderia &#x60;422&#x60;. Ausente quando o par tem um único contexto, que o relatório resolve sozinho. Código de máquina opaco que o cliente devolve verbatim como &#x60;equipmentContextKey&#x60; de &#x60;listPersonalStudentExerciseSessionHistory&#x60;, nunca o interpreta e nunca o inventa. | [optional]
**prescribedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga prescrita da sessão na unidade canônica, reusando a representação já publicada na execução. Comparação é por igualdade exata, sem tolerância. |
**performedLoad** | [**WorkoutLoad**](WorkoutLoad.md) | Carga executada da sessão, na mesma unidade canônica. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
