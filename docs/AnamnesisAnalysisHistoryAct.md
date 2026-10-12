# AnamnesisAnalysisHistoryAct

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**actId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**caseId** | **String** | O caso a que o ato pertence — necessário porque o histórico cobre **todos** os casos da ficha vigente, não só o caso em aberto. |
**actKind** | [**AnamnesisAnalysisActKind**](AnamnesisAnalysisActKind.md) |  |
**recordedBy** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**recordedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**clarificationRequestId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**decisionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**supersededDecisionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**supersededAnamnesisVersionId** | **String** | A versão concluída que este ato aposentou do alvo do caso — fato histórico, nunca conteúdo. | [optional]
**supersededClarificationRequestIds** | **[String]** | Identificadores de perguntas retiradas da rodada por uma supersunção — retirada funcional, distinta da retirada voluntária. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
