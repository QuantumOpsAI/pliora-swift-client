# CreatePersonalStudentBodyAssessmentRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**measuredOn** | **Date** | Data civil ISO em que a medição ocorreu, não futura em relação ao relógio do servidor na &#x60;timeZone&#x60; enviada — preservada como enviada. |
**timeZone** | **String** | Zona IANA da data civil declarada — armazenada com ela. |
**method** | [**BodyAssessmentMethod**](BodyAssessmentMethod.md) |  |
**methodDescription** | **String** | Texto após trim, exigido somente com &#x60;method: OTHER&#x60; e proibido nos demais métodos — a regra é do schema, não da prosa. | [optional]
**_protocol** | [**BodyAssessmentProvenance**](BodyAssessmentProvenance.md) | Obrigatório com method SKINFOLDS; opcional nos demais. | [optional]
**device** | [**BodyAssessmentProvenance**](BodyAssessmentProvenance.md) | Obrigatório com method BIOIMPEDANCE; opcional nos demais. | [optional]
**metrics** | [**BodyAssessmentMetrics**](BodyAssessmentMetrics.md) |  |

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
