# BodyAssessmentView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**assessmentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**relationshipId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**studentId** | **String** | Identificador público opaco. O cliente não deve inferir semântica, ordem ou tipo interno. |
**authorId** | **String** | Conta opaca do personal autor — resolvida no servidor, imutável. |
**origin** | [**BodyAssessmentOrigin**](BodyAssessmentOrigin.md) |  |
**measuredOn** | **Date** | Data civil original da medição, preservada como enviada. |
**timeZone** | **String** | Zona IANA original da data civil — preservada com ela. |
**method** | [**BodyAssessmentMethod**](BodyAssessmentMethod.md) |  |
**methodDescription** | **String** | Presente somente com method OTHER. | [optional]
**_protocol** | [**BodyAssessmentProvenance**](BodyAssessmentProvenance.md) | Presente obrigatoriamente com method SKINFOLDS. | [optional]
**device** | [**BodyAssessmentProvenance**](BodyAssessmentProvenance.md) | Presente obrigatoriamente com method BIOIMPEDANCE. | [optional]
**metrics** | [**BodyAssessmentMetrics**](BodyAssessmentMetrics.md) |  |
**recordedAt** | **Date** | Instante UTC de registro, do servidor — também a chave de ordenação. |
**revision** | **String** | Revisão opaca do registro — sempre &#x60;1&#x60;, porque o registro é imutável. &#x60;If-Match&#x60; de &#x60;correctPersonalStudentBodyAssessment&#x60; a ecoa sobre o predecessor. |
**supersedesId** | **String** | Predecessor desta correção, somente em registros criados por &#x60;correctPersonalStudentBodyAssessment&#x60; — a cadeia é linear e nunca bifurca. | [optional]
**correctionReason** | **String** | Justificativa simples gravada com a correção — só em correções. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
