# AnamnesisAnalysisAct

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**actId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**actKind** | [**AnamnesisAnalysisActKind**](AnamnesisAnalysisActKind.md) |  |
**recordedBy** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**recordedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**clarificationRequestId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**decisionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**supersededDecisionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**supersededAnamnesisVersionId** | **String** | Versão endereçada que perdeu o alvo do caso no ato &#x60;TARGET_VERSION_SUPERSEDED&#x60;. Ausente nos demais atos. | [optional]
**supersededClarificationRequestIds** | **[String]** | Perguntas ainda pendentes tornadas obsoletas no mesmo ato &#x60;TARGET_VERSION_SUPERSEDED&#x60; — marcador &#x60;supersededAt&#x60;, nunca retirada fingida. Ausente nos demais atos e quando nenhuma pergunta estava pendente. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
