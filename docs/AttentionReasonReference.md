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
**variantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**equipmentContextKey** | **String** | Contexto de equipamento que discrimina o par &#x60;exerciseId&#x60; + &#x60;prescribedVariantId&#x60;, presente somente quando o relatório o exige; código de máquina opaco que o cliente devolve verbatim e nunca interpreta. | [optional]
**prescribedVariantId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
