# HealthMetricsConsentView

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**purpose** | [**HealthMetricsPurpose**](HealthMetricsPurpose.md) |  |
**decision** | [**HealthMetricsConsentDecision**](HealthMetricsConsentDecision.md) |  |
**effectiveAccess** | [**HealthMetricsEffectiveAccess**](HealthMetricsEffectiveAccess.md) |  |
**revision** | **String** | Revisão do consentimento; &#x60;If-Match&#x60; de &#x60;setStudentHealthMetricsConsent&#x60; a ecoa verbatim. &#x60;0&#x60; enquanto nenhum ato foi gravado. |
**asOf** | **Date** | Instante do servidor em que este estado foi projetado. |
**acceptedDocumentVersion** | **String** | Versão do documento do último &#x60;GRANTED&#x60;; só presente com &#x60;decision&#x60; &#x60;GRANTED&#x60;. | [optional]
**presentation** | [**HealthMetricsDocumentPresentation**](HealthMetricsDocumentPresentation.md) |  | [optional]
**deletedSummaryCount** | **Int** | Resumos de intensidade apagados nesta transação; só presente no &#x60;200&#x60; de um PUT &#x60;REVOKED&#x60;, &#x60;0&#x60; na repetição e enquanto a tabela de resumos não existe. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)
