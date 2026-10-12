# PersonalStudentAnamnesisAnalysisDecision

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**decisionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**kind** | [**AnamnesisAnalysisDecisionKind**](AnamnesisAnalysisDecisionKind.md) |  |
**recordedBy** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**recordedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**inForce** | **Bool** | Verdadeiro enquanto a decisão vigora; a substituída permanece no histórico com &#x60;inForce: false&#x60; e o trio de supersunção. |
**nextStep** | [**AnamnesisAnalysisNextStep**](AnamnesisAnalysisNextStep.md) |  | [optional]
**conditionSummary** | **String** | Condição a que a liberação médica vista pelo personal se refere — resumo autorado, nunca o documento. | [optional]
**justification** | **String** | Justificativa profissional obrigatória da dispensa — conteúdo autorado, preservado verbatim. | [optional]
**responsibilityAcknowledged** | **Bool** | Aceite ativo do texto de responsabilidade — só existe gravado como verdadeiro; ausência ou falso nunca vira ato. | [optional]
**responsibilityTextVersion** | **String** | Versão exata do texto de responsabilidade apresentado e aceito. | [optional]
**responsibilityTextLocale** | [**Locale**](Locale.md) |  | [optional]
**correctedAnamnesisVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**supersededAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]
**supersededByDecisionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**supersessionKind** | [**AnamnesisAnalysisSupersessionKind**](AnamnesisAnalysisSupersessionKind.md) |  | [optional]
**supersedesDecisionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
