# PersonalStudentAnamnesisAnalysisClarificationRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**clarificationRequestId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**position** | **Int** | Sequência local da pergunta dentro do caso — 1, 2, 3... |
**question** | **String** | Pergunta autorada pelo personal, preservada verbatim. |
**reason** | **String** | Razão obrigatória da pergunta, preservada verbatim. |
**askedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**askedBy** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**response** | [**AnamnesisAnalysisAnswer**](AnamnesisAnalysisAnswer.md) |  | [optional]
**withdrawnAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]
**withdrawnBy** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]
**supersededAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. | [optional]
**supersededByAnamnesisVersionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
