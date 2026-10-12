# PersonalStudentAnamnesisAnalysisCase

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**caseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**state** | [**AnamnesisAnalysisState**](AnamnesisAnalysisState.md) |  |
**revision** | **String** | Revisão monotônica do caso — o &#x60;ETag&#x60; das respostas de comando, eco obrigatório de &#x60;If-Match&#x60; no próximo. |
**origin** | [**AnamnesisAnalysisOrigin**](AnamnesisAnalysisOrigin.md) |  |
**originAnamnesisVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**targetAnamnesisVersion** | [**PersonalAuthorizedAnamnesisVersionRef**](PersonalAuthorizedAnamnesisVersionRef.md) |  |
**openedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**closedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]
**nextStep** | [**AnamnesisAnalysisNextStep**](AnamnesisAnalysisNextStep.md) |  | [optional]
**clarificationRequests** | [PersonalStudentAnamnesisAnalysisClarificationRequest] |  |
**decision** | [**PersonalStudentAnamnesisAnalysisDecision**](PersonalStudentAnamnesisAnalysisDecision.md) |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
