# PersonalAttentionDiscomfortParameters

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reasonCode** | **String** |  |
**discomfortReportId** | **String** | Identificador opaco do relato individual. É o mesmo alvo que &#x60;acknowledgePersonalStudentDiscomfortReport&#x60; reconhece, e é por ele que a expiração deste item acontece. |
**reportedAt** | **Date** | Instante RFC 3339 / ISO 8601 com offset explícito. |
**exerciseId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**exerciseExecutionId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**area** | **String** | Região declarada, com os mesmos valores que &#x60;ExecutionDiscomfortReportPayload&#x60; já publica; o conjunto é reusado sem alteração para que o fato lido pelo personal seja o mesmo que o aluno registrou. |
**sensation** | **String** | Sensação declarada, com os mesmos valores que &#x60;ExecutionDiscomfortReportPayload&#x60; já publica. É relato operacional, nunca classificação clínica. |
**intensity** | **Int** | Intensidade declarada na mesma escala inteira já publicada na execução. |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
