# CorrectPersonalStudentBodyAssessmentRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**reason** | **String** | Justificativa simples da correção, após trim, 1–200 caracteres — nunca pede nem carrega diagnóstico. |
**measuredOn** | **Date** | Data civil ISO da medição, não futura na &#x60;timeZone&#x60; enviada. |
**timeZone** | **String** | Zona IANA da data civil declarada — armazenada com ela. |
**method** | [**BodyAssessmentMethod**](BodyAssessmentMethod.md) |  |
**methodDescription** | **String** | Exigido somente com method OTHER e proibido nos demais. | [optional]
**_protocol** | [**BodyAssessmentProvenance**](BodyAssessmentProvenance.md) | Obrigatório com method SKINFOLDS; opcional nos demais. | [optional]
**device** | [**BodyAssessmentProvenance**](BodyAssessmentProvenance.md) | Obrigatório com method BIOIMPEDANCE; opcional nos demais. | [optional]
**metrics** | [**BodyAssessmentMetrics**](BodyAssessmentMetrics.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
