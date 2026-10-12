# StudentAnamnesisAnalysisCase

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**caseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**state** | [**AnamnesisAnalysisState**](AnamnesisAnalysisState.md) |  |
**revision** | **String** |  |
**openedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**closedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]
**nextStep** | [**AnamnesisAnalysisNextStep**](AnamnesisAnalysisNextStep.md) | O único fato da decisão que o titular recebe: o próximo passo operacional gravado pelo personal — &#x60;REVIEW_LATER&#x60; ou &#x60;EXTERNAL_EVALUATION_REFERRAL&#x60; — exigido quando &#x60;state&#x60; é &#x60;NOT_RELEASED&#x60; e proibido em qualquer outro estado. Nunca é diagnóstico, razão, justificativa nem a decisão projetada. | [optional]
**clarificationRequests** | [StudentAnamnesisAnalysisClarificationRequest] |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
