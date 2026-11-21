# AttentionReasonReference

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonId** | **String** | Identidade estável e reprodutível do motivo; opaca e nunca decodificada. |
**reasonCode** | **String** |  |
**origin** | **String** |  |
**destination** | **String** |  |
**discomfortReportId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**version** | [**StudentAnamnesisVersionRef**](StudentAnamnesisVersionRef.md) |  |
**analysisCase** | [**PersonalAttentionAnalysisCaseProjection**](PersonalAttentionAnalysisCaseProjection.md) | Referência autorizada ao caso de análise vigente deste vínculo, presente somente quando a razão &#x60;ANAMNESIS_ANALYSIS_PENDING&#x60; sustenta o bloqueio. Nenhuma pergunta, resposta ou conteúdo clínico viaja aqui. | [optional]
**window** | [**PersonalAttentionWindow**](PersonalAttentionWindow.md) |  |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseLabel** | **String** | Rótulo do exercício na prescrição — o &#x60;displayName&#x60; que o personal deu, o mesmo que a versão publicada e o bundle exibem —, preservado sem tradução e sem substituir &#x60;exerciseId&#x60;. O catálogo não é guardado (ADR-0014): nenhum nome vem dele. É o mesmo valor que &#x60;PersonalAttentionSubstitutionParameters.exerciseLabel&#x60; publica no destino. |
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**variantLabel** | **String** | Rótulo da variante, preservado sem tradução e sem substituir &#x60;variantId&#x60;. Uma variante prescrita de exercício do catálogo, que tem uma só, leva o &#x60;displayName&#x60; da prescrição; o catálogo não é guardado (ADR-0014) e nenhum nome vem dele. É o mesmo valor que &#x60;PersonalAttentionLoadDivergenceParameters.variantLabel&#x60; publica no destino. |
**equipmentContextKey** | **String** | Contexto de equipamento que discrimina o par &#x60;exerciseId&#x60; + &#x60;prescribedVariantId&#x60;, presente somente quando o relatório o exige; código de máquina opaco que o cliente devolve verbatim e nunca interpreta. | [optional]
**prescribedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**prescribedVariantLabel** | **String** | Rótulo da variante prescrita, preservado sem tradução e sem substituir &#x60;prescribedVariantId&#x60;. Uma variante de exercício do catálogo, que tem uma só, leva o &#x60;displayName&#x60; da prescrição; o catálogo não é guardado (ADR-0014) e nenhum nome vem dele. É o mesmo valor que &#x60;PersonalAttentionSubstitutionParameters.prescribedVariantLabel&#x60; publica no destino. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
